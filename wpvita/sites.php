<?php

function do_show_sites($token)
{
	// get the list of sites from the backend
	$sites = getSites($token);

	if ($sites == null) {
		echo('Error getting site information.<br/>');

		return;
	}

	showMenuHoriz($token);

	// show a list, with links to view/edit, calendar, delete
	echo('
    <h2>VITA SA Back office Admin - Sites</h2>
    <table>
        <thead>
           <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Site Coordinator</th>
                <th>View/Edit</th>
                <th>Calendar</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
    ');

	foreach ($sites as $site) {
		$sname = $site->name;
		$sslug = $site->slug;
		$saddr = $site->street.'<br/>'.$site->city.', '.$site->state.' '.$site->zip;
		$sprimary = $site->sitecoordinator_name;

		echo('
            <tr>
                <td>'.$sname.'</td>
                <td>'.$saddr.'</td>
                <td>'.$sprimary.'</td>
            ');

		echo('
                <td>
                    <form action="" method="post">
                        <input type="hidden" name="vitasa_sites" value="1" />
                        <input type="hidden" name="vitasa_token" value="'.$token.'" />
                        <input type="hidden" name="vitasa_siteslug" value="'.$sslug.'" />
                        <button type="submit" name="details" class="button-primary">Edit</button>
                    </form>
                </td>
        ');

		echo('
                <td>
                    <form action="" method="post">
                        <input type="hidden" name="vitasa_sites" value="1" />
                        <input type="hidden" name="vitasa_token" value="'.$token.'" />
                        <input type="hidden" name="vitasa_siteslug" value="'.$sslug.'" />
                        <button type="submit" name="calendar" class="button-primary">Edit</button>
                    </form>
                </td>
        ');

		echo('
                <td>
                    <form action="" method="post">
                        <input type="hidden" name="vitasa_sites" value="1" />
                        <input type="hidden" name="vitasa_token" value="'.$token.'" />
                        <input type="hidden" name="vitasa_siteslug" value="'.$sslug.'" />
                        <button type="submit" name="delete" class="button-primary">Delete</button>
                    </form>
                </td>
             </tr>
            ');
	}

	echo('
        </tbody>
    </table>
');

	echo('
    <form action="" method="post" id="vitasa_sites">
        <input type="hidden" name="vitasa_sitedetails" value="1" />
        <input type="hidden" name="vitasa_token" value="'.$token.'" />
        <input type="hidden" name="vitasa_siteslug" value="*new*" />
        <button type="submit" name="details" class="button-primary">Create New Site</button>
    </form>
    ');
}

function do_show_sitedetails($token, $siteslug)
{
	// if siteslug == '*new*' then we are creating a site
	// check for site coord and backup id == 0 or -1 as invalid
	$site = getSite($siteslug, $token);

	$express = "";
	if (siteHasExpress($site))
		$express = "checked";
	$dropoff = "";
	if (siteHasDropOff($site))
		$dropoff = "checked";
	$mft = "";
	if (siteHasMFT($site))
		$mft = 'checked';

	$id = $site->id;

	showMenuHoriz($token);

	echo('
	<h2>VITA SA Back office Admin - Site Details</h2>
    <form action="" method="post" id="vitasa_sites_update">
        <table>
            <tr>
                <td>Site Name</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_name" style="width: 400px;" placeholder="Site Name" value="'.$site->name.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Street</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_street" style="width: 400px;" placeholder="Street" value="'.$site->street.'" /><br />
                </td>
            </tr>
            <tr>
                <td>City</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_city" style="width: 400px;" placeholder="City" value="'.$site->city.'" /><br />
                </td>
            </tr>
            <tr>
                <td>State</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_state" style="width: 400px;" placeholder="State" value="'.$site->state.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Zip</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_zip" style="width: 400px;" placeholder="Zip" value="'.$site->zip.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Latitude</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_latitude" style="width: 400px;" placeholder="Latitude" value="'.$site->latitude.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Longitude</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_longitude" style="width: 400px;" placeholder="Longitude" value="'.$site->longitude.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Place ID</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_placeid" style="width: 400px;" placeholder="Place ID" value="'.$site->google_place_id.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Site Coordinator</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_sitecoordinator" style="width: 400px;" placeholder="Site Coordinator" value="'.$site->sitecoordinator_name.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Backup Coordinator</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_backupcoordinator" style="width: 400px;" placeholder="Backup Coordinator" value="'.$site->backup_coordinator_name.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Season First Date</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_seasonfirst" style="width: 400px;" placeholder="Season First Date" value="'.$site->season_first_date.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Season Last Date</td>
                <td>
                    <input type="text" name="vitasa_sitedetails_seasonlast" style="width: 400px;" placeholder="Season Last Date" value="'.$site->season_last_date.'" /><br />
                </td>
            </tr>
            <tr>
                <td>Site Capabilities</td>
                <td>
                    <input type="checkbox" id="siteHasExpress" name="vitasa_sitedetails_express" value="express" '.$express.' />
                    <label for="siteHasExpress">Express</label>
                    <br />
                    <input type="checkbox" id="siteHasDropOff" name="vitasa_sitedetails_dropoff" value="dropoff" '.$dropoff.' />
                    <label for="siteHasDropOff">Drop-Off</label>
                    <br />
                    <input type="checkbox" id="siteHasMFT" name="vitasa_sitedetails_mft" value="mft" '.$mft.'/>
                    <label for="siteHasMFT">My Free Taxes</label>
                </td>
            </tr>
        </table>
        <input type="hidden" name="vitasa_sites" value="1" />
        <input type="hidden" name="vitasa_token" value="'.$token.'" />
        <input type="hidden" name="vitasa_siteslug" value="'.$siteslug.'" />
        <div>
            <button type="submit" name="submitSiteChanges" class="button-primary">Update Site</button>
            <button type="submit" name="cancelSiteChanges" class="button-primary">Cancel</button>
		</div>
    </form>
    ');
}

// returns true if successful
function updateSiteFromForm()
{
	$token = $_POST['vitasa_token'];

	// build an array with all the values we plan to change in the array
	$site = array();

	if (isset($_POST['vitasa_sitedetails_name'])) {
		$sname = $_POST['vitasa_sitedetails_name'];
		$site['name'] = $sname;
	}

	if (isset($_POST['vitasa_sitedetails_street'])) {
		$street = $_POST['vitasa_sitedetails_street'];
		$site['street'] = $street;
	}

	if (isset($_POST['vitasa_sitedetails_city'])) {
		$city = $_POST['vitasa_sitedetails_city'];
		$site['city'] = $city;
	}

	if (isset($_POST['vitasa_sitedetails_state'])) {
		$state = $_POST['vitasa_sitedetails_state'];
		$site['state'] = $state;
	}

	if (isset($_POST['vitasa_sitedetails_zip'])) {
		$zip = $_POST['vitasa_sitedetails_zip'];
		$site['zip'] = $zip;
	}

	if (isset($_POST['vitasa_sitedetails_latitude'])) {
		$latitude = $_POST['vitasa_sitedetails_latitude'];
		$site['latitude'] = $latitude;
	}

	if (isset($_POST['vitasa_sitedetails_longitude'])) {
		$longitude = $_POST['vitasa_sitedetails_longitude'];
		$site['longitude'] = $longitude;
	}

	if (isset($_POST['vitasa_sitedetails_placeid'])) {
		$placeid = $_POST['vitasa_sitedetails_placeid'];
		$site['google_place_id'] = $placeid;
	}

	// todo: site coordinator
	// todo: backup coordinator
	// the above need to be using a drop down list, not the name as a text field

//	if (isset($_POST['vitasa_sitedetails_seasonfirst'])) {
//		$seasonfirst = $_POST['vitasa_sitedetails_seasonfirst'];
//		$site['season_first_date'] = $seasonfirst;
//	}
//
//	if (isset($_POST['vitasa_sitedetails_seasonlast'])) {
//		$seasonlast = $_POST['vitasa_sitedetails_seasonlast'];
//		$site['season_last_date'] = $seasonlast;
//	}

	$capabilities = array();
	if (isset($_POST['vitasa_sitedetails_express']) && ($_POST['vitasa_sitedetails_express'] == 'express')) {
		array_push($capabilities, 'Express');
	}
	if (isset($_POST['vitasa_sitedetails_dropoff']) && ($_POST['vitasa_sitedetails_dropoff'] == 'dropoff')) {
		array_push($capabilities, 'DropOff');
	}
	if (isset($_POST['vitasa_sitedetails_mft']) && ($_POST['vitasa_sitedetails_mft'] == 'mft')) {
		array_push( $capabilities, 'MFT' );
	}
	$site['site_features'] = $capabilities;

	$res = false;
	if (isset($_POST['vitasa_siteslug'])) {
		$slug = $_POST['vitasa_siteslug'];
		$res = updateSite($token, $slug, $site);
	}

	if (!$res)
		echo('Failed to update the site<br/>');
	else
		echo('Site update was successful<br/>');

	return $res;
}

function do_show_sitecalendar($token, $siteslug)
{
	$site = getSite($siteslug, $token);
	
	$sundayOpen = $site->sunday_open;
	$mondayOpen = $site->monday_open;
	$tuesdayOpen = $site->tuesday_open;
	$wednesdayOpen = $site->wednesday_open;
	$thursdayOpen = $site->thursday_open;
	$fridayOpen = $site->friday_open;
	$saturdayOpen = $site->saturday_open;

	$sundayClose = $site->sunday_close;
	$mondayClose = $site->monday_close;
	$tuesdayClose = $site->tuesday_close;
	$wednesdayClose = $site->wednesday_close;
	$thursdayClose = $site->thursday_close;
	$fridayClose = $site->friday_close;
	$saturdayClose = $site->saturday_close;

	$isOpenSunday = ($sundayOpen != $sundayClose) ? 'checked' : '';
	$isOpenMonday = ($mondayOpen != $mondayClose) ? 'checked' : '';
	$isOpenTuesday = ($tuesdayOpen != $tuesdayClose) ? 'checked' : '';
	$isOpenWednesday = ($wednesdayOpen != $wednesdayClose) ? 'checked' : '';
	$isOpenThursday = ($thursdayOpen != $thursdayClose) ? 'checked' : '';
	$isOpenFriday = ($fridayOpen != $fridayClose) ? 'checked' : '';
	$isOpenSaturday = ($saturdayOpen != $saturdayClose) ? 'checked' : '';

	$sundayEFiler = $site->sunday_efilers;
	$mondayEFiler = $site->monday_efilers;
	$tuesdayEFiler = $site->tuesday_efilers;
	$wednesdayEFiler = $site->wednesday_efilers;
	$thursdayEFiler = $site->thursday_efilers;
	$fridayEFiler = $site->friday_efilers;
	$saturdayEFiler = $site->saturday_efilers;

	$siteid = $site->id;

	showMenuHoriz($token);

	echo('
	<h2>VITA SA Back office Admin - Site Calendar</h2>
    <table>
        <thead>
            <tr>
                <th>Day of Week</th>
                <th>Is Open?</th>
                <th>Open Time</th>
                <th>Close Time</th>
                <th>EFilers</th>
                <th>Save</th>
			</tr>
		</thead>
		<tbody>
		');

	//function getDow($token, $siteslug, $dowName, $isOpen, $openTime, $closeTime, $EFiler) {
	getDow($token, $siteslug, 'Sunday', $isOpenSunday, $sundayOpen, $sundayClose, $sundayEFiler);
	getDow($token, $siteslug, 'Monday', $isOpenMonday, $mondayOpen, $mondayClose, $mondayEFiler);
	getDow($token, $siteslug, 'Tuesday', $isOpenTuesday, $tuesdayOpen, $tuesdayClose, $tuesdayEFiler);
	getDow($token, $siteslug, 'Wednesday', $isOpenWednesday, $wednesdayOpen, $wednesdayClose, $wednesdayEFiler);
	getDow($token, $siteslug, 'Thursday', $isOpenThursday, $thursdayOpen, $thursdayClose, $thursdayEFiler);
	getDow($token, $siteslug, 'Friday', $isOpenFriday, $fridayOpen, $fridayClose, $fridayEFiler);
	getDow($token, $siteslug, 'Saturday', $isOpenSaturday, $saturdayOpen, $saturdayClose, $saturdayEFiler);

	echo('
			
		</tbody>
    </table>
    ');

	echo('<br/><br/>');

	echo('
        <table>
        	<thead>
        		<tr>
        			<th>Date</th>
        			<th>Is Open?</th>
        			<th>Open Time</th>
        			<th>Close Time</th>
        			<th>EFilers</th>
        			<th>Save</th>
        			<th>Remove</th>
				</tr>
			</thead>
			<tbody>
			');

	$overrides = $site->calendar_overrides;
	foreach ( $overrides as $override ) {
		$ovid = $override->id;
		$ovdate = $override->date;
		$ovIsOpen = $override->is_closed ? '' : 'checked';
		$ovopen = $override->open;
		$ovclose = $override->close;
		$ovefilers = $override->efilers_needed;

		echo('
			<tr>
				<form action="" method="post" id="vitasa_sites_update">
					<td>'.$ovdate.'</td>
					<td>
	                    <input type="checkbox" id="isopen'.$ovid.'" name="vitasa_sitecal_isopen" value="isopen" '.$ovIsOpen.' />
    	                <label for="isopen'.$ovid.'">Is Open</label>
					</td>
	                <td>
	                    <input type="text" name="vitasa_siteexcal_open" style="width: 100px;" placeholder="Open" value=" '.$ovopen.'" />
	                </td>
	                <td>
	                    <input type="text" name="vitasa_siteexcal_close" style="width: 100px;" placeholder="Close" value=" '.$ovclose.'" />
	                </td>
	                <td>
	                    <input type="text" name="vitasa_sitecal_efiler" style="width: 100px;" placeholder="EFilers" value=" '.$ovefilers.'" />
	                </td>
	                <td>
				        <input type="hidden" name="vitasa_sites" value="1" />
        				<input type="hidden" name="vitasa_date" value="'.$ovdate.'" />
        				<input type="hidden" name="vitasa_token" value="'.$token.'" />
        				<input type="hidden" name="vitasa_excalid" value="'.$ovid.'" />
				        <input type="hidden" name="vitasa_siteid" value="'.$siteid.'" />
				        <input type="hidden" name="vitasa_siteslug" value="'.$siteslug.'" />
			            <button type="submit" name="submitSiteCalChanges" class="button-primary">Save</button>
					</td>
				</form>
				<form action="" method="post" id="vitasa_sites_update">
	                <td>
				        <input type="hidden" name="vitasa_sites" value="1" />
        				<input type="hidden" name="vitasa_date" value="'.$ovdate.'" />
        				<input type="hidden" name="vitasa_token" value="'.$token.'" />
        				<input type="hidden" name="vitasa_excalid" value="'.$ovid.'" />
				        <input type="hidden" name="vitasa_siteid" value="'.$siteid.'" />
				        <input type="hidden" name="vitasa_excal_remove" value="1" />
				        <input type="hidden" name="vitasa_siteslug" value="'.$siteslug.'" />
			            <button type="submit" name="submitSiteCalChanges" class="button-primary">Remove</button>
					</td>
				</form>
			</tr>
		');
	}
	
	echo('
			</tbody>
        </table>
    ');
}

function getDow($token, $siteslug, $dowName, $isOpen, $openTime, $closeTime, $EFiler) {
	$lcdow = strtolower($dowName);
	echo('
		<form action="" method="post" id="vitasa_sites_update">
			<tr>
				<td>'.$dowName.'</td>
				<td>
                    <input type="checkbox" id="isOpen'.$dowName.'" name="vitasa_sitecal_isopen" value="isopen" '.$isOpen.' />
                    <label for="isOpen'.$dowName.'">Is Open</label>
				</td>
                <td>
                    <input type="text" name="vitasa_sitecal_open" style="width: 100px;" placeholder="'.$dowName.' Open" value="'.$openTime.'" /><br />
                </td>
                <td>
                    <input type="text" name="vitasa_sitecal_close" style="width: 100px;" placeholder="'.$dowName.' Close" value="'.$closeTime.'" /><br />
                </td>
                <td>
                    <input type="text" name="vitasa_sitecal_efiler" style="width: 100px;" placeholder="'.$dowName.' EFilers" value="'.$EFiler.'" /><br />
                </td>
                <td>
			        <input type="hidden" name="vitasa_sites" value="1" />
                    <input type="hidden" name="vitasa_token" value="'.$token.'" />
                    <input type="hidden" name="vitasa_caldow" value="'.$lcdow.'" />
			        <input type="hidden" name="vitasa_siteslug" value="'.$siteslug.'" />
		            <button type="submit" name="submitSiteCalChanges" class="button-primary">Save</button>
				</td>
			</tr>
		</form>
	');
}

function updateSiteCalFromForm() {
	$token = $_POST['vitasa_token'];
	$slug = $_POST['vitasa_siteslug'];
	$res = false;

	if (isset($_POST['vitasa_caldow'])) {
		$updateArray = getSiteCalDowUpdateArray();
		$res = updateSite($token, $slug, $updateArray);
	}
	elseif (isset($_POST['vitasa_excalid'])) {
		if (isset($_POST['vitasa_excal_remove'])) {
			echo('Delete calendar exception<br/>');
		} else {
			$updateArray = getSiteCalExcUpdateArray();
			$res = updateSiteCal($token, $slug, $updateArray);
		}
	}

	if (!$res)
		echo('Failed to update the site calendar<br/>');
	else
		echo('Site calendar update was successful<br/>');

	return $res;
}

function getSiteCalDowUpdateArray() {
	$site = array();

	if (isset($_POST['vitasa_caldow'])) {
		$dow = $_POST['vitasa_caldow'];
	}

	$isopen = false;
	if (isset($_POST['vitasa_sitecal_isopen'])) {
		$isopenx = $_POST['vitasa_sitecal_isopen'];
		$isopen = ($isopenx == 'isopen');
	}

	if (isset($_POST['vitasa_sitecal_open'])) {
		$open = $_POST['vitasa_sitecal_open'];
	}

	if (isset($_POST['vitasa_sitecal_close'])) {
		$close = $_POST['vitasa_sitecal_close'];
	}

	if (isset($_POST['vitasa_sitecal_efiler'])) {
		$efiler = $_POST['vitasa_sitecal_efiler'];
	} else {
		$efiler = '0';
	}

	if (isset($dow) && isset($isopen) && isset($open) && isset($close) && isset($efiler)) {
		if (!$isopen)
			$close = $open;

		$key = $dow.'_open';
		$site[$key] = $open;
		$key = $dow.'_close';
		$site[$key] = $close;
		$key = $dow.'_efilers';
		$site[$key] = $efiler;
	}

	return $site;
}

function getSiteCalExcUpdateArray() {
	$site = array();

	if (isset($_POST['vitasa_excalid'])) {
		$id = $_POST['vitasa_excalid'];
	}

	if (isset($_POST['vitasa_siteid'])) {
		$siteid = $_POST['vitasa_siteid'];
	}

	if (isset($_POST['vitasa_date'])) {
		$date = $_POST['vitasa_date'];
	}

	if (isset($_POST['vitasa_siteexcal_open'])) {
		$open = $_POST['vitasa_siteexcal_open'];
	}

	if (isset($_POST['vitasa_siteexcal_close'])) {
		$close = $_POST['vitasa_siteexcal_close'];
	}

	$isopen = false;
	if (isset($_POST['vitasa_sitecal_isopen'])) {
		$isopenx = $_POST['vitasa_sitecal_isopen'];
		$isopen = ($isopenx == 'isopen');
	}

	$efiler = '0';
	if (isset($_POST['vitasa_sitecal_efiler'])) {
		$efiler = $_POST['vitasa_sitecal_efiler'];
	}

	if (isset($id) && isset($siteid) && isset($date) && isset($open) && isset($close) && isset($isopen) && isset($efiler)) {
		// need: calid, siteid, date, opentime, closetime, isclosed (bool), efilers
		$site['id'] = $id;
		$site['siteid'] = $siteid;
		$site['date'] = $date;

		$site['open'] = $open;
		$site['close'] = $close;

		$site['is_closed'] = $isopen ? 'false' : 'true';
		$site['efilers_needed'] = $efiler;
	}

	return $site;
}

function do_show_sitedelete($token, $siteslug)
{
	showMenuHoriz($token);

	echo('
    <br/>Delete<br/>
    Slug = '.$siteslug.'<br/>
    ');
}

function siteHasExpress($site)
{
	$res = false;

	$features = $site->site_features;
	foreach ($features as $feature) {
		if (strtolower($feature) == 'express') {
			$res = true;
			break;
		}
	}

	return $res;
}

function siteHasDropOff($site)
{
	$res = false;

	$features = $site->site_features;
	foreach ($features as $feature) {
		if (strtolower($feature) == 'dropoff') {
			$res = true;
			break;
		}
	}

	return $res;
}

function siteHasMFT($site)
{
	$res = false;

	$features = $site->site_features;
	foreach ($features as $feature) {
		if (strtolower($feature) == 'mft') {
			$res = true;
			break;
		}
	}

	return $res;
}

?>