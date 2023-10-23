<p align="center">
  <img src="https://vvveb.com/admin/default/img/biglogo.png" alt="Vvveb">
  <br><br>
  <strong>Powerful and easy to use CMS with page builder to build websites, blogs or ecommerce stores.</strong>
</p>
<p align="center">
  <a href="https://www.vvveb.com">Website</a> |
  <a href="https://docs.vvveb.com/">Documentation</a> |
  <a href="https://github.com/givanz/Vvveb/discussions">Forum</a> |
  <a href="https://twitter.com/vvvebcms">Twitter</a> 
</p>

### [Live Demo](https://demo.vvveb.com) / [Admin Demo](https://demo.vvveb.com/admin) / [Page Builder Demo](https://demo.vvveb.com/admin/?module=/editor/editor&template=index.html&url=/)

<img src="https://www.vvveb.com/img/dark-theme.png">
<img src="https://www.vvveb.com/img/light-theme.png">
<img src="https://www.vvveb.com/img/dasboard-white.png">
<img src="https://www.vvveb.com/img/dasboard-dark.png">


### Features

* Drag and drop page builder
* Multi site support
* Localization and multi language support
* Easy publishing with revisions, media management, multi user access.
* Advanced ecommerce features
	* One page checkout
	* Subscriptions
	* Digital assets support
	* Vouchers, coupons
	* Product options, attributes, variants, reviews, qa etc
* Themes and plugins marketplace with one click install from the inside admin dashboard.
* Versatile with custom fields, custom posts and custom products support.
* Low resource footprint serving hundreds of requests per second on free shared hosting.
* Very fast, with cache enabled as fast as a static website.
* Manual and automatic backup.
* Import/export for easy migration.
* Easily extendable through plugins with a powerful event system.
* Built in contact forms plugin with storage and email support.

## System Requirements

* [PHP](https://www.php.net) minimum PHP 7.4+, recommended PHP 8.3+ with the following extensions
	* mysqli 
	* mysqlnd
	* sqlite3
	* pgsql
	* xml
	* libxml
	* pcre
	* zip
	* dom
	* curl
	* gettext
	* gd or imagick
* Database 
	* [MySQL 5.7+](https://www.mysql.com/) or greater OR [MariaDB](https://mariadb.org/) 10.2 or greater. 
	* [Sqlite](https://www.sqlite.com/) 
	* [Postgresql 11+](https://www.postgresql.org/) 


## Build

```bash
git clone --recurse-submodules https://github.com/givanz/Vvveb
```

```bash
cd Vvveb
```

```bash
./build.sh
```

## Install

* Clone the repository and [build](https://github.com/givanz/VvvebJs/edit/master/README.md#build) or download a [release](https://github.com/givanz/Vvveb/releases)
* Upload the files on your server or localhost and open `http://localhost/` or `http://myserver.com/` 
* Follow the [installation instructions](https://docs.vvveb.com/installation)

###

Command line install

```bash
php cli.php install module=index host=127.0.0.1 user=root password=1234 database=vvveb admin[email]=admin@vvveb.com admin[password]=admin engine=mysqli
```

Replace engine with `sqlite` or `pgsql` if you like.


## Documentation

[User documentation](https://docs.vvveb.com)

[Developer documentation](https://dev.vvveb.com)

## Support

If you like the project you can support it with a [PayPal donation](https://paypal.me/zgivan) or become a backer/sponsor via [Open Collective](https://opencollective.com/vvvebjs)


<a href="https://opencollective.com/vvvebjs/sponsors/0/website"><img src="https://opencollective.com/vvvebjs/sponsors/0/avatar"></a>
<a href="https://opencollective.com/vvvebjs/backers/0/website"><img src="https://opencollective.com/vvvebjs/backers/0/avatar"></a>

## License

GNU Affero General Public License Version 3 (AGPLv3) or any later version

