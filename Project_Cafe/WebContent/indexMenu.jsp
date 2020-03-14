<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

	<%
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
   	%>
   	
	<%
		String id = request.getParameter("productID");
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String database = "mydb";
		String userid = "root";
		String dbPassword = "Zahirah98@";
		
		try {
			Class.forName(driver);
		} 
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>
	
	<html>
		<head>
			<meta http-equiv="refresh" content="100; url=staffMain.jsp";>
			<title>Menu</title>
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
		.btnMain{
			background-color: #8FBC8B;
		  	color: white;
			width: 15%;
		 	height:34px;
		    margin:0 auto;
		    margin-left: 3%;
		    margin-right:30px;
		    float:left;
		}
		.btnback{
		  	background-color: #8FBC8B;
		  	color: white;
			width: 15%;
		 	height:34px;
		    margin:0 auto;
		    margin-right:30px;
		    margin-left: 22%;
		    float:left;
		}
		.btnSign{
			background-color: #8FBC8B;
		  	color: white;
			width: 15%;
		 	height:34px;
		    margin:0 auto;
		    margin-right:30px;
		    float:right;
		}
		.btnSign:hover, .btnback:hover, .btnMain:hover{
			background-color: #4CAF50;
			cursor: pointer;
		}
		.menuTable {
		  border-collapse: collapse;
		  width: 75%;
		}
		.menuTable th, .menuTable td {
		  text-align: center;
		  padding: 8px;
		}
		#rowID{
			width: 0.05%;
		}
		#rowName{
			text-align: left;
		}
		#rowAction{
			width:10%;
		}
		.menuTable tr:nth-child(even){background-color: #f2f2f2}
		.menuTable th {
		  background-color: #FF6347;
		  color: white;
		}
		.delete{
			background-color: #F47C5E;
			border: none;
			color: white;
			padding: 15px 32px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			margin: 4px 2px;
		}
		.delete:hover{
			background-color: #C0644D;
		  	color: white;
		  	cursor: pointer;
		}
		.add{
			background-color: #F47C5E;
			border: none;
			color: white;
			padding: 15px 39px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			margin: 4px 2px;
		}
		.add:hover{
			background-color: #C0644D;
		  	color: white;
		  	cursor: pointer;
		}
		.update{
			background-color: #F47C5E;
			border: none;
			color: white;
			padding: 15px 30px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			margin: 4px 2px;
		}
		.update:hover{
			background-color: #C0644D;
		  	color: white;
		  	cursor: pointer;
		}
		.border{
			border: 6px solid #000000;
			border-radius: 17px;
		}
	

	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<body>
		
		<div align="center" class="border">
			<img src="cafe.png" alt="Cafe" width="500" height="300">
			<p id="username">Staff:<%= username %></p>
			<h1>MAHALLAH'S CAFE SYSTEM</h1>
			<h3>Edit Menu</h3>
			<br>
			<h4>MENU</h4>
			<table border="1" class="menuTable">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Unit</th>
				<th>Type</th>
				<th>Price</th>
				<th>Actions</th>
			</tr>
			<%
				try{
					connection = DriverManager.getConnection(connectionUrl + database + "?useTimezone=true&serverTimezone=UTC", userid, dbPassword);
					statement=connection.createStatement();
					
					String sql ="SELECT * FROM products";
					resultSet = statement.executeQuery(sql);
					
					int i=0;
					while(resultSet.next()){
			%>
			
			<tr>
				<td id="rowID"><%=resultSet.getString("productID") %></td>
				<td id="rowName"><%=resultSet.getString("productName") %></td>
				<td><%=resultSet.getString("quantity") %></td>
				<td><%=resultSet.getString("productCategory") %></td>
				<td><%=resultSet.getString("productPrice") %></td>
				<td id="rowAction">
					<a href="updateMenu.jsp?id=<%=resultSet.getString("productID") %>"><button type="button" class="update">Update</button></a>
					<a href="deleteMenu.jsp?id=<%=resultSet.getString("productID") %>"><button type="button" class="delete">Delete</button></a>
					<a href="insertMenu.jsp"><button type="button" class="add">Add</button></a>
				</td>
			</tr>
			
			<%
					i++;
				}
					connection.close();
				} 
				catch (Exception e) {
					e.printStackTrace();
				}
			%>
			</table>
			<br>
			<br>
			<form method="post" action="staffView.jsp">
			<input class="btnMain" type="submit" value="Main Page">
			</form>
			<form method="post" action="retrieveMenu.jsp">
				<input class="btnback" type="submit" value="See Menu">
			</form>
			<form method="post" action="staffMain.jsp">
				<input class="btnSign" type="submit" value="Sign-out">
			</form>
			
			<br>
			<br>
			<br>
			</div>
		</body>
</html>

