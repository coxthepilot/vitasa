<?php
include_once "helpers.php";

function do_show_suggestions($userid, $token) {
	$user = getUser($userid, $token);

	$suggestions = $user->suggestions;

	echo('
    <h2>Volunteer - Suggestions</h2>
    <div class="signup-row">
    	<div class="signup-child">
		    <form action="" method="post">
		        <input type="hidden" name="vitasa-signups" value="list" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <button type="submit" class="button-primary">Sign Ups</button>
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
		        <input type="hidden" name="vitasa-suggestions" value="new" />
		        <input type="hidden" name="vitasa-token" value="'.$token.'" />
		        <input type="hidden" name="vitasa-userid" value="'.$userid.'" />
		        <button type="submit" class="button-primary">New Suggestion</button>
		    </form>
	    </div>
    </div>
    <br/>
    ');

	foreach ( $suggestions as $suggestion ) {
		$title = $suggestion->subject;
		$date = $suggestion->created_at;
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
            <span class="signuptext">'.$date.'</span><br/>
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

function do_show_suggestiondetails($userid, $suggestionid, $token) {
	$user = getUser($userid, $token);

	$suggestion = getSuggestionFromSuggestionID($user, $suggestionid);

	$date = $suggestion->created_at;
	$state = $suggestion->status;
	$title = $suggestion->subject;
	$text = $suggestion->details;
	$textenc = htmlentities($text);

	echo('
        <h2>VITA SA Online - SignUp Details</h2>
        Created: '.$date.'<br/>
        State: '.$state.'<br/>
        Title: 
        <input type="text" form="suggestionform" name="vitasa-suggestion-title" value="'.$title.'" />
        <br/>
        Body: 
        <textarea form="suggestionform" rows="5" id="suggestiontextarea" name="vitasa-suggestion-body">'.$text.'</textarea>
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

	echo('
	    <script>
	        body = "'.$textenc.'";
	        window.onload = function(e) 
	        { 
	            $(\'#suggestiontextarea\').val(body); 
	        }
	    </script>
	');
}
?>