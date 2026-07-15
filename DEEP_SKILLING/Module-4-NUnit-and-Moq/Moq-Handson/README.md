# Moq Hands-on

## Overview

This hands-on demonstrates how to use the Moq framework to isolate external dependencies during unit testing. Mock objects are used to replace real implementations such as mail servers, file systems, and databases, allowing tests to run quickly and independently.

---

## Objectives

- Understand Mocking in Unit Testing
- Understand Test Doubles
- Understand Dependency Injection
- Learn Constructor Injection
- Create Mock Objects using Moq
- Isolate External Dependencies
- Write Unit Tests using NUnit and Moq

---

## Exercises

### Exercise 1 – Mock Mail Server

**Library:** CustomerCommLib

#### Concepts Covered

- IMailSender
- Mock Objects
- Constructor Injection
- Setup()
- Verify()

#### Outcome

Mocked the mail server and verified email sending without connecting to a real SMTP server.

---

### Exercise 2 – Mock File System

**Library:** MagicFilesLib

#### Concepts Covered

- IDirectoryExplorer
- Mock File System
- ICollection
- Setup()
- Verify()

#### Outcome

Mocked file system access and tested file retrieval without accessing the actual disk.

---

### Exercise 3 – Mock Database

**Library:** PlayersManagerLib

#### Concepts Covered

- IPlayerMapper
- Mock Database
- Dependency Injection
- Setup()
- Verify()
- Exception Testing

#### Outcome

Mocked database operations and tested player registration without connecting to SQL Server.

---

## Technologies Used

- C#
- NUnit
- Moq
- Dependency Injection

---

## Learning Outcome

After completing this hands-on, I gained practical experience in:

- Writing isolated unit tests
- Creating mock objects
- Testing code with external dependencies
- Applying Dependency Injection
- Improving testability using the Moq framework