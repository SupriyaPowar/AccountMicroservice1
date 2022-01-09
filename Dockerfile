FROM adoptopenjdk:11-jre-hotspot as builder
WORKDIR app
ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} application.jar
COPY ${JAR_FILE} app.jar
RUN java -Djarmode=layertools -jar app.jar extract

FROM adoptopenjdk:11-jre-hotspot
WORKDIR app
COPY --from=builder app/dependencies/ ./
COPY --from=builder app/snapshot-dependencies/ ./
COPY --from=builder app/spring-boot-loader/ ./
COPY --from=builder app/application/ ./
ENTRYPOINT ["java", "com.demo.mobilebank.account.AccountServiceApplication"]
CMD ["--spring.profiles.active=live"]
