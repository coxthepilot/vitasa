<?php
include_once "vitaapi.php";

$form = array(

	'subject' => 'Tell Us How We Did Form Submission',
	'heading' => 'New Form Submission',
	'success_redirect' => '',
	'resources' => array(
		'checkbox_checked' => 'Checked',
		'checkbox_unchecked' => 'Unchecked',
		'submitted_from' => 'Form submitted from website: %s',
		'submitted_by' => 'Visitor IP address: %s',
		'too_many_submissions' => 'Too many recent submissions from this IP',
		'failed_to_send_email' => 'Failed to send email',
		'invalid_reCAPTCHA_private_key' => 'Invalid reCAPTCHA private key.',
		'invalid_reCAPTCHA2_private_key' => 'Invalid reCAPTCHA 2.0 private key.',
		'invalid_reCAPTCHA2_server_response' => 'Invalid reCAPTCHA 2.0 server response.',
		'invalid_field_type' => 'Unknown field type \'%s\'.',
		'invalid_form_config' => 'Field \'%s\' has an invalid configuration.',
		'unknown_method' => 'Unknown server request method'
	),

	'email' => array(
		'from' => 'billy.cox@zsquared.net',
		'to' => 'billy.cox@zsquared.net'
	),

	'fields' => array(
		'custom_U6982' => array(
			'order' => 2,
			'type' => 'string',
			'label' => 'What worked well?',
			'required' => false,
			'errors' => array(
			)
		),
		'custom_U6998' => array(
			'order' => 3,
			'type' => 'string',
			'label' => 'How can we improve?',
			'required' => false,
			'errors' => array(
			)
		),
		'custom_U7002' => array(
			'order' => 1,
			'type' => 'string',
			'label' => 'Site visited',
			'required' => true,
			'errors' => array(
				'required' => 'Field \'Site visited\' is required.'
			)
		),
		'custom_U6987' => array(
			'order' => 4,
			'type' => 'string',
			'label' => 'May we contact you for more information? If so, please provide email or phone',
			'required' => true,
			'errors' => array(
				'required' => 'Field \'May we contact you for more information? If so, please provide email or phone\' is required.'
			)
		)
	)
);

process_form($form);

function process_form($form) {
	//echo "--- process form ---<br/>";
	if ($_SERVER['REQUEST_METHOD'] != 'POST') {
		die( get_form_error_response( $form['resources']['unknown_method'] ) );
	}

	// todo: figure out a way to refuse too many submission from the same ip address (aka spam)
//	if (formthrottle_too_many_submissions($_SERVER['REMOTE_ADDR'])) {
//		echo ">>> error too many submissions<br/>";
//		die( get_form_error_response( $form['resources']['too_many_submissions'] ) );
//	}

	postUserFeedback($form);
}

function postUserFeedback($form) {
	$workedWell = $_POST['custom_U6982'];
	$toImprove = $_POST['custom_U6998'];
	$siteVisited = $_POST['custom_U7002'];
	$contact = $_POST['custom_U6987'];

	// we MUST have either worked well or to improve
	if ((strlen($workedWell) == 0) || (strlen($toImprove) == 0))
		return;

	$msg1 = "Worked well: \\n".$workedWell."\\n\\n";
	$msg1 .= "Needs improvement: \\n".$toImprove."\\n\\n";
	$msg1 .= "Site visited: \\n".$siteVisited."\\n\\n";
	$msg1 .= "Contact: \\n".$contact."\\n\\n";

	createSuggestion('from vitasa.org', $msg1, false, 'true');

	$success_data = array(
		'redirect' => $form['success_redirect']
	);

	echo get_form_response(true, $success_data);
}

function get_form_error_response($error) {
	return get_form_response(false, array('error' => $error));
}

function get_form_response($success, $data) {
	if (!is_array($data))
		die('data must be array');

	$status = array();

	$successString = $success ? 'true' : 'false';

	$status[$success ? 'FormResponse' : 'MusePHPFormResponse'] = array_merge(array('success' => $successString), $data);

	return json_encode($status);
	//return json_serialize($status);
}

function json_serialize($data) {
	if ( is_assoc_array( $data ) ) {
		$json = array();

		foreach ( $data as $key => $value ) {
			array_push( $json, '"' . $key . '": ' . json_serialize( $value ) );
		}

		return '{' . implode( ', ', $json ) . '}';
	}
}

function is_assoc_array($arr) {
	if (!is_array($arr))
		return false;

	$keys = array_keys($arr);
	foreach (array_keys($arr) as $key)
		if (is_string($key)) return true;

	return false;
}

?>

