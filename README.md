# Ft_server
 This is a System Administration subject. This project is a Web Server made with Docker. (42 Login MOUGNOU)
 
 Building an image then Running the container will run a fully functional web server with wordpress and phpmyadmin included. 

# Restart docker
docker-machine restart
eval $(docker-machine env default)

# Build image
docker image build -t maro .

# Clear
docker system prune
docker system prune -a
docker image prune
docker image prune -a

# Run container
docker run -d -p 443:443 -p 80:80 container_id
OR
docker run -d -p 443:443 -p 80:80 -p 8080:8080 -p 3306:3306 -p 33060:33060 container_id
OR
docker run -tid --rm --privileged --name test -p 443:443 -p 80:80 -p 8080:8080 -p 3306:3306 -p 33060:33060 maro

# Stop container
docker container stop maro

# Running containers
docker ps 

# Username/Password
Username: Maro

Password: root
