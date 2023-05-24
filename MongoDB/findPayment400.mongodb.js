// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use('davidcr');

// Create a new document in the collection.
// Find a record in transactions where total payment amount is 400.
db.getCollection('transaction')
    .find(
        {
            "Payment.Total": { $gt: 400 }
        }
    );