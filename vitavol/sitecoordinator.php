<?php

include_once "helpers.php";
include_once "vitaapi.php";

define("SCNAME", 'vitasa-sitecoordinator');

$signupMap = array();
registerMap(SCNAME, $signupMap);

addCommandToMap(SCNAME, 'options', 'sitecoordinator_options');
function sitecoordinator_options() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$siteslug = $_POST['vitasa-siteslug'];

	do_sitecoordinator_options($userid, $token, $siteslug);
}

function do_sitecoordinator_options($userid, $token, $siteslug) {
	$site = fetchSite($siteslug, $token);
	$sitename = $site->name;

	echo('
    <h2>Site Coordinator<br/>
    '.$sitename.'</h2><br/>
    ');

	do_show_sc_navigation($userid, $token, $siteslug);
}

function do_sitecoordinator_siteselection($userid, $token) {
	echo('
    <h2>Site Coordinator<br/>
    Select Site to Manage</h2><br/>
    ');

	$user = getUser($userid, $token);
	$sitescoordinated = $user->sites_coordinated;

	foreach ( $sitescoordinated as $sitecoordinated ) {
		$siteslug = $sitecoordinated->slug;
		$site = fetchSite($siteslug, $token);
		$sitename = $site->name;
		echo('
			<br/>
            <form action="" method="post">
                <input type="hidden" name="vitasa-sitecoordinator" value="options" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
                <button type="submit" class="button-sitename">'.$sitename.'</button>
            </form>
        ');
	}
}

addCommandToMap(SCNAME, 'managevolunteers', 'sitecoordinator_managevolunteers');
function sitecoordinator_managevolunteers() {
	$monthNames = array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$siteslug = $_POST['vitasa-siteslug'];

	$site = fetchSite($siteslug, $token);
	$sitename = $site->name;

	echo('
    <h2>Site Coordinator<br/>
    Manage Volunteers<br/>
    '.$sitename.'</h2><br/>
    ');

	do_show_sc_navigation($userid, $token, $siteslug);

	echo('<br/>');

	// show a calendar
	$month = date('n');
	if (!empty($_POST['vitasa-month'])) {
		$month = $_POST['vitasa-month'];
	}

	$year = date('Y');
	if (!empty($_POST['vitasa-year'])) {
		$year = $_POST['vitasa-year'];
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

	$monthName = $monthNames[$month - 1];
	$daysInMonth = cal_days_in_month(CAL_GREGORIAN, $month, $year);
	$from = $year.'-'.$month.'-1';
	$to = $year.'-'.$month.'-'.$daysInMonth;

	$siteSchedule = getSiteSchedule($from, $to);

	$signups = getSignUpsForSiteInDateRange($siteslug, $from, $to);

	// build the image list
	$imagelist = array();
	$imagelist['grey'] = 'images/grey.png';
	$imagelist['orange'] = 'images/orange.png';
	$imagelist['orangeboxed'] = 'images/orangeboxed.png';
	$imagelist['green'] = 'images/green.png';
	$imagelist['greenboxed'] = 'images/greenboxed.png';

	// build the gridstate table
	$gridstate = buildSCCalendarGridState($site, $siteSchedule, $signups, $month, $year);

	echo('    
    <div class="calendar-headerrow">
        <div class="calendar-cell">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-sitecoordinator" value="managevolunteers" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
		        <input type="hidden" name="vitasa-month" value="'.$monthm1.'" />
		        <input type="hidden" name="vitasa-year" value="'.$yearm1.'" />
		        <button type="submit" class="button-primary">Prev</button>
		    </form>
	    </div>
	    <div class="calendar-cell">
	    	'.$monthName.'-'.$year.'
		</div>
        <div class="calendar-cell">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-sitecoordinator" value="managevolunteers" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
		        <input type="hidden" name="vitasa-month" value="'.$monthp1.'" />
		        <input type="hidden" name="vitasa-year" value="'.$yearp1.'" />
		        <button type="submit" class="button-primary">Next</button>
		    </form>
	    </div>    	
	</div>
    <br/><br/><br/>
    ');

	buildSCCalendarGrid($gridstate, $imagelist, $token, $month, $year, $siteslug, $userid, 'sitevolshifts');

	echo('
		<br/>
        <form action="" method="post">
            <input type="hidden" name="vitasa-sitecoordinator" value="options" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
            <button type="submit" class="button-primary">Back</button>
        </form>
	');
}

addCommandToMap(SCNAME, 'sitevolshifts', 'sitecoordinator_sitevolshifts');
function sitecoordinator_sitevolshifts() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$day = $_POST['vitasa-day'];
	$month = $_POST['vitasa-month'];
	$year = $_POST['vitasa-year'];
	$siteslug = $_POST['vitasa-siteslug'];

	$date = $year.'-'.$month.'-'.$day;

	$site = fetchSite($siteslug, $token);
	$calendarEntry = getCalendarEntryForDate($site, $date);
	$shifts = fetchAllShiftsForCalendarEntry($siteslug, $calendarEntry->id, $token);

	$sitename = $site->name;

	echo('
    <h2>Site Coordinator<br/>
    Manage Volunteers<br/>
    '.$sitename.'<br/>
    '.$date.'</h2><br/>
    ');

	do_show_sc_navigation($userid, $token, $siteslug);

	foreach ( $shifts as $shift ) {
		$calendarEntryId = $shift->calendar_id;
		$open = $shift->start_time;
		$close = $shift->end_time;

		$calendarEntry = getCalendarEntryForCalendarId($site, $calendarEntryId);
		$date = $calendarEntry->date;

		$numbasichave = countSignUpsAtCertLevel($shift, 'basic');
		$numadvhave = countSignUpsAtCertLevel($shift, 'advanced');

		$text = $date.' : ['.timeFormat($open).' - '.timeFormat($close).']';
		$text2 = 'Basic: have : '.$numbasichave.' of '.$shift->efilers_needed_basic.' required, Advanced: have '.$numadvhave.' of '.$shift->efilers_needed_advanced.' required';

		$shiftid = $shift->id;
		echo('
			<br/>
            <form action="" method="post">
                <input type="hidden" name="vitasa-sitecoordinator" value="sitevolshift" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-day" value="'.$day.'" />
                <input type="hidden" name="vitasa-month" value="'.$month.'" />
                <input type="hidden" name="vitasa-year" value="'.$year.'" />
                <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
                <input type="hidden" name="vitasa-calendarentryid" value="'.$calendarEntryId.'" />
                <input type="hidden" name="vitasa-shiftid" value="'.$shiftid.'" />
                <button type="submit" class="button-sitename">'.$text.'</button>
                <br/>'.$text2.'
            </form>
        ');
	}

	echo('
		<br/>
        <form action="" method="post">
            <input type="hidden" name="vitasa-sitecoordinator" value="managevolunteers" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-month" value="'.$month.'" />
                <input type="hidden" name="vitasa-year" value="'.$year.'" />
                <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
            <button type="submit" class="button-primary">Back</button>
        </form>
	');

}

addCommandToMap(SCNAME, 'sitevolshift', 'sitecoordinator_sitevolshift');
function sitecoordinator_sitevolshift() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$day = $_POST['vitasa-day'];
	$month = $_POST['vitasa-month'];
	$year = $_POST['vitasa-year'];
	$siteslug = $_POST['vitasa-siteslug'];
	$shiftid = $_POST['vitasa-shiftid'];
	$calendarEntryId = $_POST['vitasa-calendarentryid'];

	$date = $year.'-'.$month.'-'.$day;

	$site = fetchSite($siteslug, $token);
	$shifts = fetchAllShiftsForCalendarEntry($siteslug, $calendarEntryId, $token);
	$shift = getShiftByShiftId($shiftid, $shifts);

	$sitename = $site->name;

	$open = $shift->start_time;
	$close = $shift->end_time;
	$openclose = '['.timeFormat($open).' - '.timeFormat($close).']';

	echo('
    <h2>Site Coordinator<br/>
    Manage Volunteer<br/>
    '.$sitename.'<br/>
    '.$date.'<br/>
    '.$openclose.'</h2><br/>
    ');

	do_show_sc_navigation($userid, $token, $siteslug);

	$wssignups = $shift->signups;

	$ix = 0;
	foreach ($wssignups as $wssignup) {
		$wssuuser = $wssignup->user;

		$wssuuser_signupid = $wssignup->id;
		$signup = fetchSignUp($wssuuser_signupid, $token);
		$hours = $signup->hours;
		$approved = $signup->approved;

		$approved_text = $approved ? "Approved" : "Not Approved";

		$wssuuser_name = $wssuuser->name;
		$wssuuser_cert = $wssuuser->certification;
		$wssuuser_phone = $wssuuser->phone;

		echo('
			<br/>
			<b>'.$wssuuser_name.'</b><br/>
			'.$wssuuser_phone.' - '.$wssuuser_cert.'<br/>
            
            Hours: &nbsp;
            <input type="hidden" name="vitasa-sitecoordinator-hours-signupid'.$ix.'" value="'.$wssuuser_signupid.'" form="form-approvehours" />
            <input type="text" name="vitasa-sitecoordinator-hours'.$ix.'" style="width: 50px;" form="form-approvehours" value="'.$hours.'" />
            &nbsp;'.$approved_text.'<br/>
        ');
		$ix++;
	}

	echo('
		<br/>
		<br/>
        <form action="" method="post" id="form-approvehours">
            <input type="hidden" name="vitasa-sitecoordinator" value="approvehours" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <input type="hidden" name="vitasa-day" value="'.$day.'" />
            <input type="hidden" name="vitasa-month" value="'.$month.'" />
            <input type="hidden" name="vitasa-year" value="'.$year.'" />
            <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
            <button type="submit" class="button-primary">Approve Hours</button>
        </form>
	');

	echo('
		<br/><br/>
        <form action="" method="post">
            <input type="hidden" name="vitasa-sitecoordinator" value="sitevolshifts" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <input type="hidden" name="vitasa-day" value="'.$day.'" />
            <input type="hidden" name="vitasa-month" value="'.$month.'" />
            <input type="hidden" name="vitasa-year" value="'.$year.'" />
            <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
            <button type="submit" class="button-primary">Back</button>
        </form>
	');

}

addCommandToMap(SCNAME, 'approvehours', 'sitecoordinator_approvehours');
function sitecoordinator_approvehours() {
	$token = $_POST['vitasa-token'];
//	$day = $_POST['vitasa-day'];
//	$month = $_POST['vitasa-month'];
//	$year = $_POST['vitasa-year'];
//	$siteslug = $_POST['vitasa-siteslug'];

	// get the values to approve: signupid and hours
	$signupstoapprove = array();
	$ix = 0;
	while (true) {
		$signupidstring = 'vitasa-sitecoordinator-hours-signupid'.$ix;
		$signuphoursstring = 'vitasa-sitecoordinator-hours'.$ix;

		if (!empty($_POST[$signupidstring])) {
			$hours = $_POST[$signuphoursstring];
			$signupid = $_POST[$signupidstring];

			$success = approveSignUpHours($signupid, $hours, 'true', $token);
			if (!$success)
				echo('Update to approve hours failed ['.$signupid.']<br/>');
		}
		else
			break;

		$ix++;
	}
	sitecoordinator_sitevolshifts();
}

addCommandToMap(SCNAME, 'sitecalendar', 'sitecoordinator_sitecalendar');
function sitecoordinator_sitecalendar() {
    $monthNames = array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

    $token = $_POST['vitasa-token'];
    $userid = $_POST['vitasa-userid'];
    $siteslug = $_POST['vitasa-siteslug'];

    $site = fetchSite($siteslug, $token);
    $sitename = $site->name;

    echo('
    <h2>Site Coordinator<br/>
    Manage Site Calendar<br/>
    '.$sitename.'</h2><br/>
    ');

    do_show_sc_navigation($userid, $token, $siteslug);

    echo('<br/>');

    // show a calendar
    $month = date('n');
    if (!empty($_POST['vitasa-month'])) {
        $month = $_POST['vitasa-month'];
    }

    $year = date('Y');
    if (!empty($_POST['vitasa-year'])) {
        $year = $_POST['vitasa-year'];
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

    $monthName = $monthNames[$month - 1];

    // build the image list
    $imagelist = array();
    $imagelist['grey'] = 'images/grey.png';
    $imagelist['orange'] = 'images/orange.png';
    $imagelist['orangeboxed'] = 'images/orangeboxed.png';
    $imagelist['green'] = 'images/green.png';
    $imagelist['greenboxed'] = 'images/greenboxed.png';

    // build the gridstate table
    $gridstate = buildSCCalendarGridStateSite($site, $month, $year);

    echo('    
    <div class="calendar-headerrow">
        <div class="calendar-cell">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-sitecoordinator" value="sitecalendar" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
		        <input type="hidden" name="vitasa-month" value="'.$monthm1.'" />
		        <input type="hidden" name="vitasa-year" value="'.$yearm1.'" />
		        <button type="submit" class="button-primary">Prev</button>
		    </form>
	    </div>
	    <div class="calendar-cell">
	    	'.$monthName.'-'.$year.'
		</div>
        <div class="calendar-cell">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-sitecoordinator" value="sitecalendar" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
		        <input type="hidden" name="vitasa-month" value="'.$monthp1.'" />
		        <input type="hidden" name="vitasa-year" value="'.$yearp1.'" />
		        <button type="submit" class="button-primary">Next</button>
		    </form>
	    </div>    	
	</div>
    <br/><br/><br/>
    ');

    buildSCCalendarGrid($gridstate, $imagelist, $token, $month, $year, $siteslug, $userid, 'sitecalendarshifts');

    echo('
		<br/>
        <form action="" method="post">
            <input type="hidden" name="vitasa-sitecoordinator" value="options" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
            <button type="submit" class="button-primary">Back</button>
        </form>
	');
}

addCommandToMap(SCNAME, 'sitecalendarshifts', 'sitecoordinator_sitecalendarshifts');
function sitecoordinator_sitecalendarshifts() {
    //$monthNames = array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

    $token = $_POST['vitasa-token'];
    $userid = $_POST['vitasa-userid'];
    $day = $_POST['vitasa-day'];
    $month = $_POST['vitasa-month'];
    $year = $_POST['vitasa-year'];
    $siteslug = $_POST['vitasa-siteslug'];
    
    $date = $year.'-'.$month.'-'.$day;

    $site = fetchSite($siteslug, $token);
    $sitename = $site->name;

    echo('
    <h2>Site Coordinator<br/>
    Manage Site Calendar<br/>
    Site Shifts<br/>
    '.$sitename.'<br/>
    '.$date.'<br/>
    </h2>
    ');

    do_show_sc_navigation($userid, $token, $siteslug);

    // get calendarentry for this date
    $calendarentry = getCalendarEntryForDate($site, $date);
    $calendarentryid = $calendarentry->id;
    // fetch all shifts for this calendarentry
    $shifts = fetchAllShiftsForCalendarEntry($siteslug, $calendarentry->id, $token);

    foreach ($shifts as $shift) {
        $open = $shift->start_time;
        $close = $shift->end_time;

        $calendarentry = getCalendarEntryForCalendarId($site, $calendarentryid);
        $date = $calendarentry->date;

        $numbasichave = countSignUpsAtCertLevel($shift, 'basic');
        $numadvhave = countSignUpsAtCertLevel($shift, 'advanced');

        $text = '['.timeFormat($open).' - '.timeFormat($close).']';
        $text2 = 'Basic: have : '.$numbasichave.' of '.$shift->efilers_needed_basic.' required, Advanced: have '.$numadvhave.' of '.$shift->efilers_needed_advanced.' required';

        $shiftid = $shift->id;
        		echo('
			<br/>
            <form action="" method="post">
                <input type="hidden" name="vitasa-sitecoordinator" value="sitecalendarshift" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-day" value="'.$day.'" />
                <input type="hidden" name="vitasa-month" value="'.$month.'" />
                <input type="hidden" name="vitasa-year" value="'.$year.'" />
                <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
                <input type="hidden" name="vitasa-calendarentryid" value="'.$calendarentryid.'" />
                <input type="hidden" name="vitasa-shiftid" value="'.$shiftid.'" />
                <button type="submit" class="button-sitename">'.$text.'</button>
                <br/>'.$text2.'
            </form>
        ');
    }
}

addCommandToMap(SCNAME, 'sitecalendarshift', 'sitecoordinator_sitecalendarshift');
function sitecoordinator_sitecalendarshift() {
    //$monthNames = array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

    $token = $_POST['vitasa-token'];
    $userid = $_POST['vitasa-userid'];
    $day = $_POST['vitasa-day'];
    $month = $_POST['vitasa-month'];
    $year = $_POST['vitasa-year'];
    $siteslug = $_POST['vitasa-siteslug'];
    $shiftid = $_POST['vitasa-shiftid'];
    $calendarentryid = $_POST['vitasa-calendarentryid'];

    $shift = fetchShift($siteslug, $calendarentryid, $shiftid, $token);

    $open = $shift->start_time;
    $close = $shift->end_time;
    $basicneeded = $shift->efilers_needed_basic;
    $advancedneeded = $shift->efilers_needed_advanced;

    $date = $year.'-'.$month.'-'.$day;

    $site = fetchSite($siteslug, $token);
    $sitename = $site->name;

    echo('
    <h2>Site Coordinator<br/>
    Manage Site Calendar<br/>
    Site Shift<br/>
    '.$sitename.'<br/>
    '.$date.'<br/>
    ['.timeFormat($open).' - '.timeFormat($close).']
    </h2>
    ');

    do_show_sc_navigation($userid, $token, $siteslug);

    echo('
	<form action="" method="post">
		Open:<input type="text" name="vitasa-open" style="width: 50px;" placeholder="Open" value="'.$open.'" /><br />
		Close:<input type="text" name="vitasa-close" style="width: 50px;" placeholder="Close" value="'.$close.'" /><br />
		Basic eFilers Needed:<input type="text" name="vitasa-efile-basic" style="width: 50px;" placeholder="Basic" value="'.$basicneeded.'" /><br />
		Advanced eFilers Needed:<input type="text" name="vitasa-efile-advanced" style="width: 50px;" placeholder="Advanced" value="'.$advancedneeded.'" /><br />
        <input type="hidden" name="vitasa-sitecoordinator" value="updateshift" />
        <input type="hidden" name="vitasa-token" value="'.$token.'" />
        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
        <input type="hidden" name="vitasa-day" value="'.$day.'" />
        <input type="hidden" name="vitasa-month" value="'.$month.'" />
        <input type="hidden" name="vitasa-year" value="'.$year.'" />
        <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
        <input type="hidden" name="vitasa-calendarentryid" value="'.$calendarentryid.'" />
        <input type="hidden" name="vitasa-shiftid" value="'.$shiftid.'" />
		<button type="submit" class="button-primary">Update</button>
	</form>
	<br/>
	Time format: hh:mm[:ss] [am|pm]
	<br/>
    ');
}

addCommandToMap(SCNAME, 'updateshift', 'sitecoordinator_updateshift');
function sitecoordinator_updateshift() {
    $token = $_POST['vitasa-token'];
    $userid = $_POST['vitasa-userid'];
    $day = $_POST['vitasa-day'];
    $month = $_POST['vitasa-month'];
    $year = $_POST['vitasa-year'];
    $siteslug = $_POST['vitasa-siteslug'];
    $calendarentryid = $_POST['vitasa-calendarentryid'];
    $shiftid = $_POST['vitasa-shiftid'];

    $open_s = $_POST['vitasa-open'];
    $close_s = $_POST['vitasa-close'];
    $basicneeded_s = $_POST['vitasa-efile-basic'];
    $advancedneeded_s = $_POST['vitasa-efile-advanced'];

    $shift = fetchShift($siteslug, $calendarentryid, $shiftid, $token);
    $shift->start_time = convertStringToTime($open_s, $shift->start_time);
    $shift->end_time = convertStringToTime($close_s, $shift->end_time);
    if (is_numeric($basicneeded_s))
        $shift->efilers_needed_basic = $basicneeded_s;
    if (is_numeric($advancedneeded_s))
        $shift->efilers_needed_advanced = $advancedneeded_s;

    $success = updateShift($shift, $siteslug, $calendarentryid, $shiftid, $token);

    if (!$success)
        echo('Unable to update the shift['.$shiftid.']<br/>');

    sitecoordinator_sitecalendarshifts();
}

// allowed formats: hh:mm[:ss] (24-hour), hh:mm [am/pm] (12-hour)
// result is hh:mm:ss (24-hour format) or default if bad format
function convertStringToTime($str, $default) {
    $exp = explode(':', $str);

    if (count($exp) == 1)
        return $default;

    $hh = intval($exp[0]);

    if (!is_numeric($hh))
        return $default;

    $mm = $exp[1]; // might be mm or mm am|pm

    if (strlen($mm) > 2) {
        // might be mm am|pm
        $exp1 = explode(' ', $mm);

        $mm = $exp1[0];
        if (!is_numeric($mm))
            return $default;

        $ampm = strtolower($exp1[1]);
        if (($ampm != 'am') && ($ampm != 'pm'))
            return $default;

        if ($ampm == 'pm') {
            if (($hh >= 1) && ($hh <= 11)) {
                $hh += 12;
            }
        }
    } else {
        if (!is_numeric($mm))
            return $default;
    }

    if (($hh < 0) || ($hh > 23))
        return $default;

    if (($mm < 0) || ($mm > 59))
        return $default;

    $hh_s = strval($hh);
    if (strlen($hh_s) == 1)
        $hh_s = '0'.$hh_s;

    $mm_s = strval($mm);
    if (strlen($mm_s) == 1)
        $mm_s = '0'.$mm_s;

    $res = $hh_s.':'.$mm_s.':00';

    return $res;
}

// returns a gridstate array[0..7*] with assoc for each entry:
// * text (to display in the grid cell)
// * canclick (bool on whether the text is clickable)
// * background (name from the imageList for background)
// * textcolor (name of color for text)
// * day is the number of the day of the month
function buildSCCalendarGridState($site, $siteschedule, $signups, $month, $year) {
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

	$d = date('d');
	$m = date('m');
	$y = date('Y');
	$now = $y.'-'.$m.'-'.$d;

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

		// if no calendar item then is before the season, show as grey
		// else if today is before now
		//      if no volunteers then show as grey
		//      else if none need approval then show green
		//      else show green with box
		// else
		//      if site is closed, show as grey
		//      else if open and at least one shift needs help, show as orange with box
		//      else show orange

		$date = $year.'-'.$month.'-'.$ix;

		$signupsfordate = getSignUpsForDate($signups, $date);
		$signupsfordate_count = count($signupsfordate);
		$signupsnotapproved_count = getSignUpsNotApproved($signupsfordate);

		$calendarEntry = getCalendarEntryForDate($site, $date);

		$siteisopentoday = !$calendarEntry->is_closed;

		if ($calendarEntry === false) {
			// must be before the season starts
			$griditem['text'] = $ix;
			$griditem['canclick'] = false;
			$griditem['textcolor'] = 'white';
			$griditem['background'] = 'grey';
			$griditem['day'] = $ix;
		}
		else if (dateCompare($date, $now) < 0) {
			if ($signupsfordate_count == 0) {
				$griditem['text'] = $ix;
				$griditem['canclick'] = false;
				$griditem['textcolor'] = 'white';
				$griditem['background'] = 'grey';
				$griditem['day'] = $ix;
			} else if ($signupsnotapproved_count == 0) {
				$griditem['text'] = $ix;
				$griditem['canclick'] = true;
				$griditem['textcolor'] = 'white';
				$griditem['background'] = 'green';
				$griditem['day'] = $ix;
			} else {
				$griditem['text'] = $ix;
				$griditem['canclick'] = true;
				$griditem['textcolor'] = 'white';
				$griditem['background'] = 'greenboxed';
				$griditem['day'] = $ix;
			}
		} else {
			if (!$siteisopentoday) {
				$griditem['text'] = $ix;
				$griditem['canclick'] = false;
				$griditem['textcolor'] = 'white';
				$griditem['background'] = 'grey';
				$griditem['day'] = $ix;
			} else {
				$siteschedulefortoday = getSiteScheduleOnDate($date, $siteschedule);
				$anyshiftunderstaffed = anyShiftUnderStaffed($siteschedulefortoday);

				if ( $anyshiftunderstaffed ) {
					$griditem['text']       = $ix;
					$griditem['canclick']   = true;
					$griditem['textcolor']  = 'white';
					$griditem['background'] = 'orangeboxed';
					$griditem['day']        = $ix;
				} else {
					$griditem['text']       = $ix;
					$griditem['canclick']   = true;
					$griditem['textcolor']  = 'white';
					$griditem['background'] = 'orange';
					$griditem['day']        = $ix;
				}
			}
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

// returns a gridstate array[0..7*] with assoc for each entry:
// * text (to display in the grid cell)
// * canclick (bool on whether the text is clickable)
// * background (name from the imageList for background)
// * textcolor (name of color for text)
// * day is the number of the day of the month
function buildSCCalendarGridStateSite($site, $month, $year) {
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

    $d = date('d');
    $m = date('m');
    $y = date('Y');
    $now = $y.'-'.$m.'-'.$d;

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

        // if no calendar item then is before the season, show as grey
        // else if site is open
        //    show grey
        // else
        //    show orange

        $date = $year.'-'.$month.'-'.$ix;

        $calendarEntry = getCalendarEntryForDate($site, $date);

        $siteisopentoday = !$calendarEntry->is_closed;

        if ($calendarEntry === false) {
            // must be before the season starts
            $griditem['text'] = $ix;
            $griditem['canclick'] = false;
            $griditem['textcolor'] = 'white';
            $griditem['background'] = 'grey';
            $griditem['day'] = $ix;
        } else if (!$siteisopentoday) {
            $griditem['text'] = $ix;
            $griditem['canclick'] = false;
            $griditem['textcolor'] = 'white';
            $griditem['background'] = 'grey';
            $griditem['day'] = $ix;
        } else {
            $griditem['text']       = $ix;
            $griditem['canclick']   = true;
            $griditem['textcolor']  = 'white';
            $griditem['background'] = 'orange';
            $griditem['day']        = $ix;
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



function buildSCCalendarGrid($gridstate, $imagelist, $token, $month, $year, $siteslug, $userid, $dest) {
	// build the grid; sitevolshifts

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
                <input type="hidden" name="vitasa-sitecoordinator" value="'.$dest.'" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
	            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <input type="hidden" name="vitasa-day" value="'.$day.'" />
                <input type="hidden" name="vitasa-month" value="'.$month.'" />
                <input type="hidden" name="vitasa-year" value="'.$year.'" />
                <input type="hidden" name="vitasa-siteslug" value="'.$siteslug.'" />
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