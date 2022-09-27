#Check for updates to HOMEBASE repo
git pull

#If Homebase is running, stop it and prune the system
docker stop homebase
docker system prune -f

#Build and Run homebase from Dockerfile
docker build -t homebase /home/brett/HOMEBASE # Build Dockerfile for HOMEBASE
docker run -d --name HOMEBASE --rm -p 80:80 homebase # Run HOMEBASE image
