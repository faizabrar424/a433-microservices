# Membuat Docker image dengan nama image item-app dan tag v1.
docker build -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format GitHub Registry
docker tag item-app:v1 ghcr.io/faizabrar424/item-app:v1

# Login ke atau GitHub Registry
echo $PAT_GHCR | docker login ghcr.io -u faizabrar424 --password-stdin

# Mengunggah image ke GitHub Registry
docker push ghcr.io/faizabrar424/item-app:v1

