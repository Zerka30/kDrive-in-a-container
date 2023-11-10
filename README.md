# 📁 Docker WebDAV Mounter for Infomaniak KDrive

This Docker image facilitates the mounting of an Infomaniak KDrive WebDAV space into a container, providing a simple solution for accessing and managing your KDrive documents.

## Prerequisites

Before using this Docker image, ensure the following prerequisites are met:

- Docker installed on your system.
- A valid Infomaniak KDrive account with the necessary access credentials (email, password, and ID).
- Familiarity with Docker concepts and basic usage.

## Usage

**Pull the Docker image from GitHub Container Registry (GHCR):**

```bash
docker pull ghcr.io/zerka30/kdrive-in-a-container:main
``````

**Set your KDrive credentials in the environment variables:**

```bash
export KDRIVE_EMAIL="your_email@example.com"
export KDRIVE_PASSWORD="your_kdrive_password"
export KDRIVE_ID="your_kdrive_id"
```

**Run the Docker container:**

```bash
docker run --privileged -d --name kdrive-mount -e KDRIVE_EMAIL -e KDRIVE_PASSWORD -e KDRIVE_ID kdrive-container
```

The Docker container will automatically mount your KDrive space to the `/mnt/kdrive` directory inside the container. To access your KDrive documents, you can either enter the container or map the `/mnt/kdrive` directory to a local directory on your host machine.

```bash
docker exec -it kdrive-mount /bin/bash
```

Feel free to adapt and customize the configuration according to your needs. Remember to secure your environment variables and adjust permissions accordingly for sensitive information.

*Note : This is a basic setup, and additional security measures may be required based on your specific use case.*
