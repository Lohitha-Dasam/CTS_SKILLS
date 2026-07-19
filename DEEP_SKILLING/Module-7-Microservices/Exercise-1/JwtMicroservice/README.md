# Module 7 - Exercise 1

## JWT Authentication Microservice

### Objective

Implement JWT Authentication in ASP.NET Core Web API.

### Concepts Covered

- JWT
- Authentication
- Authorization
- Bearer Token

### Status

Project Created Successfully.

## Exercise 1 - Part 2

### Objective

Configure JWT Authentication.

### Concepts Covered

- JWT
- Authentication
- Token Validation
- LoginModel
- User Model

### Files Created

- LoginModel.cs
- User.cs

### Files Modified

- Program.cs
- appsettings.json

### Result

JWT Authentication configured successfully.

## Exercise 1 – Part 3

### Objective

Generate a JWT token after successful login.

### Concepts Covered

- Login API
- JWT Generation
- Claims
- Signing Credentials

### Files Created

- Controllers/AuthController.cs

### Result

JWT token generated successfully after login.

## Exercise 2 - Secure API Endpoint

### Objective

Protect API endpoints using JWT Authentication.

### Concepts Covered

- Authorize Attribute
- JWT Validation
- Protected APIs
- Unauthorized Access

### Files Created

- Controllers/SecureController.cs

### Result

Protected endpoint accessible only with a valid JWT.

## Exercise 3 - Role-Based Authorization

### Objective

Implement role-based authorization using JWT.

### Concepts Covered

- Role Claims
- Admin Authorization
- JWT Roles
- Authorize(Roles)

### Files Created

- Controllers/AdminController.cs

### Files Modified

- Controllers/AuthController.cs

### Result

Only users with the Admin role can access the dashboard.

## Exercise 4 – JWT Expiry Handling

### Objective

Handle expired JWT tokens gracefully.

### Concepts Covered

- JWT Expiration
- Authentication Events
- SecurityTokenExpiredException
- Unauthorized Response

### Files Modified

- Program.cs

### Result

Expired JWT tokens return a custom unauthorized response.



