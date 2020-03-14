<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="database.*"%>
<%@ page import="java.sql.*" %>
	
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
		String DBpassword = "Zahirah98@";
		
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
		<meta http-equiv="refresh" content="50; url=customerMain.jsp";>
		<title>Order Page</title>
	</head>
	<style type="text/css">
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
		.btnback{
		  	background-color: #8FBC8B;
		  	color: white;
			width: 15%;
		 	height:34px;
		    margin-left: 3%;
		    margin-right:30px;
		    float:left;
		}
		.btnSub{
		  background-color:  #F0E68C;
		  margin-right:150px;
		  padding: 10px 20px;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		}
		.btnSign{
			background-color: #8FBC8B;
		  	color: white;
			width: 15%;
		 	height:34px;
		   	margin-right:30px;
		   	float:right;
		}
		.btnSub:hover{
			background-color:  #F1C40F;
		}
		.btnSign:hover{
			background-color: #4CAF50;
			cursor: pointer;
		}
		.btnback:hover{
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
		.orderTable{
		  border-collapse: collapse;
		  width: 75%;
		}
		.row{
			font-weight: bold;
		}
		.border{
			border: 6px solid #000000;
			border-radius: 17px;
		}
	</style>
	<script>
		function d(){
			document.f1.priProduct.value = document.f1.product.value;
			document.f1.hdProduct.value  = document.f1.product.item(document.f1.product.selectedIndex).text;
		}
		function f(){
			var selectedProduct = document.getElementByClass("product");
			var inputValue = selectedProduct.options(selectedProduct.selectedIndex).value;
		}
	</script>
	<body>
		<div align="center" class="border">
		
		<h4>You have login successfully</h4>
		<p id="username">Welcome <%=username %></p>
 
			<img src="cafe.png" alt="Cafe" width="400" height="200">
			<h3>ORDER MENU</h3>
			
			<h3>MENU</h3>
			<table border="1" class="menuTable">
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<!-- <th>Quantity</th> -->
				<th>Category</th>
				<th>Price</th>
			</tr>
			<%
				try{
					connection = DriverManager.getConnection(connectionUrl+database + "?useTimezone=true&serverTimezone=UTC", userid, DBpassword);
					statement=connection.createStatement();
					String sql ="SELECT productID, productName, productCategory, productPrice FROM products";
					resultSet = statement.executeQuery(sql);
					
					while(resultSet.next()){
			%>
			
			<tr>
				<td id="rowID"><%=resultSet.getString("productID") %></td>
				<td id="rowName"><%=resultSet.getString("productName") %></td>
				<%-- <td><%=resultSet.getString("quantity") %></td> --%>
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
			
			
			
			<form method="post" action="tryPayment.jsp" name="f1">
				<table class="orderTable">
					<tr>
						<%
							String driverName = "com.mysql.jdbc.Driver";
							String url = "jdbc:mysql://localhost:3306/mydb?useTimezone=true&serverTimezone=UTC";
							String user = "root";
							String psw = "Zahirah98@";
							
							Connection con = null;
							PreparedStatement ps = null;
							
							try {  
								Class.forName(driverName);  
							
								Connection conn= DriverManager.getConnection(url,user,psw);  
								
								String sql = "SELECT * FROM products;";
								ps = conn.prepareStatement(sql);
								
								ResultSet rs = ps.executeQuery(); 
							%><br>
							<br>
							<br>
								<td class="row"> Select Menu</td>
								<td>:</td>
								<td>	
								<select name="product" onchange="d()">
							<%
								while(rs.next()){
								String name = rs.getString("productName");
							%>
								<option value="<%=name %>"><%=name %></option>
							<%
								}
							%>
								</select>
							
							<%
								} 
								catch (SQLException e) {  
									out.println(e);
								}
							%>  
							</td>
					</tr>
					<tr>
						<%
							
							try {  
								Class.forName(driverName);  
							
								Connection conn= DriverManager.getConnection(url,user,psw);  
								
								String sql = "SELECT * FROM products;";
								ps = conn.prepareStatement(sql);
								
								ResultSet rs1 = ps.executeQuery(); 
							%>
								<td class="row">Price</td>
								<td>:</td>
								<td>
									
							<%
								while(rs1.next()){
									String name1 = rs1.getString("productPrice");
								
							%>
							<input type="text" name="priProduct" value="<%=name1 %>" readonly >
							<input type="hidden" name="hdProduct">
							
							<%
									}
								} 
								catch (SQLException e) {  
									out.println(e);
								}  
							%>
								</td>
					</tr>
					<tr>
						<td class="row">Quantity</td>
						<td>:</td>
						<td><input type="text" name="qty"></td>
					</tr>
					<tr>
						<td class="row">Payment Method</td>
						<td>:</td>
						<td><p><input type="radio" name="payMet" value="Cash">Cash</p>
							<p><input type="radio" name="payMet" value="Debit Card">Debit Card</p>
							<p><input type="radio" name="payMet" value="Credit Card">Credit Card</p>
						</td>
					</tr>
					<br>
					
					<tr><td><input class= "btnSub" type="submit" value="PAY"></td></tr>
			
				</table>
			
			<br>
			<br>
			</form>
				<form method="post" action="customerMain.jsp">
				<input class="btnback" type="submit" value="Back">
			</form>

			<form method="post" action="customerMain.jsp">
				<input class="btnSign" type="submit" value="Sign Out">
			</form>
		<br>
		<br>
		</div>

		
		
	</body>
</html>