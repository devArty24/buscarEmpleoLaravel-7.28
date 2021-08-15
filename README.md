<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 1500 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the Laravel [Patreon page](https://patreon.com/taylorotwell).

### Premium Partners

- **[Vehikl](https://vehikl.com/)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Cubet Techno Labs](https://cubettech.com)**
- **[Cyber-Duck](https://cyber-duck.co.uk)**
- **[Many](https://www.many.co.uk)**
- **[Webdock, Fast VPS Hosting](https://www.webdock.io/en)**
- **[DevSquad](https://devsquad.com)**
- **[OP.GG](https://op.gg)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).

## Key Features
1. Laravel/ui
2. ui:auth
3. ui vue
4. Tailwind CSS
5. laraveles/spanish
6. laraveles:install-lang
7. Confirmation Email
8. Seeders
9. Carbon
10. Migrations
11. Medium editor (cdn)
12. Dropzone js (cdn)
13. Vue js
14. lightbox2
15. Laravel Notifications email
16. Laravel Notifications db
17. Vue SweetAlert2
18. Policys
19. Providers



## Installation
Once downloaded, first install the project's own dependencies run the following in your command console
```
\project_root_folder> composer install
```
When the dependencies have been installed, rename or copy the file `.env.exaple` and change the name to` .env` this can be done manually or from the command console execute:
```
\project_root_folder> copy .env.example .env
```

Now in your command console run the command
```
\project_root_folder> php artisan key:generate
```

Create a database, when you have done it edit the .env file the following variables:
```
DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=nameYourDataBase
DB_USERNAME=root
DB_PASSWORD=
```
>The project was carried out with MySQL, so the configuration would remain as the code shown in addition to the fact that the example is written for a local environment

Already created the base and configured the environment variables of the file .env. Now run the migrations, in your command console run
```
\project_root_folder> php artisan migrate
```

The project has mail delivery, to simulate the delivery, `Mailtrap` dealt with it, you must also configure the environment variables for sending emails
```
// Configure according to the mail service you will use
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=yourUserEmail
MAIL_PASSWORD=yourPasswordEail
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS=theMailYouSend
MAIL_FROM_NAME="${APP_NAME}"
```

The project has 5 custom seeders that are `CategorySeed`,` ExperienceSeeder`, `SalarioSeed`,` LocationSeeder`, `UsuairoSeed`, to execute them run the command
```
\project_root_folder> php artisan db:seed
```

When you upload an image from the recipe form, these are stored in the storage folder, which is a protected folder for the end user, which causes that the images are not displayed when displaying them. What you must do is a symbolic link, for this laravel already has a command so there is no need to create it "manually" the command you must execute is:
```
\project_root_folder> php artisan storage:link
```

