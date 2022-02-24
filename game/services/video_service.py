import pyray


class VideoService:
    """Outputs the game state. The responsibility of the class of objects is to draw the game state 
    on the screen. 
    """

    def __init__(self, caption, width, height, cell_size, frame_rate, debug = False):
        """Constructs a new VideoService using the specified debug mode.
        
        Args:
            debug (bool): whether or not to draw in debug mode.
        """
        self.caption = caption
        self.width = width
        self.height = height
        self.cell_size = cell_size
        self.frame_rate = frame_rate
        self.debug = debug

    def close_window(self):
        """Closes the window and releases all computing resources."""
        pyray.close_window()

    def clear_buffer(self):
        """Clears the buffer in preparation for the next rendering. This method should be called at
        the beginning of the game's output phase.
        """
        pyray.begin_drawing()
        pyray.clear_background(pyray.BLACK)
        if self.debug == True:
            self._draw_grid()
    
    def draw_actor(self, actor):
        """Draws the given actor's text on the screen.

        Args:
            actor (Actor): The actor to draw.
        """ 
        text = actor.text
        x = actor.position.x
        y = actor.position.y
        font_size = actor.font_size
        color = actor.color.to_tuple()
        pyray.draw_text(text, x, y, font_size, color)

    def draw_actors(self, actors):
        """Draws the text for the given list of actors on the screen.

        Args:
            actors (list): A list of actors to draw.
        """ 
        for actor in actors:
            self.draw_actor(actor)
    
    def flush_buffer(self):
        """Copies the buffer contents to the screen. This method should be called at the end of
        the game's output phase.
        """ 
        pyray.end_drawing()

    def is_window_open(self):
        """Whether or not the window was closed by the user.

        Returns:
            bool: True if the window is closing; false if otherwise.
        """
        return not pyray.window_should_close()

    def open_window(self):
        """Opens a new window with the provided title.

        Args:
            title (string): The title of the window.
        """
        pyray.init_window(self.width, self.height, self.caption)
        pyray.set_target_fps(self.frame_rate)

    def _draw_grid(self):
        """Draws a grid on the screen."""
        for y in range(0, self.height, self.cell_size):
            pyray.draw_line(0, y, self.width, y, pyray.GRAY)
        for x in range(0, self.width, self.cell_size):
            pyray.draw_line(x, 0, x, self.height, pyray.GRAY)
