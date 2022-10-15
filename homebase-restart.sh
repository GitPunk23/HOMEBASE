#Check for updates to HOMEBASE repo
git pull

#If Homebase website is running, stop it and prune the system
docker stop HOMEBASE-WEB
docker system prune -f

#Build and Run homebase website from Dockerfile
docker build -t homebase /home/brett/HOMEBASE/website # Build Dockerfile for HOMEBASE
docker run -d --name HOMEBASE-WEB --rm -p 80:80 homebase # Run HOMEBASE image
