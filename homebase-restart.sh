docker stop homebase

docker system prune -f

#docker pull [DockerHub Username]/[DockerHub Repo]:[Tag] - Add this when webhook is configured

docker build -t homebase ./HOMEBASE/ # Build Dockerfile for HOMEBASE

docker run -d --name HOMEBASE --rm -p 80:80 homebase #[DockerHub Username]/[DockerHub Repo]:[Tag] - Add this when webhook is configured
