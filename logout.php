<?php
	session_start();
	$pagename="Logout"; //Create and populate a variable called $pagename
	echo "<link rel=stylesheet type=text/css href=mystylesheet.css>"; //Call in stylesheet
	echo "<title>".$pagename."</title>"; //display name of the page as window title
	echo "<body>";
	include ("headfile.html"); //include header layout file 
	include ("detectlogin.php");
	echo "<h4>".$pagename."</h4>"; //display name of the page on the web page
	//Display thank you message
	echo"<p><b>Thank you. ".$_SESSION['fname']," ".$_SESSION['sname']."</b></p>";
	//unset the session
	session_unset();
	//destroy the session
	session_destroy();
	//set loggedIn to false
	$_SESSION['loggedIn'] =  false;
	//Display a log out confirmation message
	echo"<p>You are now logged out.</p>";
	include("footfile.html"); //include head layout
	echo "
	</body>";
?>