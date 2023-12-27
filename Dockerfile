FROM ubuntu
RUN echo "JJ-demo practice project 1"
CMD date 
ENTRYPOINT ["echo", "hello world"]
#docker to clone a git repository.

FROM alpine/git 
WORKDIR /app
RUN git clone https://github.com/Geofrey498/liontech-online-library-web-app.git 
#maven

FROM maven:3.9-amazoncorretto-21-al2023 as build 
WORKDIR /app
COPY --from=repo /app/liontech-online-library-web-app /app/
RUN mvn test
RUN mvn install
RUN mvn clean package 

