git clone https://github.com/suhasp58/data-pusher.git
git clone https://github.com/suhasp58/File.git

#cd build_sc/data-pusher/src/main/java/com/suhas
#sed -i 's/"192.168.195.233"/"<yourip>"/g' controller.java

cd build_sc/data-pusher
mvn clean install

cp docker-compose.yml build_sc/docker-compose.yml

cd build_sc
docker-compose up --build
