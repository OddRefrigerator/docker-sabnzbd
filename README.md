# Docker SABnzbd

This repository provides a Docker container for SABnzbd, a free and open-source newsreader that simplifies downloading from Usenet. It features a web-based interface, making it easy to manage downloads from any device.

## Features

- **Easy Setup:** Quick and straightforward installation using Docker.
- **Web Interface:** Access SABnzbd from any web browser to manage and monitor downloads.
- **Customizable:** Easily configure settings, including Usenet server details and download folders.
- **Auto-Extract:** Automatically extract downloaded files.
- **Integration:** Works seamlessly with various NZB indexing sites.

## Requirements

- Docker installed on your host machine.
- Access to a Usenet provider (with valid credentials).

## Getting Started

### Running SABnzbd

To run SABnzbd using Docker, execute the following command:

```bash
docker run -d \
  --name sabnzbd \
  -p 8080:8080 \
  -v /path/to/config:/config \
  -v /path/to/downloads:/downloads \
  oddrefrigerator/docker-sabnzbd
```

Replace `/path/to/config` with your desired configuration directory and `/path/to/downloads` with the directory where downloaded files will be stored.

### Accessing the Web Interface

Once the container is running, you can access the SABnzbd web interface by navigating to `http://localhost:8080` in your web browser.

## Configuration

### Environment Variables

You can customize your SABnzbd setup using environment variables. Below are the available options:

- `SABNZBD_USERNAME`: Set a username for the SABnzbd web interface.
- `SABNZBD_PASSWORD`: Set a password for the SABnzbd web interface.
- `SABNZBD_PORT`: Set the port for the SABnzbd web interface (default is `8080`).

Example of setting environment variables:

```bash
docker run -d \
  --name sabnzbd \
  -p 8080:8080 \
  -v /path/to/config:/config \
  -v /path/to/downloads:/downloads \
  -e SABNZBD_USERNAME='your
