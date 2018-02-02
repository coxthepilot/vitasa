<?php
$funcMap = array();

include_once 'vitaapi.php';
include_once 'login.php';
include_once 'showheader.php';
include_once 'signups.php';
include_once 'suggestions.php';
include_once 'profile.php';
include_once 'about.php';
include_once 'register.php';
include_once 'showfooter.php';
include_once "sitecoordinator.php";

//dumpFuncMap();

showHeader();

showBody();

showFooter();


function registerMap($name, $map) {
	global $funcMap;

	$funcMap[$name] = $map;
}

function addCommandToMap($map, $cmd, $func) {
	global $funcMap;

	$cmap = false;
	foreach ( $funcMap as $key => $value ) {
		if ($key == $map) {
			$cmap = $value;
			break;
		}
	}
	if ($cmap !== false) {
		$na = array();
		foreach ( $cmap as $k => $v ) {
			$na[$k] = $v;
		}
		$na[$cmd] = $func;

		$funcMap[$map] = $na;
	}
}

function showBody() {
	global $funcMap;

	$keyFound = null;
	$keyValue = null;
	$cmdFound = null;

	$cmdFunc = null;
	foreach ( $funcMap as $key => $value ) {
		if (!empty($_POST[$key])) {
			//$keyFound = $key;
			//$keyValue = $_POST[$key];
			$fcmd = $_POST[$key];
			foreach ( $value as $k => $v ) {
				if ($k == $fcmd) {
					//$cmdFound = $k;
					$cmdFunc = $v;
					break;
				}
			}
			break;
		}
	}
	//echo('keyFound: ['.$keyFound.'] and cmdFound ['.$cmdFound.'] looking for ['.$keyValue.']<br/>');
	if ($cmdFunc == null)
		$cmdFunc = 'do_show_login';

	$cmdFunc();
}

function dumpFuncMap() {
	global $funcMap;

	foreach ( $funcMap as $key => $value ) {
		echo($key.':<br/>');
		foreach ( $value as $k => $v ) {
			echo('&nbsp;&nbsp;&nbsp;'.$k.' => '.$v.'<br/>');
		}
	}
}
?>

