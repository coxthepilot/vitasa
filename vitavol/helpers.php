<?php
function getCalendarEntryForDate($site, $date) {
	$ce = null;

	$calEntries = $site->calendar_overrides;
	foreach ($calEntries as $calEntry) {
		if ($calEntry->date == $date) {
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

?>