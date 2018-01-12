<?php
include_once 'login.php';
include_once 'vitaapi.php';
include_once 'showheader.php';
include_once 'showfooter.php';
include_once 'signups.php';
include_once 'suggestions.php';

showHeader();

if (!empty($_POST['vitasa-login']))
{
	$cmd = $_POST['vitasa-login'];
	if ($cmd == 'do') {
		$loginResp = doLogin();

		$Token = $loginResp['token'];
		$User = $loginResp['user'];
		$Roles = $User->roles;

		if (strlen($Token) == 0) {
			echo('<h3>Login failed. Check user name and/or password. Or, the user does not have the site coordinator or volunteer role<br/></h3>');

			do_show_login();
		}
		else if (userHasVolunteer($Roles)) {
			do_show_signups($User, $Token);
		}
		else if (userHasSiteCoordinator($Roles)) {
			echo('has site coordinator<br/>');

		}
	}
	else if ($cmd == 'show') {
		do_show_login();
	}
}
else if (!empty($_POST['vitasa-signups'])) {
	$cmd = $_POST['vitasa-signups'];
	$Token = $_POST['vitasa-token'];

	if ($cmd == 'list') {
		$userid = $_POST['vitasa-userid'];
		$user = getUser($userid, $Token);
		do_show_signups($user, $Token);
	}
	else if ($cmd == 'details') {
		$signupid = $_POST['vitasa-signupid'];
		$userid = $_POST['vitasa-userid'];
		do_show_signupdetails($userid, $signupid, $Token);
	} else if ($cmd == 'remove') {
		$signupid = $_POST['vitasa-signupid'];

		$success = removeSignUp($signupid, $Token);

		if (!$success) {
			echo('Unable to remove signup.<br/>');
		}

		$userid = $_POST['vitasa-userid'];
		$user = getUser($userid, $Token);
		do_show_signups($user, $Token);
	} else if ($cmd == 'new') {
		// todo ---------------------------------------------------------------------------------
	} else if ($cmd == 'savehours') {
		$signupid = $_POST['vitasa-signupid'];
		$userid = $_POST['vitasa-userid'];
		$hours = $_POST['vitasa-signup-hours'];

		$success = updateSignUpHours($signupid, $hours, $userid, $Token);

		if (!$success) {
			echo('Unable to update the hours for the signup.<br/>');
		}

		$user = getUser($userid, $Token);
		do_show_signups($user, $Token);
	}
}
else if (!empty($_POST['vitasa-suggestions'])) {
	$cmd = $_POST['vitasa-suggestions'];
	$Token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];

	if ($cmd == 'list') {
		$userid = $_POST['vitasa-userid'];
		do_show_suggestions($userid, $Token);
	} else if ($cmd == 'details') {
		$suggestionid = $_POST['vitasa-suggestion-id'];
		do_show_suggestiondetails($userid, $suggestionid, $Token);
    } else if (isset($_POST['update'])) {

	} else if (isset($_POST['remove'])) {

	} else if (isset($_POST['new'])) {

	}
}
else if (!empty($_POST['vitasa-profile'])) {
	$cmd = $_POST['vitasa-profile'];
	$Token = $_POST['vitasa-token'];
	if ($cmd == 'show') {

	} else if ($cmd == 'update') {
		
	}	
}
else {
	// if we can't figure out what to do, then just show the login screen
 	do_show_login();
}

// and finally, show the stuff at the bottom
showFooter();

?>

