<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>

<%
	String name = request.getParameter("name");
	String quantity = request.getParameter("quantity");
	String type = request.getParameter("type");
	String price = request.getParameter("price");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useTimezone=true&serverTimezone=UTC", "root", "Zahirah98@");
		Statement st=conn.createStatement();
		
		int i = st.executeUpdate("INSERT INTO products(productName, quantity, productCategory, productPrice) VALUES('"+name+"','"+quantity+"','"+type+"','"+price+"')");
		out.println("<html><head><title>Insert Menu</title></head><body><div align='center'><h1>MAHALLAH'S CAFE SYSTEM</h1>");
		out.println("<h3>Add Menu Process</h3><hr>");
		out.println("Data is successfully inserted!");
		out.println("<br><br><a href='indexMenu.jsp'><button type='button' class='seeMenu'>BACK</button></a>");
		out.println("<br><br><a href='retrieveMenu.jsp'><button type='button' class='seeMenu'>SEE MENU</button></a></div></body></html>");
		
	}
	catch(Exception e){
		System.out.print(e);
		e.printStackTrace();
	}
%>

