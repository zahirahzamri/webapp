<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="refresh" content="50; url=staffMain.jsp";>
		<title>Add Menu</title>
	</head>
	<style type="text/css">
	#username{
		font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
		font-size: 20px;
		letter-spacing: 2px;
		word-spacing: 2px;
		color: #000000;
		font-weight: 400;
		text-decoration: underline solid rgb(68, 68, 68);
		font-style: normal;
		font-variant: small-caps;
		text-transform: none;
	}
	.btn{
		background-color: #FFEFD5;
	  	color: black;
		width: 15%;
	    margin:2%;
	    margin-left: 13%;
	    padding: 10px;
	    display: inline;
	    float:left;
	}
	.btn:hover{
		background-color: #FFA500;
		color: white;
	}
	#btnSubmit{
		background-color: white;
	  	color: black;
		width: 100%;
	    margin:2%;
	    margin-left: 171%;
	    padding: 10px;
	}
	#btnSubmit:hover{
		background-color: green;
	  	color: white;
	}
	.border{
			border: 6px solid #000000;
			border-radius: 17px;
		}
		
	</style>
	<body>
		
		<div align="center" class="border">
			<p id="username">Staff:<%= username %></p>
			<h1>MAHALLAH'S CAFE SYSTEM</h1>
			<h3>ADD MENU</h3>
			
			<form method="post" action="processInsert.jsp">
			<table>
				<tr>
					<td>Product Name</td>
					<td>:</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>Quantity</td>
					<td>:</td>
					<td><input type="text" name="quantity"></td>
				</tr>
				<tr>
					<td>Category</td>
					<td>:</td>
					<td><select name="type">
						    <option value="Food">Food</option>
						    <option value="Drink">Drink</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Price</td>
					<td>:</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td><input type="submit" value="SUBMIT" id="btnSubmit"></td>
				</tr>
			</table>
			</form>
			
			<form method="post" action="retrieveMenu.jsp">
				<!-- SEE MENU -->
				<input type="submit" value="See Menu" class="btn">
			</form>
			
			<form method="post" action="indexMenu.jsp">
				<!-- EDIT MENU -->
				<input type="submit" value="Edit Menu" class="btn">
			</form>
			
			<form method="post" action="staffMain.jsp">
				<!-- SIGN OUT -->
				<input type="submit" value="Sign-Out" class="btn">
			</form>
			
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</body>
</html>