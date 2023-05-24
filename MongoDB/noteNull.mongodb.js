// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use('davidcr');

// Create a new document in the collection.
// Find a record in transacaions collection where note is null or missing
db.getCollection('transaction').find(
    {
        "Note": null
    }
);
