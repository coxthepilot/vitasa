<?php

function do_show_menu($Token)
{
	echo('
	<div>
		<h2>VITA SA Back office Admin - Menu</h2>
	    <div class="columns-2">
	    
		    <div style="position: relative;">
		        <form action="" method="post" id="vitasa_sites">
		            <input type="hidden" name="vitasa_sites" value="1" />
		            <input type="hidden" name="vitasa_token" value="'.$Token.'" />
                    <button type="submit" class="button-primary">View Sites</button>
                </form>
            </div>
            
            <br/><br/>
            
		    <div style="position: relative;">
		        <form action="" method="post" id="vitasa_users">
		            <input type="hidden" name="vitasa_users" value="1" />
		            <input type="hidden" name="vitasa_token" value="'.$Token.'" />
                    <button type="submit" class="button-primary">View Users</button>
                </form>
            </div>
            
            <br/><br/>
            
		    <div style="position: relative;">
		        <form action="" method="post" id="vitasa_notification">
		            <input type="hidden" name="vitasa_notification" value="1" />
		            <input type="hidden" name="vitasa_token" value="'.$Token.'" />
                    <button type="submit" class="button-primary">Notification</button>
                </form>
            </div>
        </div>
    </div>
    ');
}

function showMenuHoriz($Token)
{
	echo('
	<table>
		<tr>
			<td>
		        <form action="" method="post" id="vitasa_sites">
		            <input type="hidden" name="vitasa_sites" value="1" />
		            <input type="hidden" name="vitasa_token" value="'.$Token.'" />
	                <button type="submit" class="button-primary">View Sites</button>
	            </form>
        	</td>
        	<td>
		        <form action="" method="post" id="vitasa_users">
		            <input type="hidden" name="vitasa_users" value="1" />
		            <input type="hidden" name="vitasa_token" value="'.$Token.'" />
		            <button type="submit" class="button-primary">View Users</button>
		        </form>
        	</td>
        	<td>
		        <form action="" method="post" id="vitasa_notification">
		            <input type="hidden" name="vitasa_notification" value="1" />
		            <input type="hidden" name="vitasa_token" value="'.$Token.'" />
	                <button type="submit" class="button-primary">Notification</button>
	            </form>
            </td>
        </tr>
    </table>
    ');
}
?>