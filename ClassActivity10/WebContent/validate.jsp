<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
  <%@ page import="java.sql.*"%>
  <%@ page import="java.io.*"%>
  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Validate</title>
	</head>
	<body>
	
		<%! String userName = "";
			String userPassword = "";
			String error;
		%>
	
		<% 
			userName = request.getParameter("username");
			userPassword = request.getParameter("password");
			
			out.println(userName);
			out.print(userPassword);
			
			try{
				String connectionURL = "jdbc:mysql://localhost:3306/root";
				Connection connection = null;
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dev?autoReconnect=true&useSSL=false","root","password");
				
				Statement statement = con.createStatement();
				String sql = "";
				sql="SELECT username, passw FROM classactivity9.users_data";
				ResultSet rs = statement.executeQuery(sql);
				
				while(rs.next()){
					String login = rs.getString("username");
		        	String password = rs.getString("passw");
					if(userName.equals(rs.getString(1)) && userPassword.equals(rs.getString(2))){
						statement.close();
		                con.close();
		                
		%>
		   <jsp:forward page="Main.jsp" />
		<% 
					}
					else{
		%>
		   <jsp:forward page="Form.jsp?error=1" />
		<%   
					}
				}
				
				connection = DriverManager.getConnection(connectionURL,"ClassActivity10","Zahirah98@");
				
				if(!connection.isClosed())
		%>
		<%
			out.println("Successfully connected to " + "MySQL server using TCP/IP");
			connection.close();
			}
			catch(Exception ex){
		%>
		<%
			out.println("Unable to connect to the database.");
			}
		%>
			
	</body>
</html>