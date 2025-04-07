## Create Wordpress in Docker
### This is a config to create a Wordpress site in Docker

### Prerequisites
- Docker
- Docker Compose

### Configuration
- `docker-compose.yml`: This file contains the configuration for the Docker containers, including Wordpress, MySQL.

- `nginx.conf`: This file contains the configuration for Nginx, which is used as a reverse proxy to serve the Wordpress site over HTTPS.

- `dockerFile`: This file contains the configuration for the Nginx container, including the installation of the required packages and the copying of the Nginx configuration file.

- `php.ini`: This file contains the configuration for PHP, including the upload size and other settings.

### Packages install in Dockerfile
- `nginx`: The web server used to serve the Wordpress site.
- `php-fpm`: The PHP FastCGI Process Manager, which is used to process PHP files.
- `xdebug`: The PHP extension for debugging, which is used for debugging PHP code.
- `Composer`: The dependency manager for PHP, which is used to manage PHP packages.
- `Node.js and npm (v22.x)`: JavaScript runtime and package manager, used for managing JavaScript dependencies.
- `WP-CLI`: The command-line interface for Wordpress, which is used to manage Wordpress installations and perform various tasks.


### Usage
1. Clone the repository
```bash
git clone https://github.com/MSallehi/wordpress-docker.git
```
2. Change directory to the cloned repository
```bash
cd wordpress-docker
```
3. Create ssl certificates
```bash
cd nginx
```
```bash
mkdir certs
cd certs
```
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout localhost.key \
  -out localhost.crt \
  -subj "//CN=localhost"
```
4. Run the Docker Compose
```bash
docker-compose up --build -d
```
5. Access the Wordpress site in your browser at `https://localhost`