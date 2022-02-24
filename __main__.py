import random

from game.casting.actor import Actor
from game.casting.gem import Gem

from game.directing.director import Director

from game.services.keyboard_service import KeyboardService
from game.services.video_service import VideoService

from game.shared.color import Color
from game.shared.point import Point


FRAME_RATE = 12
MAX_X = 900
MAX_Y = 600
CELL_SIZE = 15
FONT_SIZE = 15
COLS = 60
ROWS = 40
CAPTION = "Greed"
WHITE = Color(255, 255, 255)
DEFAULT_ARTIFACTS = 40
DEFAULT_ROCKS = 25

def main():
    # create the cast
    cast = {}

    # create the robot
    robot = Actor("#", FONT_SIZE, WHITE, Point(int(MAX_X / 2), MAX_Y - CELL_SIZE))
    cast["robots"] =  [ robot ]

    cast["artifacts"] = []
    for _ in range(DEFAULT_ARTIFACTS):
        text = "*"
        position = Point(random.randint(1, COLS - 1), random.randint(1, ROWS - 1)) * CELL_SIZE

        color = Color(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))

        artifact = Gem(
                text,
                FONT_SIZE,
                color,
                position,
                velocity=(2 * Point(0, 1) * random.random()))

        cast["artifacts"].append(artifact)
    cast["banner"] = [ Actor("", FONT_SIZE, WHITE, Point(CELL_SIZE, 0)) ]

    cast["rocks"] = []
    for _ in range(DEFAULT_ROCKS):
        text = "0"
        position = Point(random.randint(1, COLS - 1), random.randint(1, ROWS -
            1)) * CELL_SIZE

        color = Color(random.randint(0, 255), random.randint(0, 255),
                random.randint(0, 255))

        rock = Gem(
                text,
                FONT_SIZE,
                color,
                position,
                velocity=(2 * Point(0, 1) * random.random()))

        cast["rocks"].append(rock)

    # start the game
    keyboard_service = KeyboardService(CELL_SIZE)
    video_service = VideoService(CAPTION, MAX_X, MAX_Y, CELL_SIZE, FRAME_RATE)
    director = Director(keyboard_service, video_service)
    director.start_game(cast)


if __name__ == "__main__":
    main()
