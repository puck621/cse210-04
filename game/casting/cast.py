from .actor import Actor
from typing import Dict, List


class Cast:
    """A collection of actors.

    The responsibility of a cast is to keep track of a collection of actors. It has methods for 
    adding, removing and getting them by a group name.

    Attributes:
        actors (dict): A dictionary of actors { key: group_name, value: a list of actors }
    """

    def __init__(self):
        """Constructs a new Actor."""
        self.actors:Dict[str, List[Actor]] = {}

    def add_actor(self, group:str, actor: Actor):
        """Adds an actor to the given group.

        Args:
            group (string): The name of the group.
            actor (Actor): The actor to add.
        """
        if not group in self.actors.keys():
            self.actors[group] = []

        if not actor in self.actors[group]:
            self.actors[group].append(actor)

    def get_actors(self, group:str) -> List[Actor]:
        """Gets the actors in the given group.

        Args:
            group (string): The name of the group.

        Returns:
            List: The actors in the group.
        """
        results = []
        if group in self.actors.keys():
            results = self.actors[group].copy()
        return results

    def get_all_actors(self) -> List[Actor]:
        """Gets all of the actors in the cast.

        Returns:
            List: All of the actors in the cast.
        """
        results = [actor for actors in self.actors.values() for actor in actors]
        return results

    def get_first_actor(self, group):
        """Gets the first actor in the given group.

        Args:
            group (string): The name of the group.

        Returns:
            List: The first actor in the group.
        """
        result = None
        if group in self.actors.keys():
            result = self.actors[group][0]
        return result

    def remove_actor(self, group, actor):
        """Removes an actor from the given group.

        Args:
            group (string): The name of the group.
            actor (Actor): The actor to remove.
        """
        if group in self.actors:
            self.actors[group].remove(actor)

    def update(self, max_x, max_y):
        actors = self.get_all_actors()
        for actor in actors:
            actor.update(max_x, max_y)


