<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import = "java.io.* , java.util.*"%>
<%@ page import="menu.DatabaseConnection_Menu" %>
    
<%@page import="database.*"%>
	
	<%
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
   	%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="refresh" content="50; url=staffMain.jsp";>
		<title>Menu - Staff</title>
	</head>
	<style type = "text/css">
		h4{
			color: green;
		}
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
		.btnSign{
			background-color: #8FBC8B;
		  	color: white;
			width: 15%;
		 	height:34px;
		    margin:0 auto;
		    margin-right:30px;
		    margin-bottom: 2%;
		}
		.btnSign:hover{
			background-color: #4CAF50;
			cursor: pointer;
		}
		.menu{
			display: inline-block;
			width: 50%;
			border-width: 5px;
			border-style: groove;
			padding: 20px;
			margin: 2%;
			background-color: #FFEFD5;
			color: black;
		}
		.menu:hover{
			background-color: #FFA500;
			color: white;
			cursor: pointer;
		}
		.border{
			border: 6px solid #000000;
			border-radius: 17px;
		}
	</style>
	<body>
		<div align = "center" class="border">
			<h4>You have login successfully</h4>
			<p id="username">Welcome <%= username %></p>
			<img src="cafe.png" alt="Cafe" width="400" height="200">
			<br>
			
			<div align="center">
				<h4>
					<a href="retrieveMenu.jsp"><button type="button" class="menu">SEE MENU</button></a>
					<a href="indexMenu.jsp"><button type="button" class="menu">EDIT MENU</button></a>
					<a href="insertMenu.jsp"><button type="button" class="menu">ADD MENU</button></a>
				</h4>
	    	</div>
			
	    	<form method="post" action="staffMain.jsp">
				<input class="btnSign" type="submit" value="Sign-out">
			</form>
					
		</div>
	</body>
</html>