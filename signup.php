<?php
	$pagename="Sign Up"; //Create and populate a variable called $pagename
	echo "<link rel=stylesheet type=text/css href=mystylesheet.css>"; //Call in stylesheet
	echo "<title>".$pagename."</title>"; //display name of the page as window title
	echo "<body>";
		include ("headfile.html"); //include header layout file 
		
		echo "<h4>".$pagename."</h4>"; //display name of the page on the web page
		
		//form deirect the user to the a signup_process.php file
		
		
		echo"<form action = signup_process.php method = post id = 'signupform'>";
			echo"<table  style='border: 0px' >";
				echo"<tr>";
					echo"<td style='border: 0px'>First Name: </td>";
					echo"<td style='border: 0px'><input type = 'text' name = 'fname' size=35></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'>Last Name: </td>";
					echo"<td style='border: 0px'><input type = 'text' name = 'lname' size=35></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'>Address: </td>";
					echo"<td style='border: 0px'><input type = 'text' name = 'address' size=35></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'>Postcode: </td>";
					echo"<td style='border: 0px'><input type = 'text' name = 'postcode' size=35></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'>Tel No: </td>";
					echo"<td style='border: 0px'><input type = 'text' name = 'telno' size=35></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'>E-mail: </td>";
					echo"<td style='border: 0px'><input type = text name = 'email' size=35></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'>Password: </td>";
					echo"<td style='border: 0px'><input type = text name = 'password' size=35 maxlength=10 ></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'>Confirm Password: </td>";
					echo"<td style='border: 0px'><input type = text name = 'cpassword' size=35 maxlength=10 ></td>";
				echo"</tr>";
				
				echo"<tr>";
					echo"<td style='border: 0px'><input type = submit name='submitbtn' value='Sign Up' id='submitbtn'></td>";
					echo"<td style='border: 0px'><input type = reset name='submitbtn' value='Clear Form' id='submitbtn'></td>";
				echo"</tr>";
			
			echo"</table>";	
		echo"</form>";
		
		include("footfile.html"); //include head layout
		echo "
	</body>";
?>