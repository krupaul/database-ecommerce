# Database Project: E-commerce Management System
### Project Overview
This project involves the design and implementation of a relational database system using MySQL. The goal of this project is to design an efficient database schema, normalize it into 3rd Normal Form (3NF), and implement it in MySQL. It also includes several SQL queries for interaction with the database.
The key aspects of the project include:

- Designing a proper Entity-Relationship (ER) diagram.
- Normalizing the schema to 3rd Normal Form (3NF) for optimal performance and minimal redundancy.
- Implementing the schema into MySQL tables.
- Writing SQL queries for CRUD (Create, Read, Update, Delete) operations and data retrieval.

### Entity-Relationship Diagram
The Entity-Relationship (ER) diagram is the first step in designing the database. It visually represents the system's entities and the relationships between them.

![ER Diagram](https://github.com/user-attachments/assets/d48082c8-d574-4f5e-82b6-b92d263f5fd1)

### Description of the Diagram:
- **Entities**: These represent objects or things within the system, such as `user`, `Order`, `Product`, etc.
- **Relationships**: These represent how entities are connected, such as a `buyer` can place many `Orders`.
- **Attributes**: These are characteristics or properties of the entities, e.g., `userName`, `OrderDate`, etc.
  

### Relational Model Schema
After designing the ER diagram, we convert the entities and relationships into a relational schema, which defines how the data is structured in tables.

![Relational Schema](https://github.com/user-attachments/assets/a341e736-f118-467c-87a2-8bcbdd5b6670)



### 3rd Normal Form (3NF) Conversion

**Normalization Process:**

1. **First Normal Form (1NF)**:
The data is organized into tables, each with a primary key, and all attributes are atomic (indivisible).

2. **Second Normal Form (2NF)**:
We remove partial dependencies, ensuring that non-key attributes depend on the whole primary key.
   
3. **Third Normal Form (3NF)**:
We remove transitive dependencies, ensuring that all non-key attributes depend only on the primary key and not on other non-key attributes.

After applying 3NF, we ensure that:
- Every non-prime attribute is non-transitively dependent on the primary key.
- Redundancy and anomalies are minimized.

### MySQL Implementation
The relational model has been implemented in MySQL. Below is the reverse engineered diagram of Relational database after creating the schema.

![MySQL schema](https://github.com/user-attachments/assets/d9ac46f6-02b5-4e88-917f-bc736e0eaa61)


### SQL queries to interact with the database

![SQL queries 1](https://github.com/user-attachments/assets/eca4a5d1-7f16-4f3e-b259-372ff386fb06)

![SQL queries 2](https://github.com/user-attachments/assets/0eaa0721-c3a1-42a2-80d8-2e755db84373)


### Conclusion
- Designed a robust schema, normalizing it into 3rd Normal Form, and implementing it in MySQL.
- The structure allows efficient storage and retrieval of data while minimizing redundancy and ensuring referential integrity. The included SQL queries demonstrate how to interact with the database for common CRUD operations.
