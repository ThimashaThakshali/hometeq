<?php
	//if the session user id $_SESSION['userid'] is set (i.e. if the user has logged in successfully)
	if(isset($_SESSION['userid'])){
		
	//display first name and surname on the right hand-side, right under the navigation bar
	if($_SESSION['usertype'] =='A'){
		$type = 'Administrator';
	}
	else{
		$type = 'Customer';
	}
	echo"<p style='float: right'><img src = images/acc.png height=20 width=26><b> ".$_SESSION['fname']," ".$_SESSION['sname']." |  ".$type."</b></p>";
	}
?>