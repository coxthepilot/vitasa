<?php

include_once "helpers.php";

$signupMap = array();
registerMap('vitasa-signups', $signupMap);

addCommandToMap('vitasa-signups', 'list', 'signup_list');
function signup_list() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];

	$user = getUser($userid, $token);

	do_show_signups($user, $token);
}

function do_show_signups($user, $token) {
	$signups = $user->work_intents;
	$userid = $user->id;

	$sites = array(); // associative, site slug -> site

	echo('
    <h2>Volunteer Sign Ups</h2>
    ');

	do_show_vol_navigation($token, $userid);

	echo('
	<br/>
    <div class="signup-row">
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-signups" value="showcalendar" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <button type="submit" class="button-navigation-new">New SignUp</button>
		    </form>
	    </div>
    </div>
    <br/><br/>
	');

	foreach ( $signups as $signup ) {
		$siteName = $signup->site_name;
		$date = $signup->date;
		$signupid = $signup->id;
		$siteslug = $signup->site;
		$shiftId = $signup->shift_id;

		$site = null;
		if (array_key_exists($siteslug, $sites)) {
			$site = $sites[$siteslug];
		} else {
			$site = fetchSite($siteslug, $token);
			$sites[$siteslug] = $site;
		}

		$calendarEntry = getCalendarEntryForDate($site, $date);
		$calendarEntryId = $calendarEntry->id;

		$shift = fetchShift($siteslug, $calendarEntryId, $shiftId, $token);

		$times = timeFormat($shift->start_time).' - '.timeFormat($shift->end_time);

		// find the calendar entry for this date
		// get the shift

		echo('
			<br/>
            <form action="" method="post">
                <input type="hidden" name="vitasa-signups" value="details" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-signupid" value="'.$signupid.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <button type="submit" class="button-sitename">'.$siteName.'</button>
            </form>
            <span class="signuptext">'.dateFormat($date).'</span><br/>
            <span class="signuptext">'.$times.'</span><br/>
            ');

		echo('
            <form action="" method="post">
                <input type="hidden" name="vitasa-signups" value="remove" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-signupid" value="'.$signupid.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <button type="submit" class="button-primary">Remove</button>
            </form>
        ');
	}
}

addCommandToMap('vitasa-signups', 'details', 'signup_details');
function signup_details() {
	$token = $_POST['vitasa-token'];

	$userid = $_POST['vitasa-userid'];
	$user = getUser($userid, $token);

	$signupid = $_POST['vitasa-signupid'];
	$signup = getSignUpFromSignUpId($user, $signupid);

	$siteslug = $signup->site;
	$site = fetchSite($siteslug, $token);

	$date = $signup->date;
	$calendarEntry = getCalendarEntryForDate($site, $date);

	$calendarEntryId = $calendarEntry->id;
	$shiftId = $signup->shift_id;
	$shift = fetchShift($siteslug, $calendarEntryId, $shiftId, $token);

	$siteName = $site->name;
	$siteaddress = $site->street.', '.$site->city.', '.$site->state.' '.$site->zip;
	$datetimes = dateFormat($date).' ['.timeFormat($shift->start_time).' - '.timeFormat($shift->end_time).']';

	$hours = $signup->hours;

	echo('
        <h2>Volunteer SignUp<br/>Sign Up Details</h2>
        ');

	do_show_vol_navigation($token, $userid);

	echo('
        <span class="sitename">'.$siteName.'</span><br/>
        '.$siteaddress.'<br/>
        '.$datetimes.'<br/><br/>
        <form action="" method="post">
            <input type="hidden" name="vitasa-signups" value="savehours" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <input type="hidden" name="vitasa-signupid" value="'.$signupid.'" />
            <input type="text" name="vitasa-signup-hours" value="'.$hours.'" />
            <button type="submit" class="button-primary">Update Hours</button>
        </form>
		<br/>
		<br/>
        <form action="" method="post">
            <input type="hidden" name="vitasa-signups" value="list" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <input type="hidden" name="vitasa-signupid" value="'.$signupid.'" />
            <button type="submit" class="button-primary">Back</button>
        </form>
    ');
}

addCommandToMap('vitasa-signups', 'remove', 'signup_remove');
function signup_remove() {
	$Token = $_POST['vitasa-token'];
	$signupid = $_POST['vitasa-signupid'];

	$success = removeSignUp($signupid, $Token);

	if (!$success) {
		echo('Unable to remove signup.<br/>');
	}

	$userid = $_POST['vitasa-userid'];
	$user = getUser($userid, $Token);

	do_show_signups($user, $Token);
}

addCommandToMap('vitasa-signups', 'showcalendar', 'signup_showcalendar');
function signup_showcalendar() {
	$token = $_POST['vitasa-token'];

	$month = date('n');
	if (!empty($_POST['vitasa-signups-month'])) {
		$month = $_POST['vitasa-signups-month'];
	}

	$year = date('Y');
	if (!empty($_POST['vitasa-signups-year'])) {
		$year = $_POST['vitasa-signups-year'];
	}

	$monthp1 = $month + 1;
	$yearp1 = $year;
	if ($monthp1 > 12) {
		$monthp1 = 1;
		$yearp1 = $year + 1;
	}

	$monthm1 = $month - 1;
	$yearm1 = $year;
	if ($monthm1 < 1) {
		$monthm1 = 12;
		$yearm1 = $year - 1;
	}

	$userid = $_POST['vitasa-userid'];

	$monthNames = array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
	$monthName = $monthNames[$month - 1];
	$daysInMonth = cal_days_in_month(CAL_GREGORIAN, $month, $year);
	$from = $year.'-'.$month.'-1';
	$to = $year.'-'.$month.'-'.$daysInMonth;
	$siteSchedule = getSiteSchedule($from, $to);
	// get the user data so we can show when he is already signed up
	$user = getUser($userid, $token);

	// build the image list
	$imagelist = array();
	$imagelist['grey'] = 'images/grey.png';
	$imagelist['orange'] = 'images/orange.png';
	$imagelist['orangeboxed'] = 'images/orangeboxed.png';

	// build the gridstate table
	$gridstate = buildVolCalendarGridState($user, $siteSchedule, $month, $year);

	echo('
    <h2>Volunteer Sign Ups<br/>Calendar</h2>
    ');

	do_show_vol_navigation($token, $userid);

	echo('    
    <div class="calendar-headerrow">
        <div class="calendar-cell">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-signups" value="showcalendar" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <input type="hidden" name="vitasa-signups-month" value="'.$monthm1.'" />
		        <input type="hidden" name="vitasa-signups-year" value="'.$yearm1.'" />
		        <button type="submit" class="button-primary">Prev</button>
		    </form>
	    </div>
	    <div class="calendar-cell">
	    	'.$monthName.'-'.$year.'
		</div>
        <div class="calendar-cell">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-signups" value="showcalendar" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <input type="hidden" name="vitasa-signups-month" value="'.$monthp1.'" />
		        <input type="hidden" name="vitasa-signups-year" value="'.$yearp1.'" />
		        <button type="submit" class="button-primary">Next</button>
		    </form>
	    </div>    	
	</div>
    <br/><br/><br/>
    ');

	buildVolCalendarGrid($gridstate, $imagelist, $token, $userid, $month, $year);

	echo('
		<br/>
        <form action="" method="post">
            <input type="hidden" name="vitasa-signups" value="list" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <button type="submit" class="button-primary">Back</button>
        </form>
	');
}

addCommandToMap('vitasa-signups', 'savehours', 'signup_savehours');
function signup_savehours() {
	$Token = $_POST['vitasa-token'];
	$signupid = $_POST['vitasa-signupid'];
	$userid = $_POST['vitasa-userid'];
	$hours = $_POST['vitasa-signup-hours'];

	$success = updateSignUpHours($signupid, $hours, $userid, $Token);

	if (!$success) {
		echo('Unable to update the hours for the signup.<br/>');
	}

	$user = getUser($userid, $Token);
	do_show_signups($user, $Token);
}

addCommandToMap('vitasa-signups', 'sitesondate', 'signup_sitesondate');
function signup_sitesondate() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$day    = $_POST['vitasa-signups-day'];
	$month  = $_POST['vitasa-signups-month'];
	$year   = $_POST['vitasa-signups-year'];

	$d = $year.'-'.$month.'-'.$day;
	echo('
    <h2>Volunteer Sign Ups<br/>'.$d.'</h2>
    ');

	do_show_vol_navigation($token, $userid);

	// get a list of sites that are open on this date
	$daysInMonth = cal_days_in_month(CAL_GREGORIAN, $month, $year);
	$from = $year.'-'.$month.'-1';
	$to = $year.'-'.$month.'-'.$daysInMonth;
	$siteSchedule = getSiteSchedule($from, $to);

	$sitesSchedule = getSiteScheduleForDate($day, $month, $year, $siteSchedule);
	$sites = $sitesSchedule->sites;

	foreach ( $sites as $site ) {
		$siteslug = $site->slug;
		$site = fetchSite($siteslug, $token);
		$sitename = $site->name;
		echo('
			<br/>
            <form action="" method="post">
                <input type="hidden" name="vitasa-signups" value="siteondate" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-signups-day" value="'.$day.'" />
                <input type="hidden" name="vitasa-signups-month" value="'.$month.'" />
                <input type="hidden" name="vitasa-signups-year" value="'.$year.'" />
                <input type="hidden" name="vitasa-signups-siteslug" value="'.$siteslug.'" />
                <button type="submit" class="button-sitename">'.$sitename.'</button>
            </form>
            ');
	}

	echo('
	<br/><br/>
		<br/>
        <form action="" method="post">
                <input type="hidden" name="vitasa-signups" value="showcalendar" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-signups-month" value="'.$month.'" />
                <input type="hidden" name="vitasa-signups-year" value="'.$year.'" />
            <button type="submit" class="button-primary">Back</button>
        </form>
	');
}

addCommandToMap('vitasa-signups', 'siteondate', 'signup_siteondate');
function signup_siteondate() {
	$token = $_POST['vitasa-token'];
	$userid   = $_POST['vitasa-userid'];
	$day      = $_POST['vitasa-signups-day'];
	$month    = $_POST['vitasa-signups-month'];
	$year     = $_POST['vitasa-signups-year'];
	$siteslug = $_POST['vitasa-signups-siteslug'];

	$d = $year.'-'.$month.'-'.$day;
	$site = fetchSite($siteslug, $token);
	$sitename = $site->name;
	echo('
    <h2>Volunteer Sign Ups<br/>'.$sitename.'<br/>'.$d.'</h2>
    ');

	do_show_vol_navigation($token, $userid);

	echo('
		<br/><br/>
	');

	// find calendar entry for this date
	$date = $year.'-'.$month.'-'.$day;
	$calendarEntry = getCalendarEntryForDate($site, $date);

	// get the shifts for this calendar entry
	$shifts = fetchAllShiftsForCalendarEntry($siteslug, $calendarEntry->id, $token);

	$user = getUser($userid, $token);
	$cert = $user->certification;

	echo('
		<form action="" method="post">
	');

	$ix = 0;
	foreach ( $shifts as $shift ) {
		$open    = $shift->start_time;
		$close   = $shift->end_time;
		$ef_n_b  = $shift->efilers_needed_basic - countSignUpsAtCertLevel($shift, 'basic');
		$ef_n_a  = $shift->efilers_needed_advanced - countSignUpsAtCertLevel($shift, 'advanced');
		$shiftid = $shift->id;

		$isalreadysignedup = userIsSignedUpForShift($user, $shiftid);
		//$sus = $isalreadysignedup ? "Already signed up for this shift" : "";

		$ef_n = (strtolower($cert) == 'basic') ? $ef_n_b : $ef_n_a;

		if ((!$isalreadysignedup) && ($ef_n > 0)) {
			$text = $open . ' - ' . $close . ' [need ' . $ef_n . ']';

			echo('
				<input type="checkbox" name="vitasa-signups-shift'.$ix.'" value="'.$shiftid.'">'.$text.'<br/><br/>
			');

			$ix++;
		}
	}
	echo( '
			<br/><br/>
	        <input type="hidden" name="vitasa-signups" value="signupforsitedateshifts" />
	        <input type="hidden" name="vitasa-token" value="' . $token . '" />
	        <input type="hidden" name="vitasa-userid" value="' . $userid . '" />
	        <input type="hidden" name="vitasa-signups-day" value="' . $day . '" />
	        <input type="hidden" name="vitasa-signups-month" value="' . $month . '" />
	        <input type="hidden" name="vitasa-signups-year" value="' . $year . '" />
	        <input type="hidden" name="vitasa-signups-siteslug" value="' . $siteslug . '" />
	        <input type="hidden" name="vitasa-signups-maxshifts" value="' . $ix . '" />
	        <button type="submit" class="button-primary">Sign Me Up for Selected Shifts</button>
	    </form><br/>
' );

	echo('
	<br/><br/>
		<br/>
        <form action="" method="post">
                <input type="hidden" name="vitasa-signups" value="sitesondate" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-signups-day" value="'.$day.'" />
                <input type="hidden" name="vitasa-signups-month" value="'.$month.'" />
                <input type="hidden" name="vitasa-signups-year" value="'.$year.'" />
            <button type="submit" class="button-primary">Back</button>
        </form>
	');
}

addCommandToMap('vitasa-signups', 'signupforsitedateshifts', 'signup_signupforsitedateshifts');
function signup_signupforsitedateshifts() {
	$token = $_POST['vitasa-token'];
	$userid   = $_POST['vitasa-userid'];
	$day      = $_POST['vitasa-signups-day'];
	$month    = $_POST['vitasa-signups-month'];
	$year     = $_POST['vitasa-signups-year'];
	$siteslug = $_POST['vitasa-signups-siteslug'];
	$shiftcount = $_POST['vitasa-signups-maxshifts'];
	$signupshifts = array();
	for($ix = 0; $ix != $shiftcount; $ix++) {
		if (!empty($_POST['vitasa-signups-shift'.$ix])) {
			$signupshift = $_POST['vitasa-signups-shift'.$ix];
			array_push($signupshifts, $signupshift);
		}
	}

	$cnt = count($signupshifts);
	for($ix = 0; $ix != $cnt; $ix++) {
		// process each of the signups
		$shiftid = $signupshifts[$ix];
		$success = addSignUp($siteslug, $day, $month, $year, $userid, $shiftid, $token);
		if (!$success)
			echo('Unable to add signup ['.$shiftid.'].');
	}

	$user = getUser($userid, $token);
	do_show_signups($user, $token);
}

// ----------------------------------------------------------------------------------------------------------------
//                supporting functions
// ----------------------------------------------------------------------------------------------------------------

// returns a gridstate array[0..7*] with assoc for each entry:
// * text (to display in the grid cell)
// * canclick (bool on whether the text is clickable)
// * background (name from the imageList for background)
// * textcolor (name of color for text)
function buildVolCalendarGridState($user, $siteschedule, $month, $year) {
	// init the results array
	$gridstate = array();

	$dowMap = array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');

	// first, put the names of the days of the week in the grid list
	for($ix = 0; $ix != 7; $ix++) {
		$griditem = array();
		$griditem['text'] = $dowMap[$ix];
		$griditem['canclick'] = false;
		$griditem['textcolor'] = 'black';
		$griditem['background'] = 'none';

		array_push($gridstate, $griditem);
	}

	// find the day of the week for the first date in the month; this is how many blank grids we need at the start
	$dts = '1-'.$month.'-'.$year;
	$dt = strtotime($dts);
	$dow = date('w', $dt); // should return a number for the day of week (0:Sunday, ...)

	// find how many days are in the month
	$dim = cal_days_in_month(CAL_GREGORIAN, $month, $year);
	
	// grids created counter
	$gridelements = 0;

	for($ix = 0; $ix != $dow; $ix++) {
		$griditem = array();
		$griditem['text'] = '';
		$griditem['canclick'] = false;
		$griditem['textcolor'] = 'black';
		$griditem['background'] = 'none';

		array_push($gridstate, $griditem);
		
		$gridelements++;
	}

	// one entry for each day in the month
	for($ix = 1; $ix <= $dim; $ix++) {
		$griditem = array();

		//$sio = siteIsOpen($ix, $month, $year, $siteschedule);
		if (!siteIsOpen($ix, $month, $year, $siteschedule)) {
			$griditem['text'] = $ix;
			$griditem['canclick'] = false;
			$griditem['textcolor'] = 'white';
			$griditem['background'] = 'grey';
		} else if (userIsSignedUp($ix, $month, $year, $user)) {
			$griditem['text'] = $ix;
			$griditem['canclick'] = true;
			$griditem['textcolor'] = 'black';
			$griditem['background'] = 'orangeboxed';
			$griditem['day'] = $ix;
		} else {
			$griditem['text'] = $ix;
			$griditem['canclick'] = true;
			$griditem['textcolor'] = 'black';
			$griditem['background'] = 'orange';
			$griditem['day'] = $ix;
		}
		array_push($gridstate, $griditem);

		$gridelements++;
	}

	// pad the grid to the end of the week as needed
	$td = 7 - ($gridelements % 7);
	if ($td != 7) {
		for($ix = 0; $ix != $td; $ix++) {
			$griditem = array();
			$griditem['text'] = '';
			$griditem['canclick'] = false;
			$griditem['textcolor'] = 'black';
			$griditem['background'] = 'none';

			array_push($gridstate, $griditem);

			$gridelements++;
		}
	}

	return $gridstate;
}

function userIsSignedUp($day, $month, $year, $user) {
	$res = false;

	$ds = $year.'-'.$month.'-'.$day;

	$signups = $user->work_intents;

	foreach ( $signups as $signup ) {
		if (datesMatch($signup->date, $ds)) {
			$res = true;
			break;
		}
	}

	return $res;
}

function userIsSignedUpForShift($user, $shiftid) {
	$res = false;

	$signups = $user->work_intents;

	foreach ( $signups as $signup ) {
		$shid = $signup->shift_id;
		if ($shid == $shiftid) {
			$res = true;
			break;
		}
	}
	
	return $res;
}

function buildVolCalendarGrid($gridstate, $imagelist, $token, $userid, $month, $year) {
	// build the grid

	$gridindex = 0;
	$gridItemCount = count($gridstate);

	echo('
		<div class="calender-grid-wrapper">
			<div class="calendar-grid">
	');
	while ($gridindex != $gridItemCount) {
		$gridelement = $gridstate[$gridindex];

		$text = $gridelement["text"];
		$textcolor = $gridelement['textcolor'];
		$bgimagename = $gridelement['background'];
		$canclick = $gridelement['canclick'];

		$divclassimage = '';
		if ($bgimagename != 'none') {
			$bgimage = $imagelist[$bgimagename];
			$divclassimage = 'style="background-image: url('.$bgimage.'); height: 40px; width: 40px;"';
		}

		echo('
			<div class="calendar-grid-element" '.$divclassimage.'>
		');

		if ($canclick) {
			$day = $gridelement['day'];
			echo('
            <form action="" method="post">
                <input type="hidden" name="vitasa-signups" value="sitesondate" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-signups-day" value="'.$day.'" />
                <input type="hidden" name="vitasa-signups-month" value="'.$month.'" />
                <input type="hidden" name="vitasa-signups-year" value="'.$year.'" />
                <button type="submit" class="calendar-grid-clickable">'.$text.'</button>
            </form>
			');
		} else {
			echo('<p align="center" style="color:'.$textcolor.'">'.$text.'</p>');
		}

		echo('
			</div>
		');

		$gridindex++;
	}

	echo('
			</div>
		</div>
	');
}

?>