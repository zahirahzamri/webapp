<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.PreparedStatement"%>
	
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
		PreparedStatement stmt = null;
	%>
	
	<%
		try{
			connection = DriverManager.getConnection(connectionUrl + database + "?useTimezone=true&serverTimezone=UTC", userid, dbPassword);
			statement=connection.createStatement();
			
			String sql ="SELECT * FROM products WHERE productID = " + id;
			
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
	%>
	
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="refresh" content="50; url=staffMain.jsp";>
		<title>Update Menu</title>
	</head>
	<body>
		<p id="username">Staff:<%= username %></p>
		<h1>MAHALLAH'S CAFE SYSTEM</h1>
		<h3>UPDATE MENU</h3>
		
		<form method="post" action="updateMenu-process.jsp">
			<table>
				<tr>
					<td>
						<input type="hidden" name="id" value="<%=resultSet.getString("productID") %>">
						<input type="text" name="id" value="<%=resultSet.getString("productID") %>">
					</td>
				</tr>
				<tr>
					<td>Product name</td>
					<td>:</td>
					<td><input type="text" name="name" value="<%=resultSet.getString("productName") %>"></td>
				</tr>
				<tr>
					<td>Quantity</td>
					<td>:</td>
					<td><input type="text" name="quantity" value="<%=resultSet.getString("quantity") %>"></td>
				</tr>
				<tr>
					<td>Category</td>
					<td>:</td>
					<td><select name="type">
						    <option value="<%=resultSet.getString("productCategory") %>">Food</option>
						    <option value="<%=resultSet.getString("productCategory") %>">Drink</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Price</td>
					<td>:</td>
					<td><input type="text" name="price" value="<%=resultSet.getString("productPrice") %>"></td>
				</tr>
				<tr><td><input type="submit" value="submit"></td></tr>
			</table>
			
		</form>
		
		<%
			}
				connection.close();
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		%>
		
	</body>
</html>