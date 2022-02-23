from .actor import Actor


class Artifact(Actor):
    """
    An item of cultural or historical interest. 
    
    The responsibility of an Artifact is to provide a message about itself.

    Attributes:
        message (string): A short description about the artifact.
    """
    def __init__(self, message=None, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.message = message
