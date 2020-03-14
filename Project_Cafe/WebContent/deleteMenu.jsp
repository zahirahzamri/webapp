<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.*,java.util.*"%>
<%@page import = "java.sql.Statement"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.Connection"%>

<%
		String id = request.getParameter("productID");
		String query = "DELETE FROM products WHERE productID =" + id;
		int status=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");	
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useTimezone=true&serverTimezone=UTC", "root", "Zahirah98@");
			Statement st = conn.createStatement();
			
			
			int i = st.executeUpdate(query);
			
			/* out.println("Data Deleted Successfully!");
			out.println("<html><body><a href='retrieveMenu.jsp'>See Menu</a></body></html>"); */
			
			if(i > 0){
	%>
	<%
			out.println("<html><body><div align='center'><h1>MAHALLAH'S CAFE SYSTEM</h1>");
			out.println("<h3>Delete Menu Process</h3><hr>");
			out.println("<br><b>Status:</b>");
			out.print("<br>Record Deleted Successfully");
			out.println("<a href='retrieveMenu.jsp'><input type='submit' class=menu value='See Menu'></a></div></body></html>");
	%>
	
	<% 
			}
			else{
	%>
	<%
				out.println("<html><body><div align='center'><h1>MAHALLAH'S CAFE SYSTEM</h1>");
				out.println("<h3>Delete Menu Process</h3><hr>");
				out.println("<br><b>Status:</b>");
				out.println("<br>There is a problem in Deleting Record.");
				out.println("<br>Check Manually in your Database");
				out.println("<br><br><a href='indexMenu.jsp'><button type='button' class='seeMenu'>BACK</button></a>");
				out.println("<br><br><a href='retrieveMenu.jsp'><button type='button' class='seeMenu'>SEE MENU</button></a></div></body></html>");
			} 
	%>
	<%
			
		}
		catch(Exception e){
			System.out.print(e);
			e.printStackTrace();
		}
	%>
	
<!DOCTYPE html>
 <html>
	<head>
		<title>Delete Menu</title>
	</head>
	<!-- <style>

	.seeMenu:hover{
		background-color: green;
	  	color: white;
	}
	.seeMenu{
		background-color: white;
	  	color: black;
		width: 100%;
	    margin:2%;
	    margin-left: 171%;
	    padding: 10px;
	}
	</style> -->
</html>

	
          