<?php
include_once "helpers.php";

$suggMap = array();

$suggMap['list'] = 'suggestions_list';
$suggMap['details'] = 'suggestions_details';
$suggMap['update'] = 'suggestions_update';
$suggMap['remove'] = 'suggestions_remove';
$suggMap['new'] = 'suggestions_new';
$suggMap['save'] = 'suggestions_save';

registerMap('vitasa-suggestions', $suggMap);

function suggestions_list () {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];

	do_show_suggestions($userid, $token);
}

function do_show_suggestions($userid, $token) {
	$user = getUser($userid, $token);

	$suggestions = $user->suggestions;

	echo('
    <h2>Volunteer Suggestions</h2>
    ');

	do_show_vol_navigation($token, $userid);

	foreach ( $suggestions as $suggestion ) {
		$title = $suggestion->subject;
		$date = $suggestion->created_at;
		$date_s = timeFormatZ($date);
		$suggestionid = $suggestion->id;

		echo('
			<br/>
            <form action="" method="post">
                <input type="hidden" name="vitasa-suggestions" value="details" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-suggestion-id" value="'.$suggestionid.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <button type="submit" class="button-sitename">'.$title.'</button>
            </form>
            <span class="signuptext">'.$date_s.'</span><br/>
            ');

		echo('
            <form action="" method="post">
                <input type="hidden" name="vitasa-suggestions" value="remove" />
                <input type="hidden" name="vitasa-token" value="'.$token.'" />
                <input type="hidden" name="vitasa-suggestion-id" value="'.$suggestionid.'" />
                <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
                <button type="submit" class="button-primary">Remove</button>
            </form>
        ');
	}
}

function suggestions_details() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$suggestionid = $_POST['vitasa-suggestion-id'];
	$user = getUser($userid, $token);

	$suggestion = getSuggestionFromSuggestionID($user, $suggestionid);

	$date = $suggestion->created_at;
	$state = $suggestion->status;
	$title = $suggestion->subject;
	$text = $suggestion->details;

	echo('
        <h2>VITA SA Online - SignUp Details</h2>
        Created: '.timeFormatZ($date).'<br/>
        State: '.$state.'<br/><br/>
        Title: 
        <input type="text" form="suggestionform" name="vitasa-suggestion-title" value="'.$title.'" />
        <br/><br/>
        Body: <br/>
        <textarea form="suggestionform" rows="5" cols="50" class="suggestiontextarea" id="suggestiontextarea" name="vitasa-suggestion-body">'.$text.'</textarea>
        <br/>
        <form action="" method="post" id="suggestionform">
            <input type="hidden" name="vitasa-suggestions" value="update" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <input type="hidden" name="vitasa-suggestion-id" value="'.$suggestionid.'" />
            <button type="submit" class="button-primary">Update</button>
        </form>
		<br/>
        <form action="" method="post">
            <input type="hidden" name="vitasa-suggestions" value="list" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <input type="hidden" name="vitasa-suggestion-id" value="'.$suggestionid.'" />
            <button type="submit" class="button-primary">Back</button>
        </form>
    ');
}

function suggestions_update() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$suggestionid = $_POST['vitasa-suggestion-id'];
	$title = $_POST['vitasa-suggestion-title'];
	$body = $_POST['vitasa-suggestion-body'];

	$success = updateSuggestion($suggestionid, $title, $body, $token);

	if (!$success) {
		echo('Unable to update the suggestion.<br/>');
	}

	do_show_suggestions($userid, $token);
}

function suggestions_remove() {
	$Token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$suggestionid = $_POST['vitasa-suggestion-id'];

	$success = removeSuggestion($suggestionid, $Token);

	if (!$success) {
		echo('Unable to remove suggestion.<br/>');
	}

	do_show_suggestions($userid, $Token);
}

function suggestions_new() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$date = 'today';
	$state = 'New';
	$title = '';
	$text = '';

	echo('
        <h2>VITA SA Online - SignUp Details</h2>
        Created: '.$date.'<br/>
        State: '.$state.'<br/><br/>
        Title: 
        <input type="text" form="suggestionform" name="vitasa-suggestion-title" value="'.$title.'" />
        <br/><br/>
        Body: <br/>
        <textarea form="suggestionform" rows="5" cols="50" class="suggestiontextarea" id="suggestiontextarea" name="vitasa-suggestion-body">'.$text.'</textarea>
        <br/>
        <form action="" method="post" id="suggestionform">
            <input type="hidden" name="vitasa-suggestions" value="save" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <button type="submit" class="button-primary">Save</button>
        </form>
		<br/>
        <form action="" method="post">
            <input type="hidden" name="vitasa-suggestions" value="list" />
            <input type="hidden" name="vitasa-token" value="'.$token.'" />
            <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
            <button type="submit" class="button-primary">Cancel</button>
        </form>
    ');
}

function suggestions_save() {
	$token = $_POST['vitasa-token'];
	$userid = $_POST['vitasa-userid'];
	$title = $_POST['vitasa-suggestion-title'];
	$body = $_POST['vitasa-suggestion-body'];

	$success = createSuggestion($title, $body, $token);

	if (!$success) {
		echo('Unable to create the suggestion.<br/>');
	}

	do_show_suggestions($userid, $token);
}

?>