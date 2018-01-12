<?php

define("__URL", "https://volunteer-savvy.com/");

// make the api call to implement the login
// returns a string, the token if successful, otherwise an empty string
function backend_login($name, $pw)
{
	$url = __URL.'login';

	$body = json_encode(array( 'email' => $name, 'password' => $pw ));

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $body);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	//curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	//$cookies = curl_getinfo($ch, CURLINFO_COOKIELIST); didn't return anything...
	curl_close($ch);

	$token = '';
	if ($httpCode != 200)
		return $token;

	$token = getTokenFromResponse($response);

	$jb = getJsonFromResponse($response);
	$user = json_decode($jb);                       // and decode our user from that text so we can find his permissions

	// build the return associative array
	$res = array('token'=>$token, 'user'=>$user);

	return $res;
}

function getJsonFromResponse($response)
{
	$ix = strpos($response, '{');            // find the open-curl brace, that starts our data
	$jb = substr($response, $ix);                   // get just that portion

	return $jb;
}

function getTokenFromResponse($response)
{
	// todo: there has to be a better way of cracking the response...
	// extract the Set-Cookie value from the response
	$ix = strpos($response, 'Set-Cookie:'); // find the cookie in the stream
	$str1 = substr($response, $ix);               // get the string from that index to the end
	$iy = strpos($str1, ';');               // find the end of the cookie
	$str2 = substr($str1, 0, $iy);           // get from the start (Set-Cookie) to the ';'
	$ia = strlen('Set-Cookie: ');
	// and finally, get the token
	$token = substr($str2, $ia);                    // remove the prefix and the rest is out token

	return $token;
}

function getSites($token)
{
	$url = __URL.'sites';

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);

	if ($httpCode != 200)
		return null;

	// todo: there has to be a better way of cracking the response...
	$ix = strpos($response, '[');            // find the open-square bracket, that starts our data
	$jb = substr($response, $ix);                   // get just that portion

	$sites = json_decode($jb);                       // and decode our user from that text

	return $sites;
}

// $arr is an array that will be json encoded and sent to the backend
// returns true if successful, false otherwise
function updateSite($token, $slug, $arr) {
	$url = __URL.'sites/'.$slug;

	$body = json_encode($arr);

	$f = fopen('temp.txt', 'w');
	fwrite($f, $body);
	fclose($f);
	$f = fopen('temp.txt', 'r');

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
	curl_setopt($ch, CURLOPT_PUT, true);
	curl_setopt($ch, CURLOPT_INFILE, $f);
	curl_setopt($ch, CURLOPT_INFILESIZE, strlen($body));
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);

	echo('<br/>+++++ response +++++<br/>');
	print_r($response);
	echo('<br/>');

	return $httpCode == 200;
}

// $arr is an array that will be json encoded and sent to the backend
// returns true if successful, false otherwise
function updateSiteCal($token, $slug, $arr) {
	$id = $arr['id'];
	$url = __URL.'sites/'.$slug.'/calendars/'.$id;

	$body = json_encode($arr);

	$f = fopen('temp.txt', 'w');
	fwrite($f, $body);
	fclose($f);
	$f = fopen('temp.txt', 'r');

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
	curl_setopt($ch, CURLOPT_PUT, true);
	curl_setopt($ch, CURLOPT_INFILE, $f);
	curl_setopt($ch, CURLOPT_INFILESIZE, strlen($body));
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);

	return $httpCode == 200;
}

function getSite($slug, $token)
{
	$url = __URL.'sites/'.$slug;

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);

	if ($httpCode != 200)
		return null;

	// todo: there has to be a better way of cracking the response...
	$ix = strpos($response, '{');            // find the open-square bracket, that starts our data
	$jb = substr($response, $ix);                   // get just that portion

	$site = json_decode($jb);                       // and decode our user from that text

	return $site;
}

function getShift($slug, $calendarEntryId, $shiftId) {
	$url = __URL.'sites/'.$slug.'/calendars/'.$calendarEntryId.'/shifts/'.$shiftId;

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);

	if ($httpCode != 200)
		return null;

	$jb = getJsonFromResponse($response);

	$shift = json_decode($jb);                       // and decode our user from that text

	return $shift;

}

function getUser($userid, $token)
{
	$url = __URL.'users/'.$userid;

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);

	if ($httpCode != 200)
		return null;

	// todo: there has to be a better way of cracking the response...
	$ix = strpos($response, '{');            // find the open-square bracket, that starts our data
	$jb = substr($response, $ix);                   // get just that portion

	$user = json_decode($jb);                       // and decode our user from that text

	return $user;
}

function getUsers($token)
{
	$url = __URL.'users';

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);

	if ($httpCode != 200)
		return null;

	// todo: there has to be a better way of cracking the response...
	$ix = strpos($response, '[');            // find the open-square bracket, that starts our data
	$jb = substr($response, $ix);                   // get just that portion

	$users = json_decode($jb);                       // and decode our user from that text

	return $users;
}

function removeSignUp($signupid, $token) {
	$url = __URL.'signups/'.$signupid;

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'DELETE');
	curl_setopt($ch, CURLOPT_PUT, true);
	//curl_setopt($ch, CURLOPT_INFILE, $f);
	//curl_setopt($ch, CURLOPT_INFILESIZE, strlen($body));
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);

	return ($httpCode == 200) || ($httpCode == 204);
}

function updateSignUpHours($signupid, $hours, $userid, $token) {
	$url = __URL.'signups/'.$signupid;

	$abody = array();
	$abody['hours'] = $hours;
	$abody['userid'] = $userid;

	$body = json_encode($abody);

	$f = fopen('temp.txt', 'w');
	fwrite($f, $body);
	fclose($f);
	$f = fopen('temp.txt', 'r');

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
	curl_setopt($ch, CURLOPT_PUT, true);
	curl_setopt($ch, CURLOPT_INFILE, $f);
	curl_setopt($ch, CURLOPT_INFILESIZE, strlen($body));
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_HEADER, TRUE);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_COOKIE, $token);
	$response = curl_exec($ch);
	$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	curl_close($ch);

	echo('http code:'.$httpCode.'<br/>'); // --------------------------------------------------------

	return $httpCode == 200;
}

function userHasAdmin($roles)
{
	$res = false;

	foreach ($roles as $role) {
		if (strtolower($role) == 'admin')
		{
			$res = true;
			break;
		}
	}

	return $res;
}

function userHasSiteCoordinator($roles)
{
	$res = false;

	foreach ($roles as $role) {
		if (strtolower($role) == 'sitecoordinator')
		{
			$res = true;
			break;
		}
	}

	return $res;
}

function userHasVolunteer($roles)
{
	$res = false;

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