#!/bin/bash

# Nama image dan tag
IMAGE_NAME="item-app"
TAG="v1"
GITHUB_USERNAME="faizabrar424"
GHCR_IMAGE="ghcr.io/${GITHUB_USERNAME}/${IMAGE_NAME}:${TAG}"

# Membuat Docker image dengan nama image item-app dan tag v1.
echo "Build image..."
docker build -t $IMAGE_NAME:$TAG .

# Melihat daftar image di lokal
docker images | grep $IMAGE_NAME

# Mengubah nama image agar sesuai dengan format GitHub Packages
echo "Tag image..."
docker tag $IMAGE_NAME:$TAG $GHCR_IMAGE

# Login ke atau GitHub Packages
echo $PAT_GHCR | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Mengunggah image ke GitHub Packages
echo "Push image..."
docker push $GHCR_IMAGE

echo "✅ Selesai! Image telah dipush ke: $GHCR_IMAGE"
