-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE Pancakes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    recipient TEXT NOT NULL,
    iban TEXT NOT NULL,
    email TEXT NOT NULL,
    amount INT NOT NULL,
    description TEXT NOT NULL,
    forwhat TEXT NOT NULL,
    notes TEXT DEFAULT NULL
);
