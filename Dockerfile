FROM openjdk:12-alpine
COPY /home/supriyap595/.m2/repository/com/demo/mobilebank/account-transaction-service/1.0.0/account-transaction-service-1.0.0.jar
CMD ["java" , "-jar", "/AccountMicroservice1.jar"]
