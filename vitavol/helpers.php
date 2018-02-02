<?php
function getCalendarEntryForDate($site, $date) {
	$ce = false;

	$calEntries = $site->calendar_overrides;
	foreach ($calEntries as $calEntry) {
		if (datesMatch($calEntry->date, $date)) {
			$ce = $calEntry;
			break;
		}
	}

	return $ce;
}

function getCalendarEntryForCalendarId($site, $calId){
	$ce = null;

	$calEntries = $site->calendar_overrides;
	foreach ($calEntries as $calEntry) {
		if ($calEntry->id == $calId) {
			$ce = $calEntry;
			break;
		}
	}

	return $ce;
}

function getSignUpFromSignUpId($user, $signupid)
{
	$signup = null;

	$workintents = $user->work_intents;
	foreach ($workintents as $workintent) {
		if ($workintent->id == $signupid) {
			$signup = $workintent;
			break;
		}
	}

	return $signup;
}

function getSuggestionFromSuggestionID($user, $suggestionid) {
	$suggestion = null;

	$suggestions = $user->suggestions;

	foreach ( $suggestions as $sugg ) {
		if ($sugg->id == $suggestionid) {
			$suggestion = $sugg;
			break;
		}
	}

	return $suggestion;
}

function dateSplit($d) {
	$res = array();

	$da = explode('-', $d);

	$res['year'] = intval($da[0]);
	$res['month'] = intval($da[1]);
	$res['day'] = intval($da[2]);

	return $res;
}

function datesMatch($d1, $d2) {
	$d1s = dateSplit($d1);
	$d2s = dateSplit($d2);

	return (($d1s['year'] == $d2s['year']) && ($d1s['month'] == $d2s['month']) && ($d1s['day'] == $d2s['day']));
}

// returns 0 if the dates are equal
// returns -1 if $d1 is before $d2
// returns +1 if $d1 is after $d2
function dateCompare($d1, $d2) {
	$d1s = dateSplit($d1);
	$d2s = dateSplit($d2);

	$res = 0;

	if ($d1s['year'] < $d2s['year']) {
		$res = -1;
	} else if ($d1s['year'] > $d2s['year']) {
		$res = 1;
	} else {
		if ($d1s['month'] < $d2s['month']) {
			$res = -1;
		} else if ($d1s['month'] < $d2s['month']) {
			$res = 1;
		} else {
			if ($d1s['day'] < $d2s['day']) {
				$res = -1;
			} else if ($d1s['day'] < $d2s['day']) {
				$res = 1;
			} else {
				$res = 0;
			}
		}
	}

	return $res;
}

function dumpVar($name, $var) {
	echo('<br/>------------------- '.$name.' ----------------------------<br/>');
	var_dump($var);
	echo('<br/>-----------------------------------------------<br/>');
}

function printVar($name, $var) {
	echo($name.': '.$var.'<br/>');
}

function do_show_vol_navigation($token, $userid) {
	echo('
    <div class="signup-row">
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-signups" value="list" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <button type="submit" class="button-navigation">Sign Ups</button>
		    </form>
	    </div>
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-suggestions" value="list" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <button type="submit" class="button-navigation">Suggestions</button>
		    </form>
	    </div>
	    <br/>
	</div>
    <div class="signup-row">
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-profile" value="show" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <button type="submit" class="button-navigation">Profile</button>
		    </form>
	    </div>
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-login" value="show" />
		        <button type="submit" class="button-navigation">Logout</button>
		    </form>
	    </div>
	</div>
	<br/>
	');
}

function do_show_sc_navigation($userid, $token, $siteslug) {
	echo('
    <div class="sc_options_column">
    	<div class="sc-options-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-sitecoordinator" value="managevolunteers" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
		        <button type="submit" class="button-navigation">Manage Volunteers</button>
		    </form>
	    </div>
    	<div class="sc-options-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-sitecoordinator" value="sitecalendar" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
		        <button type="submit" class="button-navigation">Site Calendar</button>
		    </form>
	    </div>
    </div>
    <div class="sc_options_column">
    	<div class="sc-options-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-profile" value="show_sc" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
		        <button type="submit" class="button-navigation">Profile</button>
		    </form>
	    </div>
    	<div class="sc-options-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-login" value="show" />
		        <button type="submit" class="button-navigation">Logout</button>
		    </form>
	    </div>
	</div>
	<br/>
	');
}

// For times in 24-hour format: hh:mm:ss, converts to hh:mm am/pm
function timeFormat($time) {
	$timesplit = explode(':', $time);
	$hours = intval($timesplit[0]);
	$minutes = intval($timesplit[1]);

	$ampm = 'am';

	if ($hours == 12) {
		$ampm = 'pm';
	} else if ($hours > 12) {
		$hours = $hours - 12;
		$ampm = 'pm';
	} else if ($hours == 0) {
		$hours = 12;
	}

	$minutes_s = strval($minutes);
	if (strlen($minutes_s) < 2)
		$minutes_s = '0'.$minutes_s;

	$nts = $hours.':'.$minutes_s.' '.$ampm;

	return $nts;
}

// time in format of 2017-11-28T21:58:33.000Z is converted to 12-hour format, for CST
function timeFormatZ($time) {
	//date_default_timezone_set('America/Chicago');
	$dt = new DateTime($time);
	$dt->setTimezone(new DateTimeZone('America/Chicago'));
	$dts = $dt->format('l M j, Y h:i a');

	return $dts;
}

// input as 2018-1-16 return Tuesday Jan 16, 2018
function dateFormat($date) {
	$ed = explode('-', $date);
	$year = intval($ed[0]);
	$month = intval($ed[1]);
	$day = intval($ed[2]);
	$nd = mktime(12, 0, 0, $month, $day, $year);

	$ds = date('l M j, Y', $nd);
	return $ds;
}

function siteIsOpen($day, $month, $year, $siteSchedule) {
	$res = false;

	$ds = $year.'-'.$month.'-'.$day;

	foreach ( $siteSchedule as $item ) {
		$date = $item->date;
		$sites = $item->sites;
		$count = count($sites);

		$match = datesMatch($ds, $date);

		if ($match && ($count != 0)) {
			$res = true;
			break;
		}
	}

	return $res;
}

function siteIsOpenOnDate($ds, $siteSchedule) {
	$res = false;

	foreach ( $siteSchedule as $item ) {
		$date = $item->date;
		$sites = $item->sites;
		$count = count($sites);

		$match = datesMatch($ds, $date);

		if ($match && ($count != 0)) {
			$isclosed = $item->is_closed;
			$res = !$isclosed;
			break;
		}
	}

	return $res;
}

function getSiteScheduleForDate($day, $month, $year, $siteSchedule) {
	$res = null;

	$ds = $year.'-'.$month.'-'.$day;

	foreach ( $siteSchedule as $item ) {
		$date = $item->date;
		$sites = $item->sites;
		$count = count($sites);

		$match = datesMatch($ds, $date);

		if ($match && ($count != 0)) {
			$res = $item;
			break;
		}
	}

	return $res;
}

function getSiteScheduleOnDate($ds, $siteSchedule) {
	$res = null;

	foreach ( $siteSchedule as $item ) {
		$date = $item->date;
		$sites = $item->sites;
		$count = count($sites);

		$match = datesMatch($ds, $date);

		if ($match && ($count != 0)) {
			$res = $item;
			break;
		}
	}

	return $res;
}

function anyShiftUnderStaffed($siteschedule) {
	$res = false;

	$shifts = $siteschedule->shifts;
	foreach ( $shifts as $shift ) {
		$anyNeed = ($shift->eFilersSignedUpBasic < $shift->eFilersNeededBasic)
		          || ($shift->eFilersSignedUpAdvanced < $shift->eFilersNeededAdvanced);
		if ($anyNeed) {
			$res = false;
			break;
		}
	}

	return $res;
}

function getSignUpsForDate($signups, $date) {
	$res = array();

	foreach ( $signups as $signup ) {
		if (datesMatch($signup->date, $date))
			array_push($res, $signup);
	}

	return $res;
}

function getSignUpsNotApproved($signups) {
	$res = 0;

	foreach ( $signups as $signup ) {
		if (!$signup->approved)
			$res++;
	}

	return $res;
}

function countSignUpsAtCertLevel($shift, $cert) {
	$cnt = 0;

	$signups = $shift->signups;
	foreach ($signups as $signup) {
		$suuser = $signup->user;
		$sucert = strtolower($suuser->certification);
		if ($sucert == $cert)
			$cnt ++;
	}

	return $cnt;
}

function getShiftByShiftId($shiftid, $shifts) {
	$res = false;

	foreach ( $shifts as $shift ) {
		if ($shift->id == $shiftid) {
			$res = $shift;
			break;
		}
	}

	return $res;
}

function getSiteFromSites($siteslug, $sites) {
	$res = null;

	foreach ( $sites as $site ) {
		$sn = $site->slug;
		if ($sn == $siteslug) {
			$res = $site;
			break;
		}
	}

	return $res;
}


?>