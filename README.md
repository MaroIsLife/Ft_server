# Ft_server
 This is a System Administration subject. This project is a Web Server made with Docker. (42 Login MOUGNOU)
 
 Building an image then Running the container which will run a fully functional web server with wordpress and phpmyadmin included. 

# Restart docker
docker-machine restart
eval $(docker-machine env default)

# Build image
docker image build -t maro .

# Clear
docker system prune
&&
docker image prune

# Run container
docker run -d -p 443:443 -p 80:80 container_id

# Stop container
docker container stop container_id

# Running containers
docker ps 

# Username/Password
Username: Maro

Password: root
