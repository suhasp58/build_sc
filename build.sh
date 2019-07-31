git clone https://github.com/suhasp58/data-pusher.git
git clone https://github.com/suhasp58/File.git

cd /build_sc/data-pusher/src/main/java/com/suhas
sed -i 's/"192.168.195.233"/"<yourip>"/g' controller.java

mkdir /build_sc/data-pusher/service1  /build_sc/data-pusher/service2 /build_sc/data-pusher/service3 /build_sc/data-pusher/service4

cd /build_sc/data-pusher/service1

echo 'FROM openjdk:8-jdk'>Dockerfile
echo 'COPY springredis.jar /usr/app/'>>Dockerfile
echo 'COPY JSONFile1.txt /test/' >>Dockerfile
echo 'WORKDIR /usr/app'>>Dockerfile
echo 'EXPOSE 8080'>>Dockerfile
echo 'ENTRYPOINT ["java","-jar","-Dserver.port=8081","springredis.jar","8081", "5000","/test/JSONFile1.txt"]' >>Dockerfile

cd /build_sc/data-pusher/service2

echo 'FROM openjdk:8-jdk'>Dockerfile
echo 'COPY springredis.jar /usr/app/'>>Dockerfile
echo 'COPY JSONFile2.txt /test/' >>Dockerfile
echo 'WORKDIR /usr/app'>>Dockerfile
echo 'EXPOSE 8080'>>Dockerfile
echo 'ENTRYPOINT ["java","-jar","-Dserver.port=8082","springredis.jar","8082","5000","/test/JSONFile2.txt"]' >>Dockerfile

cd /build_sc/data-pusher/service3

echo 'FROM openjdk:8-jdk'>Dockerfile
echo 'COPY springredis.jar /usr/app/'>>Dockerfile
echo 'COPY JSONFile3.txt /test/' >>Dockerfile
echo 'WORKDIR /usr/app'>>Dockerfile
echo 'EXPOSE 8080'>>Dockerfile
echo 'ENTRYPOINT ["java","-jar","-Dserver.port=8083","springredis.jar","8083","5000","/test/JSONFile3.txt"]' >>Dockerfile

cd /build_sc/data-pusher/service4

echo 'FROM openjdk:8-jdk'>Dockerfile
echo 'COPY springredis.jar /usr/app/'>>Dockerfile
echo 'COPY JSONFile4.txt /test/' >>Dockerfile
echo 'WORKDIR /usr/app'>>Dockerfile
echo 'EXPOSE 8080'>>Dockerfile
echo 'ENTRYPOINT ["java","-jar","-Dserver.port=8084","springredis.jar","8084","5000","/test/JSONFile4.txt"]' >>Dockerfile

cd /build_sc/data-pusher
mvn clean install
cd target
cp springredis-0.0.1-SNAPSHOT.jar /build_sc/data-pusher/service1/springredis.jar
cp springredis-0.0.1-SNAPSHOT.jar /build_sc/data-pusher/service2/springredis.jar
cp springredis-0.0.1-SNAPSHOT.jar /build_sc/data-pusher/service3/springredis.jar
cp springredis-0.0.1-SNAPSHOT.jar /build_sc/data-pusher/service4/springredis.jar

cd /build_sc/File
cp JSONFile1.txt /build_sc/data-pusher/service1/JSONFile1.txt
cp JSONFile2.txt /build_sc/data-pusher/service2/JSONFile2.txt
cp JSONFile3.txt /build_sc/data-pusher/service3/JSONFile3.txt
cp JSONFile4.txt /build_sc/data-pusher/service4/JSONFile4.txt
cp -r redis /build_sc/redis

cp docker-compose.yml /build_sc/docker-compose.yml

cd /build_sc
docker-compose up --build
