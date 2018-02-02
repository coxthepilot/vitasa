<?php

$loginMap = array();
$loginMap['do'] = 'login_do';
$loginMap['show'] = 'login_show';

registerMap('vitasa-login', $loginMap);

function login_do() {
	$loginResp = doLogin();

	$token = $loginResp['token'];
	$user = $loginResp['user'];
	$roles = $user->roles;

	if (strlen($token) == 0) {
		echo('<h3>Login failed. Check user name and/or password. Or, the user does not have the site coordinator or volunteer role.<br/></h3>');

		do_show_login();
	}
	else if (userHasVolunteer($roles)) {
		do_show_signups($user, $token);
	}
	else if (userHasSiteCoordinator($roles)) {
		$sitescoordinated = $user->sites_coordinated;

		$sccnt = count($sitescoordinated);

		if ($sccnt == 0) {
			echo('<h3>You are assigned the role as site coordinator but no sites are assigned.</h3>');

			do_show_login();
		} else if ($sccnt == 1) {
			$scc = $sitescoordinated[0];
			$siteslug = $scc->slug;
			$userid = $user->id;

			do_sitecoordinator_options($userid, $token, $siteslug);
		} else {
			do_sitecoordinator_siteselection($user->id, $token);
		}
	}
	else if (userHasNewUser($roles)) {
		echo('<h3>Staff has not yet acted on your registration.<br/></h3>');

		do_show_login();
	}
}

function login_show() {
	do_show_login();
}

function doLogin()
{
	$username = $_POST['vitasa-login-username'];
	$password = $_POST['vitasa-login-password'];

	$token = backend_login($username, $password);

	return $token;
}

function do_show_login()
{
	echo('
		<h2>Volunteer Login</h2>
		<div style="position: relative;">
			<form action="" method="post">
				<input type="hidden" name="vitasa-login" value="do" />
				<table class="form-table">
					<tr>
						<td>
							<label>Email:&nbsp;</label>
						</td>
						<td>
							<input type="text" name="vitasa-login-username" style="width: 200px;" placeholder="Email" /><br />
						</td>
					</tr>
					<tr>
						<td>
							<label>Password:&nbsp;</label>
						</td>
						<td>
							<input type="password" name="vitasa-login-password" style="width: 200px;" placeholder="Password" /><br />
						</td>
					</tr>
				</table>
				<button type="submit" class="button-primary">Login</button>
			</form>
		</div>
		');

	echo('
	<br/><br/>
    <div class="signup-row">
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-register" value="show" />
		        <button type="submit" class="button-navigation">Register</button>
		    </form>
	    </div>
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-about" value="show" />
		        <button type="submit" class="button-navigation">About</button>
		    </form>
	    </div>
	    <br/>
	</div>
	<br/>
	');
}
?>