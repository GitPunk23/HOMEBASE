#Check for updates to HOMEBASE repo
git pull

#If Homebase website is running, stop it
docker stop HOMEBASE

#Build and Run homebase website from Dockerfile
docker build -t homebase:latest /home/brett/HOMEBASE/website # Build Dockerfile for HOMEBASE
docker run -d --name HOMEBASE --rm -p 80:80 homebase # Run HOMEBASE image
