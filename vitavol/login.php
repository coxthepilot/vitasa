<?php

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
		<h2>VITA SA Online - Login</h2>
		<div style="position: relative;">
			<form action="" method="post">
				<input type="hidden" name="vitasa-login" value="do" />
				<table class="form-table">
					<tr>
						<td>
							<label>User name:&nbsp;</label>
						</td>
						<td>
							<input type="text" name="vitasa-login-username" style="width: 200px;" placeholder="User Name" /><br />
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
		'); // wrap
}
?>