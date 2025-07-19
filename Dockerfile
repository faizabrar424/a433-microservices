# Menggumakan base image resmi Node.js versi 14
FROM node:14

# Set direktori kerja di dalam container ke /app
WORKDIR /app

# Salin semua file dari direktori project lokal (host) ke direktori kerja container (/app)
COPY . .

# Set environment variable:
# Aplikasi berjalan di mode produksi
ENV NODE_ENV=production

# Nama service MongoDB dalam Docker Compose
ENV DB_HOST=item-db

# Install dependency yang dibutuhkan untuk production
RUN npm install --production --unsafe-perm && npm run build

# Membuka port 8080 di dalam container
EXPOSE 8080

# Perintah utama yang dijalankan saat container start
CMD [ "npm", "start" ]