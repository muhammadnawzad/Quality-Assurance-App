<br/>
<p align="left">
  <h3 align="center">Quality Assurance App</h3>

  <p align="center">QA Engineers will need a way to communicate with software developers when conducting quality assurance processes. This includes asking questions and getting answers from the development team. QA engineers will also need to know what answer is the best answer so that they can use it as a reference for future occurrences.
  </p>
  <ul>
    <li>The API should allow users to register using an email and a password.</li>
    <li>The API should allow users to log in using their email and password.</li>
    <li>The API should allow authenticated users with the role of qa-engineer to create a question.
</li>
    <li>The API should allow authenticated users with the role of software-engineer to answer questions. 
</li>
    <li>The API should allow qa-engineers to choose an answer as the best answer.</li>
  </ul>
</p>


## Used Technologies

- Ruby
- Rails
- postgresql
- Docker
- JWT Authentication (Using JWT)
- JSONAPI Convention (Using Jsonapi Rb)
- Cancancan Authorization (Using Cancancan)
- Password Hashing (Using Bcrypt)


## Instructions and Prerequisites

- dotenv-rails
- pg 1.1
- puma 5.0
- bcrypt 3.1
- jwt 2.4
- cancancan 3.4
- jsonapi-rails 0.4.1
- Ruby 3.1.2

```
DATABASE__HOST=localhost
DATABASE__USERNAME=
DATABASE__PASSWORD=
DATABASE__PORT=5432
DATABASE__NAME=
```

## license

This project has no licence.
