<?php

include "helpers.php";

function do_show_signups($user, $token) {
	$signups = $user->work_intents;
    $userid = $user->id;

    $sites = array(); // associative, site slug -> site

	echo('
    <h2>Volunteer - Signups</h2>
    <div class="signup-row">
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-suggestions" value="list" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <button type="submit" class="button-primary">Suggestions</button>
		    </form>
	    </div>
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-profile" value="show" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <button type="submit" class="button-primary">Profile</button>
		    </form>
	    </div>
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-login" value="show" />
		        <button type="submit" class="button-primary">Logout</button>
		    </form>
	    </div>
	</div>
    <div class="signup-row">
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-signups" value="new" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <button type="submit" class="button-primary">New Sign Up</button>
		    </form>
	    </div>
    </div>
    <br/>
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
            $site = getSite($siteslug, $token);
            $sites[$siteslug] = $site;
        }

        $calendarEntry = getCalendarEntryForDate($site, $date);
        $calendarEntryId = $calendarEntry->id;

        $shift = getShift($siteslug, $calendarEntryId, $shiftId);

        $times = $shift->start_time.' - '.$shift->end_time;

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
            <span class="signuptext">'.$date.'</span><br/>
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

function do_show_signupdetails($userid, $signupid, $token) {
    $user = getUser($userid, $token);

    $signup = getSignUpFromSignUpId($user, $signupid);
    $siteslug = $signup->site;
    $site = getSite($siteslug, $token);

    $date = $signup->date;
    $calendarEntry = getCalendarEntryForDate($site, $date);

    $calendarEntryId = $calendarEntry->id;
    $shiftId = $signup->shift_id;
    $shift = getShift($siteslug, $calendarEntryId, $shiftId);

    $siteName = $site->name;
    $siteaddress = $site->street.', '.$site->city.', '.$site->state.' '.$site->zip;
    $datetimes = $date.' ['.$shift->start_time.' - '.$shift->end_time.']';

    $hours = $signup->hours;

    echo('
        <h2>VITA SA Online - SignUp Details</h2>
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
?>