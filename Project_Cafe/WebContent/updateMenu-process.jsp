<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>


	<%
		String id = request.getParameter("productID");
		String name = request.getParameter("productName");
		String quantity = request.getParameter("quantity");
		String type = request.getParameter("productCategory");
		String price = request.getParameter("productPrice");
		
		
		 String driverName = "com.mysql.jdbc.Driver";
		 String url = "jdbc:mysql://localhost:3306/mydb?useTimezone=true&serverTimezone=UTC";
		 String user = "root";
		 String psw = "Zahirah98@";
		
		if(id != null){
			Connection con = null;
			PreparedStatement ps = null;
			int personID = Integer.parseInt(id);
			
			try{
				Class.forName(driverName);
				con = DriverManager.getConnection(url,user,psw);
				String sql="UPDATE products SET productName = ?, quantity = ?, productCategory = ?, productPrice = ? WHERE productID = " + id;
				
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, quantity);
				ps.setString(3, type);
				ps.setString(4, price);
				
				int i = ps.executeUpdate();
				
				if(i > 0){
	%>
	<%
					out.println("Record Updated Successfully");
	%>
	<%
				}
				else{
	%>
	<%
					out.println("There is a problem in updating Record.");
				}
				
				ps.close();
	%>
	<%
			}
			catch(SQLException sql){
				request.setAttribute("error", sql);
				out.println(sql);
			}
	%>
	<%
		}
	%>
<html>
	<head>
		<title>Update Menu</title>
	</head>
</html>
