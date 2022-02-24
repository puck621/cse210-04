from .actor import Actor

class Player(Actor):
    """
    A player is an actor that can be controlled by the user.
    """
    def __init__(self, *args, **kwargs):
        super().__init__("#", *args, **kwargs)
        self.score = 0

