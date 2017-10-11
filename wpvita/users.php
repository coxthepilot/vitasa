<?php

function do_show_users($token)
{
	$users = getUsers($token);

	showMenuHoriz($token);

	echo('
    <h2>VITA SA Back office Admin - Users</h2>
    <table>
        <thead>
           <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Certification</th>
                <th>View/Edit</th>
                <th>Work Items</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
    ');

	foreach ($users as $user) {
		$uid = $user->id;
		$uname = $user->name;
		$uemail = $user->email;
		$uphone = $user->phone;
		$ucert = $user->certification;

		echo('
            <tr>
                <td>'.$uname.'</td>
                <td>'.$uemail.'</td>
                <td>'.$uphone.'</td>
                <td>'.$ucert.'</td>
            ');

		echo('
                <td>
                    <form action="" method="post">
                        <input type="hidden" name="vitasa_users" value="1" />
                        <input type="hidden" name="vitasa_token" value="'.$token.'" />
                        <input type="hidden" name="vitasa_userid" value="'.$uid.'" />
                        <button type="submit" name="details" class="button-primary">Edit</button>
                    </form>
                </td>
        ');

		echo('
                <td>
                    <form action="" method="post">
                        <input type="hidden" name="vitasa_users" value="1" />
                        <input type="hidden" name="vitasa_token" value="'.$token.'" />
                        <input type="hidden" name="vitasa_userid" value="'.$uid.'" />
                        <button type="submit" name="workitems" class="button-primary">Edit</button>
                    </form>
                </td>
        ');

		echo('
                <td>
                    <form action="" method="post">
                        <input type="hidden" name="vitasa_users" value="1" />
                        <input type="hidden" name="vitasa_token" value="'.$token.'" />
                        <input type="hidden" name="vitasa_userid" value="'.$uid.'" />
                        <button type="submit" name="delete" class="button-primary">Delete</button>
                    </form>
                </td>
             </tr>
            ');
	}

	echo('
        </tbody>
    </table>
');
}

function do_show_user($token, $uid)
{

}

function do_show_userworkitems($token, $uid)
{

}

function do_show_userdelete($token, $uid)
{

}

function userHasAdmin($user)
{
	$res = false;

	$roles = $user->roles;
	foreach ($roles as $role) {
		if (strtolower($role) == 'admin')
		{
			$res = true;
			break;
		}
	}

	return $res;
}

function userHasSiteCoordinator($user)
{
	$res = false;

	$roles = $user->roles;
	foreach ($roles as $role) {
		if (strtolower($role) == 'sitecoordinator')
		{
			$res = true;
			break;
		}
	}

	return $res;
}

function userHasVolunteer($user)
{
	$res = false;

	$roles = $user->roles;
	foreach ($roles as $role) {
		if (strtolower($role) == 'volunteer')
		{
			$res = true;
			break;
		}
	}

	return $res;
}




?>