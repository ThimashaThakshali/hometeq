<?php
	session_start();

	$pagename="Login"; //Create and populate a variable called $pagename
	echo "<link rel=stylesheet type=text/css href=mystylesheet.css>"; //Call in stylesheet
	echo "<title>".$pagename."</title>"; //display name of the page as window title
	echo "<body>";
	
		include ("headfile.html"); //include header layout file 
		echo "<h4>".$pagename."</h4>"; //display name of the page on the web page
		
		echo"<form action = login_process.php method = post >";
			echo"<table  style='border: 0px' id = 'userdetails'>";
		echo"<tr>";
					echo"<td style='border: 0px'>E-mail: </td>";
					echo"<td style='border: 0px'><input type = text name = 'l_email' size=35></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'>Password: </td>";
					echo"<td style='border: 0px'><input type = text name = 'l_password' size=35 maxlength=10 ></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'><input type = reset name='submitbtn' value='Clear Form' id='submitbtn'></td>";
					echo"<td style='border: 0px'><input type = submit name='submitbtn' value='Log In' id='submitbtn'></td>";
				echo"</tr>";
				
			echo"</table>";	
		echo"</form>";		
		include("footfile.html"); //include head layout
	echo "
	</body>";
?>