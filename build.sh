git clone https://github.com/suhasp58/data-pusher.git
git clone https://github.com/suhasp58/input-data.git

#cd build_sc/data-pusher/src/main/java/com/suhas
#sed -i 's/"192.168.195.233"/"<yourip>"/g' controller.java

cd data-pusher
mvn clean install
cd ..

docker build -t data-pusher-service1:v1 ./input-data
sed -e 's/jsonfile1.txt/jsonfile2.txt/g' -e 's/-Dserver.port=8081/-Dserver.port=8082/g' -e 's/8081/8082/g' ./input-data/Dockerfile
docker build -t data-pusher-service2:v1 ./input-data
sed -e 's/jsonfile2.txt/jsonfile3.txt/g' -e 's/-Dserver.port=8082/-Dserver.port=8083/g' -e 's/8082/8083/g' ./input-data/Dockerfile
docker build -t data-pusher-service3:v1 ./input-data
sed  -e 's/jsonfile3.txt/jsonfile4.txt/g' -e 's/-Dserver.port=8083/-Dserver.port=8084/g' -e 's/8083/8084/g'  ./input-data/Dockerfile
docker build -t data-pusher-service4:v1 ./input-data

cd input-data 
docker-compose up 
