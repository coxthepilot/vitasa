<?php
include 'login.php';
include 'menu.php';
include 'sites.php';
include 'users.php';
include 'vitaapi.php';
include 'notifications.php';
include 'showheader.php';
include 'showfooter.php';

// The process is to
// * find out who called by looking for known fields that should have been sent from the form
// * do whatever function is expected
// * show the correct screen

showHeader();

if (!empty($_POST['vitasa_login']))
{
	$Token = doLogin();

	if (strlen($Token) != 0) {
		do_show_menu($Token);
	}
	else {
		echo('<h3>Login failed. Check user name and/or password. Or, the user does not have admin priviledge<br/></h3>');

		do_show_login();
	}
} elseif (!empty($_POST['vitasa_sites']))
{
	$Token = $_POST['vitasa_token'];

	if (isset($_POST['submitSiteChanges'])) {
		updateSiteFromForm();

		do_show_sites($Token);
	} elseif (isset($_POST['submitSiteCalChanges'])) {
		updateSiteCalFromForm();

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

showFooter();

?>

