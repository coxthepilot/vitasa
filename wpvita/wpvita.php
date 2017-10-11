<?php
/*
   Plugin Name: VITA SA Back Office
   Plugin URI: http://zsquared.net
   Description: A Plug-in to manage the VITA SA operation
   Version: 1.0
   Author: William Cox
   Author URI: http://zsquared.net
   License: GPL2
   */

/*  Copyright 2017  William M Cox (email: billy.cox@zsquared.net)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

register_activation_hook(__FILE__, 'vitasa_activate');
register_activation_hook(__FILE__, 'vitasa_deactivate');
add_action('admin_menu', 'vitasa_create_menu');
//add_action('init', 'vitasa_dosubmit');
add_filter( 'query_vars', 'vitasa_add_query_vars_filter' );
add_shortcode('vitasa', 'vitasa_handler');

function vitasa_activate() {
    // do any activation work here
}

function vitasa_deactivate() {
    // do any deactivation work here
    delete_option("vitasa_options");
}

// Creates our submenu under WooCommerce
function vitasa_create_menu() {
    add_menu_page(
        'VITA SA',                  // page title
        'VITA SA',                  // menu title
        'vitasa_backoffice',        // capability
        'vitasa_backoffice',        // menu slug
        'vitasa_backoffice_page',   // function
        '',                         // icon
        null                        // position
    );
    add_submenu_page(
            'vitasa_backoffice',                // parent slug
            'Login',                            // page title
            'Login',                            // menu title
            'vitasa_backoffice',                // capability
            'vitasa_backoffice_login',          // menu slug
            'vitasa_backoffice_login_page');    // function
}

function vitasa_backoffice_page() {
    // this shows the dashboard
}

function vitasa_backoffice_login_page() {
    // this shows the dashboard
}

// add our customer query values so that they will pass through
function vitasa_add_query_vars_filter( $vars ){
    $vars[] = "vitasa_action";
    //$vars[] = "nextvar";
    return $vars;
}

include 'login.php';
include 'menu.php';
include 'sites.php';
include 'users.php';
include 'vitaapi.php';
include 'notifications.php';

// handles our shortcut invocation
function vitasa_handler()
{
	// The process is to
	// * find out who called by looking for known fields that should have been sent from the form
	// * do whatever function is expected
	// * show the correct screen

    if (!empty($_POST['vitasa_login']))
    {
	    $Token = doLogin();

        if (strlen($Token) != 0)
        {
            do_show_menu($Token);
        }
        else
        {
            echo('<h3>Login failed. Check user name and/or password. Or, the user does not have admin priviledge<br/></h3>');

	        do_show_login();
        }
    } elseif (!empty($_POST['vitasa_sites']))
    {
        $Token = $_POST['vitasa_token'];

        if (isset($_POST['submitSiteChanges'])) {
	        // todo: update the site based on the values posted
	        echo('Update site based on changes.<br/>');
	        do_show_sites($Token);
        } elseif (isset($_POST['submitSiteCalChanges'])) {
		    // todo: update the site based on the values posted
		    echo('Update site calendar based on changes.<br/>');
	        do_show_sites($Token);
	    } elseif (isset($_POST['submitSiteExCalChanges'])) {
        	$ovid = $_POST['vitasa_excalid'];
	        // todo: update the site based on the values posted
	        echo('Update site calendar exceptions based on changes for id = '.$ovid.'.<br/>');
	        do_show_sites($Token);
	    } elseif (isset($_POST['details'])) {
	        $siteslug = $_POST['vitasa_siteslug'];
	        do_show_sitedetails($Token, $siteslug);
        } elseif (isset($_POST['calendar'])) {
	        $siteslug = $_POST['vitasa_siteslug'];
	        do_show_sitecalendar( $Token, $siteslug );
        } elseif (isset($_POST['delete'])) {
	        $siteslug = $_POST['vitasa_siteslug'];
	        do_show_sitedelete($Token, $siteslug); // prompts the user to confirm
        } elseif (isset($_POST['deleteconfirm'])) {
	        $siteslug = $_POST['vitasa_siteslug'];
	        // todo: actually delete the site
	        echo('delete site = '.$siteslug);
	        do_show_sites($Token);
        } else {
	        do_show_sites($Token);
        }
    } elseif (!empty($_POST['vitasa_notification']))
    {
        $Token = $_POST['vitasa_token'];

        do_show_notification($Token);

    } elseif (!empty($_POST['vitasa_users']))
    {
        $Token = $_POST['vitasa_token'];

	    if (isset($_POST['details'])) {
		    $uid = $_POST['vitasa_userid'];
		    do_show_user($Token, $uid);
	    } elseif (isset($_POST['workitems'])) {
		    $uid = $_POST['vitasa_userid'];
		    do_show_userworkitems($Token, $uid);
	    } elseif (isset($_POST['delete'])) {
		    $uid = $_POST['vitasa_userid'];
		    do_show_userdelete($Token, $uid);
	    } elseif (isset($_POST['deleteconfirm'])) {
		    $uid = $_POST['vitasa_userid'];
		    // todo: actually delete the user
			echo('delete user = '.$uid);
		    do_show_users($Token);
	    } else {
		    do_show_users($Token);
	    }
    } else {
    	// if we can't figure out what to do, then just show the login screen
        do_show_login();
    }

    return;
}

?>