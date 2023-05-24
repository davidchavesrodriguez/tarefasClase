/* global use, db */
// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use('davidcr');

// Search for documents in the current collection.
db.pokemon.updateOne(
    {"name.english": "Squirtle"},
    {
        $set: {
            "description": "Squirtle's shell is not merely used for protection"
        }
    }
);