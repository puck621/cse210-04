from ..shared.color import Color
from ..shared.point import Point


class Actor:
    """A visible, moveable thing that participates in the game. 
    
    The responsibility of Actor is to keep track of its appearance, position and velocity in 2d 
    space.

    Attributes:
        text (string): The text to display
        font_size (int): The font size to use.
        color (Color): The color of the text.
        position (Point): The screen coordinates.
        velocity (Point): The speed and direction.
    """
    def __init__(self, text="", font_size=15, color=Color(255, 255, 255), position=Point(0, 0), velocity=Point(0, 0)):
        """Constructs a new Actor."""
        self.text = text
        self.font_size = font_size
        self.color = color
        self.position = position
        self._position = position
        self.velocity = velocity

    def update(self, max_x, max_y, cell_size = 15):
        """Moves the actor to its next position according to its velocity. Will wrap the position 
        from one side of the screen to the other when it reaches the given maximum x and y values.
        
        Args:
            max_x (int): The maximum x value.
            max_y (int): The maximum y value.
        """
        self._position = (self._position + self.velocity ) % Point(max_x, max_y)
        self.position = self._position // cell_size * cell_size # round to nearest cell size
        self.position = Point(int(self.position.x), int(self.position.y))
