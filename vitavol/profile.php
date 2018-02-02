<?php
include_once "helpers.php";

$profileMap = array();
$profileMap['show'] = 'profile_show';
$profileMap['update'] = 'profile_update';

$profileMap['show_sc'] = 'profile_show_sc';
$profileMap['update_sc'] = 'profile_update_sc';

registerMap('vitasa-profile', $profileMap);

function profile_show() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];

	do_show_profile($userid, $token);
}

function do_show_profile($userid, $token) {
	$user = getUser($userid, $token);

	$email = $user->email;
	$name = $user->name;
	$phone = $user->phone;
	// name
	// email
	// phone

	echo('
    <h2>Profile</h2>
    ');

	do_show_vol_navigation($token, $userid);

	echo('
		<br/><br/>
        Name: 
        <input type="text" form="profileform" name="vitasa-profile-name" value="'.$name.'" />
        <br/><br/>
        Email: 
        <input type="text" form="profileform" name="vitasa-profile-email" value="'.$email.'" />
        <br/><br/>
        Phone:
        <input type="text" form="profileform" name="vitasa-profile-phone" value="'.$phone.'" />
        <br/><br/>
        <form action="" method="post" id="profileform">
            <input type="hidden" name="vitasa-profile" value="update" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <button type="submit" class="button-primary">Update</button>
        </form>
	');
	// will need to implement something so the back function knows where to go to...
}

function profile_update() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$email = $_POST['vitasa-profile-email'];
	$name = $_POST['vitasa-profile-name'];
	$phone = $_POST['vitasa-profile-phone'];

	$success = updateProfile($userid, $name, $email, $phone, $token);

	if (!$success) {
		echo('Unable to update the profile.<br/>');
	}

	$user = getUser($userid, $token);
	do_show_signups($user, $token);
}

function profile_show_sc() {
    $token = $_POST['vitasa-token'];
    $userid = $_POST['vitasa-userid'];
    $siteslug = $_POST['vitasa-siteslug'];

    $user = getUser($userid, $token);

    $email = $user->email;
    $name = $user->name;
    $phone = $user->phone;

    echo('
    <h2>Profile</h2>
    ');

    do_show_sc_navigation($userid, $token, $siteslug);

    echo('
		<br/><br/>
        Name: 
        <input type="text" form="profileform" name="vitasa-profile-name" value="'.$name.'" />
        <br/><br/>
        Email: 
        <input type="text" form="profileform" name="vitasa-profile-email" value="'.$email.'" />
        <br/><br/>
        Phone:
        <input type="text" form="profileform" name="vitasa-profile-phone" value="'.$phone.'" />
        <br/><br/>
        <form action="" method="post" id="profileform">
            <input type="hidden" name="vitasa-profile" value="update_sc" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
            <button type="submit" class="button-primary">Update</button>
        </form>
	');
    // will need to implement something so the back function knows where to go to...
}

function profile_update_sc() {
    $token = $_POST['vitasa-token'];
    $userid = $_POST['vitasa-userid'];
    $siteslug = $_POST['vitasa-siteslug'];
    $email = $_POST['vitasa-profile-email'];
    $name = $_POST['vitasa-profile-name'];
    $phone = $_POST['vitasa-profile-phone'];

    $success = updateProfile($userid, $name, $email, $phone, $token);

    if (!$success) {
        echo('Unable to update the profile.<br/>');
    }

    //$user = getUser($userid, $token);
    do_sitecoordinator_options($userid, $token, $siteslug);
}
?>