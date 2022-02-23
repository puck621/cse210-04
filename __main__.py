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


def main():
    # create the cast
    cast = {}

    # create the robot
    x = int(MAX_X / 2)
    y = int(MAX_Y / 2)
    position = Point(x, y)

    robot = Actor("#", FONT_SIZE, WHITE, position)
    cast["robots"] =  [ robot ]

    cast["artifacts"] = []
    for _ in range(DEFAULT_ARTIFACTS):
        text = chr(random.randint(33, 126))

        x = random.randint(1, COLS - 1)
        y = random.randint(1, ROWS - 1)
        position = Point(x, y)
        position = position * CELL_SIZE

        r = random.randint(0, 255)
        g = random.randint(0, 255)
        b = random.randint(0, 255)
        color = Color(r, g, b)

        artifact = Gem( text, FONT_SIZE, color, position, velocity=(Point(0, 1) * random.random()))
        cast["artifacts"].append(artifact)

    # start the game
    keyboard_service = KeyboardService(CELL_SIZE)
    video_service = VideoService(CAPTION, MAX_X, MAX_Y, CELL_SIZE, FRAME_RATE)
    director = Director(keyboard_service, video_service)
    director.start_game(cast)


if __name__ == "__main__":
    main()
