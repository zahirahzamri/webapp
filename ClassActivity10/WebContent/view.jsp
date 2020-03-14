<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
	
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
		
		if (username != null && password != null){
			
			if(username.equals("zahirah") && password.equals("abc123")){

				
	%>
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="refresh" content="5; url=validate.jsp";>
		<title>View Information</title>
	</head>
	<body>
	
		<center>
				<h2>Personal User</h2>
				Personal Information for <%= username %>
				<br>
				Password is <%= password %>
				<br>
				<a href="Main.jsp">Main Page</a>
		</center>
			
			
	</body>
</html>
	<%
			}
			else{
	%>
	
	<jsp:forward page="Form.jsp"/>
	
	<%
			}
		}
		else{
			
	%>
	
	<jsp:forward page="Form.jsp?error=1"/>
	
	<%
		}
	%>


