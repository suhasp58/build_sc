git clone https://github.com/suhasp58/data-pusher.git
#sed -i 's/"192.168.195.233"/"<yourip>"/g' data-pusher/src/main/java/com/suhascontroller.java
cd data-pusher
mvn clean install
cd ..
cp data-pusher/target/springredis-0.0.1-SNAPSHOT.jar data-pusher/input-data/
docker build -t data-pusher-service1:v1 -f ./data-pusher/service-dockerfile .
sed -i -e 's/jsonfile1.txt/jsonfile2.txt/g' -e 's/-Dserver.port=8081/-Dserver.port=8082/g' -e 's/8081/8082/g' ./data-pusher/service-dockerfile
docker build -t data-pusher-service2:v1 -f ./data-pusher/service-dockerfile .
sed -i -e 's/jsonfile2.txt/jsonfile3.txt/g' -e 's/-Dserver.port=8082/-Dserver.port=8083/g' -e 's/8082/8083/g' ./data-pusher/service-dockerfile
docker build -t data-pusher-service3:v1 -f ./data-pusher/service-dockerfile .
sed  -i -e 's/jsonfile3.txt/jsonfile4.txt/g' -e 's/-Dserver.port=8083/-Dserver.port=8084/g' -e 's/8083/8084/g'  ./data-pusher/service-dockerfile
docker build -t data-pusher-service4:v1 -f ./data-pusher/service-dockerfile .
docker build -t redisdb:v1 ./data-pusher/redis-dockerfile .
cd input-data 
docker-compose up 
