<?php

	//start session
    session_start();
	include("db.php");
	$pagename="Smart Basket"; //Create and populate a variable called $pagename
	echo "<link rel=stylesheet type=text/css href=mystylesheet.css>"; //Call in stylesheet
	echo "<title>".$pagename."</title>"; //display name of the page as window title
	echo "<body>";
	
		include ("headfile.html"); //include header layout file 
		include ("detectlogin.php");

		echo "<h4>".$pagename."</h4>"; //display name of the page on the web page
		
		//if the value of the product id to be deleted (which was posted through the hidden field) is set
		if(isset($_POST['hd_prodid']))
		{
			//capture the posted product id and assign it to a local variable $delprodid
			$delprodid = $_POST['hd_prodid'];
			
			//unset the cell of the session for this posted product id variable
			unset ($_SESSION['basket'][$delprodid]);
			
			//display a "1 item removed from the basket" message
			echo "<p>1 item removed from the basket</p>";
			
			
		}
		//if the posted ID of the new product is set i.e. if the user is adding a new product into the basket
		if(isset($_POST['h_prodid']))
		{	
			//capture the ID of selected product using the POST method and the $_POST superglobal variable
			//and store it in a new local variable called $newprodid
			$newprodid = $_POST['h_prodid'];
			
			//capture the required quantity of selected product using the POST method and $_POST superglobal variable 
			//and store it in a new local variable called $reququantity
			$reququantity = $_POST['p_quantity'];
			
			//create a $SQL variable and populate it with a SQL statement that retrieves product details
			//all the records will come
			$SQL="select prodName,prodPrice,prodQuantity from Product where prodId =$newprodid";
			
			//run SQL query for connected DB or exit and display error message
			$exeSQL=mysqli_query($conn, $SQL) or die (mysqli_error($conn));
			
			
			//Display id of selected product
			//echo "<p>Selected product Id: ".$newprodid;
			
			//Display quantity of selected product
			//echo "<p>Quantity of Selected product: ".$reququantity;
			
			
			
			//create a new cell in the basket session array. Index this cell with the new product id.
			//Inside the cell store the required product quantity 
			$_SESSION['basket'][$newprodid] = $reququantity;
			
			//echo "<b><p>1 item added </p></b>";
		}
		
		/* else
		{
			//Display "Basket unchanged " message
			echo"<b><p> Basket unchanged </p></b>";
		} */
		
		//Create a variable $total and initialize it to zero
		$total = 0;
		
		
		//Create a HTML table with a header to display the content of the shopping basket 
		//i.e. the product name, the price, the selected quantity and the subtotal
		echo"<p><table id='baskettable'>";
		
		  echo"<tr>";
		  
			echo"<th>Product name</th>";
			echo"<th>Price</th>";
			echo"<th>Quantity</th>";
			echo"<th>Subtotal</th>";
			echo"<th>Remove Product</th>";
			
		  echo"</tr>";
		  
		
		
			//if the session array $_SESSION['basket'] is set
			if(isset($_SESSION['basket']))
			{
				//loop through the basket session array for each data item inside the session using a foreach loop 
				//to split the session array between the index and the content of the cell
				//for each iteration of the loop
				//store the id in a local variable $index & store the required quantity into a local variable $value
				foreach($_SESSION['basket'] as $index => $value)
				{
					
					//SQL query to retrieve from Product table details of selected product for which id matches $index
					//execute query and create array of records $arrayp
					$SQL="select prodName,prodPrice,prodId from Product where prodId =$index";
					
					//run SQL query for connected DB or exit and display error message
					$exeSQL=mysqli_query($conn, $SQL) or die (mysqli_error($conn));
					
					$arrayp = mysqli_fetch_array($exeSQL);
					

					//create a new HTML table row
					echo"<tr>";
			  
						$prodid = $arrayp['prodId'];
						
			 
						//display product name using array of records $arrayp 
						echo "<td>".$arrayp['prodName']."</td>"; 
						
						//display product price using the array of records $arrayp
						echo "<td>&pound".number_format($arrayp['prodPrice'],2)."</td>";
						
						//display selected quantity of product retrieved from the cell of session array and now in $value
						echo "<td  style='text-align:center;'>".$value."</td>";
					
						//calculate subtotal, store it in a local variable $subtotal and display it
						$subtotal = $value * $arrayp['prodPrice'];
						echo "<td>&pound".number_format($subtotal,2)."</td>";
						
						//increase total by adding the subtotal to the current total
						$total = $total + $subtotal;
						
						//remove button
						echo "<td>";
							echo "<form action = basket.php method=post>";
						    echo "<input type = submit name='removebtn' value='Remove' id='submitbtn'>";
							//pass the product id to the basket.php as a hidden value
							echo "<input type= hidden name= 'hd_prodid' value=".$prodid.">";
							echo "</form>";
						echo "</td>";
						
						
				    echo"</tr>";
				
				}
				
			}

			//else
			else
			{
			//Display empty basket message
			echo"<b><p> Empty Basket </p></b><br/>";
			}
			// Display total
				echo"<tr>";
				
					echo "<td colspan=4 style='text-align:right;'><b>TOTAL</b></td>";
					
					echo "<td><b>&pound".number_format($total,2)."</b></td>";
					
				echo"</tr>";
				
		    echo"</table></p>";	
			
			//display an anchor to allow the user to clear the basket, 
            echo "<br><p><a href = clearbasket.php ><button>CLEAR BASKET</button></a></p>"; 
			echo "<p><a href = checkout.php ><button>CHECKOUT</button></a></p><br><br>"; 
			
			
			//Sign up anchor to allow the user to register and create an account
			echo"<p>New hometeq customers:  <a href = signup.php >Sign Up<p></a><br><br>";
			
			//Login anchor to allow the user to log into the site and place an order
			echo"<p>Returning hometeq customers:  <a href = login.php>Log in</a></p>";
			include("footfile.html"); //include head layout
			
			echo"</body>";
	
	
?>


