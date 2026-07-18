# Lab 1 – Understanding ORM with EF Core

## Objective

Understand Object Relational Mapping (ORM) and how Entity Framework Core simplifies database operations.

## Concepts Covered

- ORM
- Entity Framework Core
- EF Core vs EF Framework
- EF Core 8 Features
- SQL Server Integration

## Project

RetailInventory

## Technologies Used

- C#
- .NET 8
- Entity Framework Core 8
- SQL Server

## Outcome

Created the RetailInventory console application and installed the required EF Core packages for future labs.

## Lab 2 – Setting Up DbContext

### Objective

Create entity classes and configure Entity Framework Core with SQL Server.

### Concepts Covered

- Entity Classes
- DbContext
- DbSet
- SQL Server Connection
- Navigation Properties

### Files Created

- Models/Category.cs
- Models/Product.cs
- Data/AppDbContext.cs

### Outcome

Successfully created entity models and configured the EF Core database context.

## Lab 3 – EF Core Migrations

### Objective

Create the initial migration and generate the SQL Server database.

### Concepts Covered

- EF Core CLI
- Initial Migration
- Database Update
- Schema Generation

### Commands Used

- dotnet ef migrations add InitialCreate
- dotnet ef database update

### Outcome

Successfully generated the migration and created the RetailInventory database.

## Lab 4 – Insert Initial Data

### Objective

Insert initial categories and products into the database using Entity Framework Core.

### Concepts Covered

- AddAsync()
- AddRangeAsync()
- SaveChangesAsync()

### Records Inserted

Categories:
- Electronics
- Groceries

Products:
- Laptop
- Rice Bag

### Outcome

Successfully inserted initial records into the RetailInventory database.

## Lab 5 – Retrieving Data

### Objective

Retrieve data from the database using Entity Framework Core.

### Concepts Covered

- ToListAsync()
- FindAsync()
- FirstOrDefaultAsync()

### Operations Performed

- Retrieve all products
- Find product by ID
- Retrieve first product with price greater than ₹50,000

### Outcome

Successfully queried data using asynchronous EF Core methods.

## Lab 6 – Update and Delete Records

### Objective

Perform update and delete operations using Entity Framework Core.

### Concepts Covered

- FindAsync()
- Entity Tracking
- SaveChangesAsync()
- Remove()

### Operations Performed

- Updated Laptop price from ₹75,000 to ₹80,000
- Deleted Rice Bag product

### Outcome

Successfully performed Update and Delete operations using EF Core.


## Lab 7 – Writing LINQ Queries

### Objective

Learn how to query data using LINQ in Entity Framework Core.

### Topics Covered

- Where()
- OrderByDescending()
- Select()
- DTO Projection

### Files Added

- DTOs/ProductDTO.cs

### Outcome

Successfully filtered, sorted, and projected product data using LINQ.


## Lab 8 – Managing Migrations and Schema Changes

### Objective

Modify the existing Product entity by adding a new property (`StockQuantity`) and update the SQL Server database schema using Entity Framework Core Migrations.

### Concepts Covered

- Entity Modification
- Schema Changes
- EF Core Migrations
- Database Update
- Code-First Approach

### Changes Made

- Added `StockQuantity` property to the `Product` entity.
- Created a new migration named **AddStockQuantity**.
- Updated the SQL Server database using `dotnet ef database update`.

### Commands Used

```powershell
dotnet build
dotnet ef migrations add AddStockQuantity
dotnet ef database update
```

### Files Modified

- Models/Product.cs
- Program.cs

### Files Generated

- Migrations/*AddStockQuantity.cs*
- Migrations/*AddStockQuantity.Designer.cs*

### Outcome

- Successfully modified the Product model.
- Successfully generated a new migration.
- Successfully updated the database schema.
- Added the **StockQuantity** column to the **Products** table.


## Lab 9 – Seeding Data During Migrations

### Objective

Seed initial data into the database using Entity Framework Core `HasData()`.

### Topics Covered

- ModelBuilder
- HasData()
- Data Seeding
- EF Core Migrations

### Seeded Data

**Categories**
- Electronics
- Groceries

**Products**
- Smartphone
- Wheat Flour

### Commands Used

```powershell
dotnet build
dotnet ef migrations add SeedInitialData
dotnet ef database update
```

### Outcome

Successfully configured initial data seeding using EF Core migrations.

## Lab 10 – Data Loading

### Objective

Understand different techniques used to load related data in Entity Framework Core.

### Concepts Covered

- Eager Loading
- Explicit Loading
- Lazy Loading (Concept)

### Methods Used

- Include()
- Entry()
- Collection()
- LoadAsync()

### Files Modified

- Program.cs

### Outcome

Successfully demonstrated Eager Loading and Explicit Loading. Understood the concept of Lazy Loading in Entity Framework Core.


## Lab 11 – Configuring Relationships

### Objective

Configure One-to-One and Many-to-Many relationships using Entity Framework Core.

### Concepts Covered

- One-to-One Relationship
- Many-to-Many Relationship
- Navigation Properties
- Fluent API

### Files Added

- Models/Supplier.cs
- Models/Tag.cs

### Files Modified

- Models/Product.cs
- Data/AppDbContext.cs
- Program.cs

### Outcome

Successfully configured One-to-One and Many-to-Many relationships using Entity Framework Core Fluent API.


## Lab 12 – Handling Circular References

### Objective

Avoid circular references while retrieving related entities using DTO Projection.

### Concepts Covered

- Circular References
- DTO Projection
- Select()
- Include()

### Files Added

- DTOs/ProductSummaryDTO.cs

### Files Modified

- Program.cs

### Outcome

Successfully prevented circular reference issues by projecting entity data into DTOs.

## Lab 13 – Performance Optimization

### Objective

Learn how to improve Entity Framework Core query performance using AsNoTracking.

### Concepts Covered

- AsNoTracking()
- Read-only Queries
- Query Performance
- Tracking vs Non-Tracking

### Files Modified

- Program.cs

### Outcome

Successfully demonstrated performance optimization using AsNoTracking for read-only operations.

## Lab 14 – Batch Processing and Bulk Operations

### Objective

Perform batch insert, update, and delete operations using Entity Framework Core.

### Concepts Covered

- AddRangeAsync()
- SaveChangesAsync()
- RemoveRange()
- Batch Processing

### Files Modified

- Program.cs

### Outcome

Successfully demonstrated batch insert, update, and delete operations using Entity Framework Core.

## Lab 15 – Optimistic Concurrency

### Objective

Implement optimistic concurrency control using the RowVersion column.

### Concepts Covered

- Optimistic Concurrency
- RowVersion
- Timestamp Attribute
- DbUpdateConcurrencyException

### Files Modified

- Models/Product.cs
- Program.cs

### Outcome

Successfully implemented optimistic concurrency handling using the RowVersion concurrency token.