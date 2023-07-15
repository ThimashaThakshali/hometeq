<?php
	session_start();
	include("db.php");
	$pagename="Login Results"; //Create and populate a variable called $pagename
	echo "<link rel=stylesheet type=text/css href=mystylesheet.css>"; //Call in stylesheet
	echo "<title>".$pagename."</title>"; //display name of the page as window title
	echo "<body>";
	include ("headfile.html"); //include header layout file 
	echo "<h4>".$pagename."</h4>"; //display name of the page on the web page
	
	//Capture the 2 inputs entered in the form (email and password) using the $_POST superglobal variable
	//Assign these values to 2 new local variables $email and $password
	//Display the content of these 2 variables to ensure that the values have been posted pro
	$email =  $_POST['l_email'];
	$password =  $_POST['l_password'];
	//if either mandatory email or password fields in the form are empty (hint: use the empty function)
	if(empty($email) or empty($password)){
	//Display error "Both email and password fields need to be filled in" message and link to login page
	
		echo"<p><b>Login Failed!</b><br/>";
		echo"Login form incomplete<br/>";
		echo "<br>Make sure you provide all the required details</p><br/>";
		echo"Go back to <a href = login.php>Login</a></p>";
	}
	//else
	else{
		
		//SQL query to retrieve the record from the users table for which the email matches login email (in form)
		$SQL = "SELECT * FROM users WHERE userEmail = '".$email."'";
		
		//execute the SQL query & fetch results of the execution of the SQL query and store them in $arrayu 
		$exeSQL = mysqli_query($conn, $SQL) or die(mysqli_error($conn));
		
		//also capture the number of records retrieved by the SQL query using function mysqli_num_rows and store it 
		//in a variable called $nbrecs
		$nrebs = mysqli_num_rows($exeSQL);
		
		//if the number of records is 0 (i.e. email retrieved from the DB does not match $email login email in form
		if($nrebs == 0){
			//display error message "Email not recognised, login again"
			echo"<p><b>Login Failed!</b><br/>";
			echo"Email not recognised</p><br/>";
			echo"Go back to <a href = login.php>Login</a></p>";
		}
		//else
		else{	
	
			$arrayu=mysqli_fetch_array($exeSQL);
			
			//if password retrieved from the database (in arrayu) does not match $password
			if ($arrayu['userPassword'] <> $password){
				
				//display error message "Password not recognised, login again"
				echo"<p><b>Login Failed!</b><br/>";
				echo"Password not valid</p><br>";
				echo"Go back to <a href = login.php>Login</a></p>";
			}
			//else
			else{
				//display login success message and store user id, user type, name into 4 session variables i.e.
				if($arrayu['userType'] == 'A'){
					echo"<p><b>Login success!</b><br>";
					//set loggedIn to true
					$_SESSION['loggedIn'] =  true;
					//create $_SESSION['userid'], $_SESSION['usertype'], $_SESSION['fname'], $_SESSION['sname'],
					$_SESSION['userid'] = $arrayu['userId'];
					$_SESSION['usertype'] = $arrayu['userType'];
					$_SESSION['fname'] = $arrayu['userFName'];
					$_SESSION['sname'] = $arrayu['userSName'];
					//Greet the user by displaying their name using $_SESSION['fname'] and $_SESSION['sname']
					echo"Welcome ".$_SESSION['fname']." ".$_SESSION['sname']."<br/>";
					//Welcome them as a customer by using $_SESSION['usertype ']
					
					echo"User type : hometeq Adminstrator</p><br/>";
					
				}
				else{
					echo"<p>You are not an adminstator!<br/>";
					echo"Go to <a href = login.php >Login</a></p>";
				}
					
							
			}
		}
	}

	//echo "Email entered: ".$email."";
	//echo "Password entered: ".$password."";
	
	include("footfile.html"); //include head layout
	echo "
	</body>";
?>