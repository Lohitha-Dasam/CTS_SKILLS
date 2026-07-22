# Docker Notes

## 1. What is Docker?

Docker is an open-source containerization platform that allows developers to package applications and their dependencies into lightweight containers.

Containers ensure that applications run consistently across different environments.

---

## 2. Features of Docker

- Lightweight
- Fast deployment
- Platform independent
- Portable
- Easy scalability
- Isolation of applications
- Efficient resource utilization

---

## 3. Docker Architecture

Docker consists of:

- Docker Client (CLI)
- Docker Daemon
- Docker Engine
- Docker Registry (Docker Hub)
- Docker Images
- Docker Containers

---

## 4. Basic Docker Commands

### Check Docker Version

```bash
docker --version
```

### Pull an Image

```bash
docker pull ubuntu
```

### List Images

```bash
docker images
```

### Run a Container

```bash
docker run ubuntu
```

### Run Container in Background

```bash
docker run -d nginx
```

### List Running Containers

```bash
docker ps
```

### List All Containers

```bash
docker ps -a
```

### Stop Container

```bash
docker stop <container-id>
```

### Remove Container

```bash
docker rm <container-id>
```

### Remove Image

```bash
docker rmi <image-id>
```

---

## 5. Docker Run Options

- Interactive Mode

```bash
docker run -it ubuntu
```

- Detached Mode

```bash
docker run -d nginx
```

- Named Container

```bash
docker run --name mycontainer ubuntu
```

- Publish Ports

```bash
docker run -p 8080:80 nginx
```

---

## 6. Docker Images

A Docker Image is a read-only template used to create containers.

### Types of Images

- Base Image
- Parent Image
- Custom Image

### Image Layers

Docker images are built using multiple layers to optimize storage and reuse.

---

## 7. Dockerfile

Dockerfile is a text file containing instructions for building Docker images.

Example:

```dockerfile
FROM ubuntu
RUN apt update
CMD ["bash"]
```

---

## 8. Docker Compose

Docker Compose is used to define and run multi-container Docker applications.

Compose files are written in YAML.

Example:

```yaml
version: "3"

services:
  web:
    image: nginx
```

Useful Commands:

```bash
docker-compose up
docker-compose down
```

---

## 9. Docker Engine

Docker Engine includes:

- Docker CLI
- Docker Daemon
- REST API

---

## 10. Docker Storage

Docker provides persistent storage using volumes.

Commands:

Create Volume

```bash
docker volume create myvolume
```

List Volumes

```bash
docker volume ls
```

---

## 11. Docker Networking

Default Docker Networks:

- Bridge
- Host
- None

Useful Commands:

```bash
docker network ls
```

```bash
docker network inspect bridge
```

```bash
docker network create mynetwork
```

---

## 12. Container Orchestration

Container orchestration automates:

- Deployment
- Scaling
- Load balancing
- Monitoring
- Management of containers

---

## 13. Kubernetes

Kubernetes is the most popular container orchestration platform.

Features:

- Automatic Scaling
- Load Balancing
- Self-Healing
- Rolling Updates
- Auto Deployment

---

## Summary

Docker simplifies application deployment through containerization. Combined with Docker Compose and Kubernetes, it enables scalable, portable, and efficient application deployment across multiple environments.