# Module 6 – ASP.NET Core Web API

## Exercise 1 – First Web API

### Objective

Create an ASP.NET Core Web API application using Controllers.

### Concepts Covered

- REST API
- Controller
- Routing
- GET
- POST
- PUT
- DELETE
- Swagger

### Files Created

- Controllers/ValuesController.cs

### Files Modified

- Program.cs

### Outcome

Successfully created a Controller-based ASP.NET Core Web API and tested all HTTP methods using Swagger.

---

# Exercise 2 - Swagger and Postman

## Objective

Configure Swagger and test the Employee Web API using Swagger and Postman.

## Concepts Covered

- Swagger
- OpenAPI
- Controllers
- HTTP GET
- HTTP POST
- HTTP PUT
- HTTP DELETE
- Route Attribute
- Postman

## Files Created

- Controllers/EmployeeController.cs

## Files Modified

- Program.cs

## Output

Swagger successfully displayed all Employee endpoints and CRUD operations were tested.

## Exercise 3 – Models, Authorization Filter & Exception Filter

### Objective

Create custom models and implement custom authorization and exception filters.

### Concepts Covered

- Model Classes
- FromBody
- ProducesResponseType
- ActionFilterAttribute
- IExceptionFilter
- Exception Logging
- Authorization Filter

### Files Created

- Models/Employee.cs
- Models/Department.cs
- Models/Skill.cs
- Filters/CustomAuthFilter.cs
- Filters/CustomExceptionFilter.cs

### Files Modified

- EmployeeController.cs
- Program.cs

### Outcome

Implemented model binding, custom authorization, custom exception handling, and exception logging.


## Exercise 4 – Update Employee (PUT)

### Objective

Implement an HTTP PUT endpoint to update employee data.

### Concepts Covered

- HttpPut
- FromBody
- ActionResult<T>
- BadRequest
- Swagger Testing

### Files Modified

- Controllers/EmployeeController.cs

### Output

Successfully updated employee details using the PUT API and validated invalid employee IDs.

## Exercise 5 – Part 1

### Objective

Configure JWT Authentication in ASP.NET Core Web API.

### Concepts Covered

- JWT Authentication
- JwtBearer
- Authentication Middleware
- Token Validation

### Files Modified

- Program.cs

### Output

JWT Authentication configured successfully.

## Exercise 5 – Part 2

### Objective

Generate a JWT token using an AuthController.

### Concepts Covered

- JwtSecurityToken
- Claims
- SigningCredentials
- AllowAnonymous

### Files Created

- Controllers/AuthController.cs

### Output

JWT token generated successfully with UserId and Role claims.

## Exercise 5 – Part 3

### Objective

Secure the Employee API using JWT Authentication.

### Concepts Covered

- Authorize
- JWT Authentication
- Bearer Token
- Unauthorized (401)

### Files Modified

- Controllers/EmployeeController.cs

### Output

Employee API secured using JWT Authentication.

## Exercise 5 – JWT Authentication & Authorization

### Objective

Implement JWT Authentication and Role-Based Authorization.

### Concepts Covered

- JWT Authentication
- Claims
- Roles
- Authorize Attribute
- AllowAnonymous
- Token Expiration
- Bearer Token

### Files Created

- Controllers/AuthController.cs

### Files Modified

- Program.cs
- Controllers/EmployeeController.cs

### Output

Successfully implemented JWT Authentication and Role-Based Authorization.

# Module 6 – Exercise 6

## Kafka Chat Application

### Objective

Create a Chat Application using Apache Kafka and C#.

### Concepts Covered

- Apache Kafka
- Kafka Producer
- Kafka Consumer
- Topics
- Message Streaming

### Files

- Program.cs
- KafkaChatApplication.csproj

### Status

Exercise 6 - Part 1 Completed Successfully.

## Exercise 6 - Kafka Chat Application

### Objective

Implement a Kafka Producer and Consumer using C#.

### Concepts Covered

- Kafka Producer
- Kafka Consumer
- Topic
- Bootstrap Server
- Message Streaming

### Files Created

- Producer.cs
- Consumer.cs

### Result

Kafka chat application implemented.