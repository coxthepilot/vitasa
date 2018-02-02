<?php

$registerMap = array();
$registerMap['show'] = 'register_show';
$registerMap['register'] = 'register_register';

registerMap('vitasa-register', $registerMap);

function register_show() {
	do_show_register(null, null, null);
}

function do_show_register($name, $email, $phone) {
	echo('
    <h2>Volunteer Registration</h2>
    ');

	echo('
	<form action="" method="post">
		Name:<input type="text" name="vitasa-register-name" style="width: 200px;" placeholder="Name" value="'.$name.'" /><br />
		Email:<input type="text" name="vitasa-register-email" style="width: 200px;" placeholder="Email" value="'.$email.'" /><br />
		Phone:<input type="text" name="vitasa-register-phone" style="width: 200px;" placeholder="Phone" value="'.$phone.'" /><br />
		Password:<input type="password" name="vitasa-register-password1" style="width: 200px;" placeholder="Password" /><br />
		Password (again):<input type="password" name="vitasa-register-password2" style="width: 200px;" placeholder="Password" /><br />
        <input type="hidden" name="vitasa-register" value="register" />
		<button type="submit" class="button-primary">Submit</button>
	</form>
	
	<br/><br/>
	The rules:<br/>
	<ul>
		<li>Name must be 5 characters or more.</li>
		<li>Email must be 5 or more characters and contain the "@" symbol.</li>
		<li>Phone must have 10 digits with optional -, /, and ()</li>
		<li>Passwords must be 8 or more characters.</li>
		<li>Both password must match.</li>
	</ul>
	<br/>
	<a target="_blank" href="http://vitasa.org/en/privacy-policy.html">Privacy Policy</a><br/>
	');
}

function register_register() {
	$name = $_POST['vitasa-register-name'];
	$email = $_POST['vitasa-register-email'];
	$phone = $_POST['vitasa-register-phone'];
	$password1 = $_POST['vitasa-register-password1'];
	$password2 = $_POST['vitasa-register-password2'];

	$registrationIsOk = true;

	if (strlen($name) < 5) {
		echo('Name must have atleast 5 characters.<br/>');
		$registrationIsOk = false;
	}

	if ((strlen($email) < 5) || (strpos($email, '@') === false)) {
		echo('Email must have atleast 5 characters and contain an "@".<br/>');
		$registrationIsOk = false;
	}

	if (!validPhoneNumber($phone)) {
		echo('Phone must have 10 digits with optional -, /, and ()<br/>');
		$registrationIsOk = false;
	}

	if ((strlen($password1) < 8) || ($password1 != $password2)) {
		echo('
			Passwords must be 8 or more characters.<br/>
			Both password must match.<br/>
		');
		$registrationIsOk = false;
	}

	if ($registrationIsOk) {
		$success = submitRegistration($name, $email, $phone, $password1);

		if (!$success) {
			echo('The registration failed. It may be a duplicate registration or a network error.');
		}

		do_show_login();
	} else {
		echo('There were one or more errors in the registration. Please correct and submit again.');

		do_show_register($name, $email, $phone);
	}
}

function validPhoneNumber($phone) {
	$res = true;

    $numCount = 0;
    $strlen = strlen($phone);
	for( $i = 0; $i <= $strlen; $i++ ) {
		$char = substr( $phone, $i, 1 );

		if (ctype_digit($char)) {
			$numCount++;
			continue;
		} else if (ctype_alpha($char)) {
			$res = false;
			break;
		} else if (($char != "-") && ($char != "(") && ($char != ")") && ($char != " ") && (strlen($char) != 0)) {
			$res = false;
			break;
		}
	}

    return $res && ($numCount == 10);
}

?>