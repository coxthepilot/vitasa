<?php

// make the api call to implement the login
// returns a string, the token if successful, otherwise an empty string
function backend_login($name, $pw)
{
	$url = 'https://vitasa.abandonedfactory.net/login';

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

	// todo: there has to be a better way of cracking the response...
	// extract the Set-Cookie value from the response
	$ix = strpos($response, 'Set-Cookie:'); // find the cookie in the stream
	$str1 = substr($response, $ix);               // get the string from that index to the end
	$iy = strpos($str1, ';');               // find the end of the cookie
	$str2 = substr($str1, 0, $iy);           // get from the start (Set-Cookie) to the ';'
	$ia = strlen('Set-Cookie: ');
	// and finally, get the token
	$token = substr($str2, $ia);                    // remove the prefix and the rest is out token

	$ix = strpos($response, '{');            // find the open-curl brace, that starts our data
	$jb = substr($response, $ix);                   // get just that portion

	$user = json_decode($jb);                       // and decode our user from that text

	// we only accept users that have admin priviledge
	if (!userHasAdmin($user))
		$token = '';

	return $token;
}

function getSites($token)
{
	$url = 'https://vitasa.abandonedfactory.net/sites';

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
	$url = 'https://vitasa.abandonedfactory.net/sites/'.$slug;

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
	$url = 'https://vitasa.abandonedfactory.net/sites/'.$slug.'/calendars/'.$id;

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
	$url = 'https://vitasa.abandonedfactory.net/sites/'.$slug;

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

function getUser($userid, $token)
{
	$url = 'https://vitasa.abandonedfactory.net/users/'.$userid;

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
	$url = 'https://vitasa.abandonedfactory.net/users';

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

?>