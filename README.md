# Api gateway

API gateway is an API management tool that sits between a client and a collection of backend services,
The api gateway is exposed via the following endpoint:

* http://localhost:8080/

The Spring admin Microservice provides also an actuator where you can find all the information,
The actuator is accessible via the following link:

* http://localhost:8080/actuator

# Setup

The project is strictly connected with its parent project "Spring-SalaryCalculator-Microservices",
Please make sure to clone the parent repository.

* Required:
    * Docker


* To create a container in Docker, follow the below instructions:

    * Go to the folder: Spring-SalaryCalculator-Microservices
    * Create a jar file running "gradle build" or "gradle bootJar"
    * execute: docker-compose -f docker-compose.yml up