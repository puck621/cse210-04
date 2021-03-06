#import keyboard_service
from ..services.keyboard_service import KeyboardService
from ..services.video_service import VideoService
from ..casting.cast import Cast

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

    def start_game(self, cast: Cast):
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

    def _get_inputs(self, cast: Cast):
        """Gets directional input from the keyboard and applies it to the robot.

        Args:
            cast (Cast): The cast of actors.
        """
        robot = cast.get_first_actor("robots")
        velocity = self._keyboard_service.get_direction()
        robot.velocity = velocity

    def _do_updates(self, cast: Cast):
        """Updates the robot's position and resolves any collisions with artifacts.

        Args:
            cast (Cast): The cast of actors.
        """
        robot = cast.get_first_actor("robots")
        artifacts = cast.get_actors("artifacts")
        rocks = cast.get_actors("rocks")

        max_x = self._video_service.width
        max_y = self._video_service.height
        cast.update(max_x, max_y)

        banner = cast.get_first_actor("banner")
        banner.text = "Score: " + str(robot.score)

        for artifact in artifacts:
            if robot.position == artifact.position:
                cast.remove_actor("artifacts", artifact)
                robot.score += 1

        for rock in rocks:
            if robot.position == rock.position:
                robot.score -= 1
                cast.remove_actor("rocks", rock)

    def _do_outputs(self, cast: Cast):
        """Draws the actors on the screen.

        Args:
            cast (Cast): The cast of actors.
        """
        self._video_service.clear_buffer()
        actors = cast.get_all_actors()
        self._video_service.draw_actors(actors)
        self._video_service.flush_buffer()
