// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use('davidcr');

// Create a new document in the collection.
db.getCollection('movies').insertMany(
    [
        {
            "title": "LOTR: The Return of the King",
            "writer": "J.R.R. Tolkien",
            "year": 2003,
            "actor": [
                "Ian McKellen",
                "Viggo Mortensen"
            ]
        },
        {
            "title": "Fight Club",
            "writer": "Chuck Palahniuk",
            "year": 1999,
            "actor": [
                "Brad Pitt",
                "Jared Leto"
            ]
        },
        {
            "title": "Nineteen Eighty-Four",
            "writer": "George Orwell",
            "year": 1984,
            "actor": [
                "John Hurt",
                "Richard Burton",
                "Suzanna Hamilton"
            ]
        },
        {
            "franchise": "Divergent",
            "title": "Divergent",
            "writer": "Verónica Roth",
            "year": 2014,
            "actor": [
                "Shailene Woodley",
                "Theo James"
            ]
        },
        {
            "franchise": "Divergent",
            "title": "Insurgent",
            "writer": "Verónica Roth",
            "year": 2015,
            "actor": [
                "Shailene Woodley",
                "Theo James"
            ]
        },
        {
            "franchise": "Divergent",
            "title": "Allegiant",
            "writer": "Verónica Roth",
            "year": 2016,
            "synopsis": "Evelyn re-closes Chicago's wall, and puts Jeanine's coup supporters on trial for their lives. Johanna turns her back on this, and is followed by many newly christened Allegiants. Tris and Four free Caleb and escape over the wall with Tori, Christina, and Peter. Edgar leads Factionless guards to catch them, killing Tori. Edgar catches them in the wastelands, but unknown soldiers with advanced technology rescue the group",
            "actor": [
                "Shailene Woodley",
                "Theo James"
            ]
        },
        {
            "title": "The Godfather"
        },
        {
            "title": "Casino"
        }
    ]
);
