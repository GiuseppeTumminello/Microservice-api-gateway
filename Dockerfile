FROM gradle:7.4-jdk11-alpine AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

FROM openjdk:11-jre-slim
EXPOSE 8098
COPY --from=build /home/gradle/src/build/libs/*.jar ./app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
CMD java $JAVA_OPTIONS -jar app.jar


#FROM openjdk:8-jre-alpine AS runtime
#WORKDIR /app
#EXPOSE 80
#
## Prepare build workspace.
#FROM gradle:7.4-jdk-alpine AS sdk
#WORKDIR /build-workspace
#
## Setup build workspace.
#USER root
#RUN chown -R gradle .
#USER gradle
#
## Copy.
#COPY build.gradle .
#COPY src ./src
#
## Build, Test and publish.
#RUN gradle clean bootJar

# App image.
#FROM runtime
#COPY --from=sdk /build-workspace/build/libs/*.jar ./app.jar
#ENTRYPOINT ["java", "-jar", "app.jar"]

