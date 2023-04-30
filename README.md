# Dokumentasi Proses CICD dengan Github, Jenkins & Kubernetes
Berikut adalah workflow CI/CD dengan mengambil code dari GitHub, membuat docker image,
dan mendeploy aplikasi ke Kubernetes:
1. Checkout Code dari GitHub
Pertama, code dari repository GitHub harus diambil dan dipindahkan ke mesin CI/CD. Hal
ini dapat dilakukan dengan menggunakan fitur checkout pada mesin CI/CD.
2. Build Docker image
Setelah code telah diambil, proses selanjutnya adalah membuat Docker image dari file
executable. Hal ini dapat dilakukan dengan menggunakan Dockerfile, yaitu sebuah file
konfigurasi yang berisi instruksi untuk membangun sebuah Docker image. Dockerfile akan
ditempatkan pada direktori code yang telah diambil pada tahap pertama.
3. Push Docker Image ke Registry
Setelah Docker image berhasil dibuat, langkah selanjutnya adalah mem-push image
tersebut ke registry seperti Docker Hub atau Google Container Registry agar bisa diakses
dan digunakan oleh Kubernetes. Ini dilakukan dengan menggunakan perintah docker push.
4. Deploy Aplikasi ke Kubernetes
Setelah Docker image berhasil di-push ke registry, langkah selanjutnya adalah mendeploy
aplikasi ke Kubernetes. Hal ini dapat dilakukan dengan menggunakan deployment YAML
file. Pada YAML file tersebut, akan terdapat spesifikasi aplikasi yang akan dideploy seperti
jumlah replicas, container image, dan port.
Setelah file YAML berhasil dibuat, perintah kubectl apply akan dijalankan untuk meng-
deploy aplikasi ke cluster Kubernetes.
Demikianlah workflow CI/CD dengan mengambil code dari GitHub, membuat Docker image, dan
mendeploy aplikasi ke Kubernetes. Dengan menerapkan praktik CI/CD, sebuah tim pengembang
dapat mempercepat proses pengembangan dan deployment aplikasi, sehingga dapat
memberikan manfaat yang lebih baik untuk pengguna.
