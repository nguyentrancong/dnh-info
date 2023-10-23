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
Name: Contact form
Slug: contact-form
Category: email
Url: https://www.vvveb.com
Description: Create contact forms that sends email or saves data in the database
Thumb: contact-form.svg
Author: givanz
Version: 0.1
Author url: https://www.vvveb.com
Settings: /admin/?module=plugins/contact-form/messages
*/

use function Vvveb\__;
use function Vvveb\array_insert_array_after;
use function Vvveb\model;
use Vvveb\Plugins\ContactForm\Install;
use Vvveb\System\Core\View;
use Vvveb\System\Event;

if (! defined('V_VERSION')) {
	die('Invalid request!');
}

#[\AllowDynamicProperties]
class ContactFormPlugin {
	function admin() {
		// add admin menu item
		$admin_path = \Vvveb\adminPath();

		// add menu event
		Event::on('Vvveb\Controller\Base', 'init-menu', __CLASS__, function ($menu) use ($admin_path) {
			// get number of unread messages
			$message = model('Plugins\ContactForm\Message');
			$status = $message->getStatusCount(['status' => 0]);
			$unread = $status['count'] ?? 0;

			// add menu entry under plugins submenu
			$menu['plugins']['items']['contact-form'] = [
				'name'     => __('Contact form'),
				'url'      => $admin_path . '?module=plugins/contact-form/messages',
				'icon-img' => PUBLIC_PATH . 'plugins/contact-form/contact-form.svg',
				'module'   => 'plugins/contact-form/messages',
				'action'   => 'index',
			];

			// add shortcut to messages page to top level menu
			$menuEntry = [
				'name'     => __('Messages'),
				'url'      => $admin_path . '?module=plugins/contact-form/messages',
				'icon'     => 'icon-mail-outline',
				'module'   => 'plugins/contact-form/messages',
				'action'   => 'index',
			];

			// if unread messages add notification with number of messages to the menu entry
			if ($unread) {
				$menuEntry['badge'] = $unread;
				$menuEntry['badge-class'] = 'badge bg-success-subtle text-body mx-2';
			}

			$menu = array_insert_array_after('users', $menu, ['messages' => $menuEntry]);

			return [$menu];
		});

		// include plugin component when the page builder loads
		Event::on('Vvveb\Controller\Editor\Editor', 'loadThemeAssets', __CLASS__, function ($inputs, $components, $blocks, $sections) {
			$components['contact-form'] = '../../plugins/contact-form/editor/components.js';

			return [$inputs, $components, $blocks, $sections];
		});

		// when plugin is installed first time run install and create tables if not created
		Event::on('Vvveb\System\Extensions\Plugins', 'setup', __CLASS__, function ($pluginName, $siteId) {
			if ($pluginName == 'contact-form') {
				$this->install();
			}

			return [$pluginName, $siteId];
		});
	}

	function install() {
		$install = new Install();
		$install->run();
	}

	function app() {
		// include code contact forms to preserve input values on form submit
		$this->view = View::getInstance();
		$template   = $this->view->getTemplateEngineInstance();
		$template->loadTemplateFile(__DIR__ . '/app/template/contact-form.tpl');
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

$contactFormPlugin = new ContactFormPlugin();
