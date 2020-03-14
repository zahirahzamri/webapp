<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

	<%
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
   	%>

	<%
		String id = request.getParameter("userid");
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
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="refresh" content="50; url=staffMain.jsp";>
		<title>List Menu</title>
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
		    margin-left: 22%;
		    margin-right:30px;
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
		  width: 50%;
		}
		.menuTable th, .menuTable td {
		  text-align: center;
		  padding: 8px;
		}
		#rowID{
			width: 0.5%;
		}
		#rowName{
			text-align: left;
		}
		.menuTable tr:nth-child(even){background-color: #f2f2f2}
		
		.menuTable th {
		  background-color: #FF6347;
		  color: white;
		}
		.border{
			border: 6px solid #000000;
			border-radius: 17px;
		}
	</style>
	<body>
	
	<div align="center"  class="border">
	<img src="cafe.png" alt="Cafe" width="500" height="300">
	<p id="username">Staff:<%= username %></p>
	<h1>MAHALLAH'S CAFE SYSTEM</h1>
	<h3>MENU</h3>
	<br>
		<table border="1" class="menuTable">
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Quantity</th>
				<th>Category</th>
				<th>Price</th>
			</tr>
			<%
				try{
					connection = DriverManager.getConnection(connectionUrl+database + "?useTimezone=true&serverTimezone=UTC", userid, dbPassword);
					statement=connection.createStatement();
					String sql ="SELECT * FROM products";
					resultSet = statement.executeQuery(sql);
					
					while(resultSet.next()){
			%>
			<tr>
				<td id="rowID"><%=resultSet.getString("productID") %></td>
				<td id="rowName"><%=resultSet.getString("productName") %></td>
				<td><%=resultSet.getString("quantity") %></td>
				<td><%=resultSet.getString("productCategory") %></td>
				<td><%=resultSet.getString("productPrice") %></td>
			</tr>
			<%
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
		<form method="post" action="indexMenu.jsp">
			<input class="btnback" type="submit" value="Edit Menu">
		</form>
		<form method="post" action="staffMain.jsp">
			<input class="btnSign" type="submit" value="Sign-Out">
		</form>
		
		<br>
		<br>
		<br>
	</div>
	</body>
</html>