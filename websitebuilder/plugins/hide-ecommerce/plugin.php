<?php

/**
 * Vvveb
 *
 * Copyright (C) 2022  Ziadin Givan
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 */

/*
Name: Hide Ecommerce features
Slug: hide-ecommerce
Category: tools
Url: https://www.vvveb.com
Description: Hide Ecommerce features if you are not using them.
Author: givanz
Version: 0.1
Thumb: hide-ecommerce.svg
Author url: https://www.vvveb.com
*/

use Vvveb\System\Event;

if (! defined('V_VERSION')) {
	die('Invalid request!');
}

class HideEcommercePlugin {
	function admin() {
		//hide ecommerce admin menu options
		$admin_path = \Vvveb\adminPath();
		Event::on('Vvveb\Controller\Base', 'init-menu', __CLASS__, function ($menu) use ($admin_path) {
			unset($menu['ecommerce'], $menu['sales'], $menu['products'], $menu['product'], $menu['settings']['items']['ecommerce']);

			return [$menu];
		});
	}

	function app() {
		$ecommerceRoutes = [
			//ecommerce

			//catalog - multi language - language code must be at least 2 characters
			'/{language{2,5}}/shop',
			'/{language{2,5}}/shop/{slug}',
			'/{language{2,5}}/shop/{slug}/#page#',
			'/{language{2,5}}/manufacturer/{slug}',
			'/{language{2,5}}/product/{slug}',

			//catalog
			'/shop',
			'/shop/#page#',
			'/shop/{slug}',
			'/shop/{slug}/#page#',
			'/shop/{slug}/#page#/filters-{filters}',
			'/manufacturer/{slug}',
			'/vendor/{slug}',
			'/product/{slug}',

			//multi language catalog - language code must be at least 2 characters
			'/{language{2,5}}/shop',
			'/{language{2,5}}/shop/#page#',
			'/{language{2,5}}/shop/{slug}',
			'/{language{2,5}}/shop/{slug}/#page#',
			'/{language{2,5}}/shop/{slug}/#page#/filters-{filters}',
			'/{language{2,5}}/manufacturer/{slug}',
			'/{language{2,5}}/vendor/{slug}',
			'/{language{2,5}}/product/{slug}',

			//checkout
			'/cart',
			'/cart/add/#product_id#',
			'/cart/remove/#product_id#',
			'/cart/voucher',

			'/checkout/#product_id#',
			'/checkout',
			'/checkout/pay',
			'/checkout/confirm',
			'/checkout/confirm/#id#',
		];

		//remove ecommerce pages
		Event::on('Vvveb\System\Routes', 'init', __CLASS__, function ($routes) use ($ecommerceRoutes) {
			foreach ($ecommerceRoutes as $route) {
				unset($routes[$route]);
			}

			return [$routes];
		});
	}

	function __construct() {
		if (APP == 'admin') {
			$this->admin();
		} else {
			if (APP == 'app') {
				$this->app();
			}
		}
	}
}

$markdownPlugin = new HideEcommercePlugin();
