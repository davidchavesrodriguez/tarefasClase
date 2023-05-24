// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use('davidcr');

// Create a new document in the collection.
db.getCollection('bookstore')
    .find(
        {
            "year": { "$gte": 2003, "$lte": 2004 }
        }
    );
