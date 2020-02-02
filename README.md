# Forum-Online
## Environment Setup
    - PHP 7.2.24
    - DBMS (MariaDB + phpMyAdmin)
    - Apache Web Server
    - Git Version Control
    - Composer
    
## Installation
    - Clone this repository
        `git@github.com:ninjavi98/Forum-Online.git`   
    - Install Dependency
        `composer install`
    - Setup Environment Variable
        `cp .env.example .env`
        edit the database connection
        and generate key
        `php artisan key:generate`
    - Database migrations
        `php artisan migrate`
    - Run local server
        `php artisan serve`
