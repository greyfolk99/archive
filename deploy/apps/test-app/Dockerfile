# 11
FROM openjdk:11-jre-slim
ARG PROJECT_NAME
ARG PROJECT_VERSION
ARG JAR_NAME=$PROJECT_NAME-$PROJECT_VERSION.jar
ARG FILE_PATH=temp/$JAR_NAME
ARG APP_CONF=temp/application.yml
COPY ${FILE_PATH} ${JAR_NAME}
COPY ${APP_CONF} application.yml
ENV FILE_NAME=$JAR_NAME
CMD java -jar -Xms1024m -Xmx1024m -Dspring.profiles.active=prod $(echo $FILE_NAME)
