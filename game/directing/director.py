#import keyboard_service
from ..services.keyboard_service import KeyboardService
from ..services.video_service import VideoService

class Director:
    """A person who directs the game. 

    The responsibility of a Director is to control the sequence of play.

    Attributes:
        _keyboard_service (KeyboardService): For getting directional input.
        _video_service (VideoService): For providing video output.
    """

    def __init__(self, keyboard_service: KeyboardService, video_service: VideoService):
        """Constructs a new Director using the specified keyboard and video services.

        Args:
            keyboard_service (KeyboardService): An instance of KeyboardService.
            video_service (VideoService): An instance of VideoService.
        """
        self._keyboard_service = keyboard_service
        self._video_service = video_service

    def start_game(self, cast):
        """Starts the game using the given cast. Runs the main game loop.

        Args:
            cast (Cast): The cast of actors.
        """
        self._video_service.open_window()
        while self._video_service.is_window_open():
            self._get_inputs(cast)
            self._do_updates(cast)
            self._do_outputs(cast)
        self._video_service.close_window()

    def _get_inputs(self, cast):
        """Gets directional input from the keyboard and applies it to the robot.

        Args:
            cast (Cast): The cast of actors.
        """
        robot = cast[ "robots" ][0]
        velocity = self._keyboard_service.get_direction()
        robot.velocity = velocity

    def _do_updates(self, cast):
        """Updates the robot's position and resolves any collisions with artifacts.

        Args:
            cast (Cast): The cast of actors.
        """
        robot = cast[ "robots" ][0]
        artifacts = cast[ "artifacts" ]

        max_x = self._video_service.width
        max_y = self._video_service.height
        robot.update(max_x, max_y)

        for artifact in artifacts:
            artifact.update(max_x, max_y)
            if robot.position == artifact.position:
                pass

    def _do_outputs(self, cast):
        """Draws the actors on the screen.

        Args:
            cast (Cast): The cast of actors.
        """
        self._video_service.clear_buffer()
        actors = [ actor for actors in cast.values() for actor in actors]
        self._video_service.draw_actors(actors)
        self._video_service.flush_buffer()
