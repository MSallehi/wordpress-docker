FROM wordpress:php8.2-fpm

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev curl gnupg2 git \
    && docker-php-ext-install zip mysqli pdo_mysql gd \
    && docker-php-ext-enable mysqli \
    && rm -rf /var/lib/apt/lists/*

# Copy custom PHP configurations
COPY ./php.ini /usr/local/etc/php/conf.d/custom.ini

# Install and enable Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js and npm (v22.x)
RUN curl -sL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest && \
    rm -rf /var/lib/apt/lists/*

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    wp --info

# Set working directory
WORKDIR /var/www/html