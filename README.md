# The container will have two apps - C app and Go app

# The C app is just a simpliest HelloWorld app, it just prints a line "Hello world C for Docker!"

# The Go app is a very simple Web-server, it handles GET-reqeuests

# at URI http://localhost:8083/<enter_resource_name_here>

# and returns string Hey!, you've requested: /<enter_resource_name_here>

# The GO app's source is originally copied from here:

# https://github.com/rinoshkk/simple-go-web-app/ 

# Go app originally listens port 8080 but here  I use 8083 to avoid collisions with the other 8080 listeners



# Build 

docker build -t nightmare:1.1 . 

 
# Run

# to run C application: 

docker run --rm --name c_and_go -p 127.0.0.1:8083:8080 -ti --entrypoint /simplec nightmare:1.1

# to run Go application

docker run --rm --name c_and_go -p 127.0.0.1:8083:8080 -ti --entrypoint /main nightmare:1.1

# Development

Not realised yet

# Test

Not realised yet
