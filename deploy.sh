#!/bin/bash

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -s|--skip-update)
            SKIP_UPDATE=true
            ;;
        *)
            echo "Unknown parameter passed: $1"
            exit 1
            ;;
    esac
    shift
done

# Step 1: Pull latest changes from Git (if not skipping update)
if [[ ! $SKIP_UPDATE ]]; then
    echo "Fetching latest changes from Git..."
    git pull origin main

    # Check if there are changes
    if [[ `git status --porcelain` ]]; then
        echo "No changes in the repository. Exiting deployment."
        exit 0
    fi
else
    echo "Skipping Git update."
fi

# Step 2: Stop and Remove Old Container (if it exists)
if sudo docker ps -a --format '{{.Names}}' | grep -q 'homebase'; then
    echo "Stopping existing container..."
    sudo docker stop homebase

    echo "Removing existing container..."
    sudo docker rm homebase
fi

# Step 3: Deploy the updated container
echo "Starting new container..."
sudo docker-compose up -d

echo "Deployment completed successfully."
