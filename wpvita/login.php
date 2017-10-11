<?php

function doLogin()
{
	$username = $_POST['vitasa_login_username'];
	$password = $_POST['vitasa_login_password'];

	$token = backend_login($username, $password);

	return $token;
}

function do_show_login()
{
	echo('
		<h2>VITA SA Back office Admin - Login</h2>
		<div style="position: relative;">
			<form action="" method="post">
				<input type="hidden" name="vitasa_login" value="1" />
				<table class="form-table">
					<tr>
						<td>
							<label>User name:&nbsp;</label>
						</td>
						<td>
							<input type="text" name="vitasa_login_username" style="width: 400px;" placeholder="User Name" /><br />
						</td>
					</tr>
					<tr>
						<td>
							<label>Password:&nbsp;</label>
						</td>
						<td>
							<input type="password" name="vitasa_login_password" style="width: 400px;" placeholder="Password" /><br />
						</td>
					</tr>
				</table>
				<button type="submit" class="button-primary">Login</button>
			</form>
		</div>
		'); // wrap
}
?>