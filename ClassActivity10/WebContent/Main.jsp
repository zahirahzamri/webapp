<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page session="true"%>
 
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
		<meta http-equiv="refresh" content="10; url=validate.jsp";>
		<title>Main Page</title>
	</head>
	<body>
	
	<center>
		<h1>Main Page</h1>
		Welcome <%=username %>
		
		<br>
		<a href="view.jsp">View Personal Information</a>
		<a href="Form.jsp">Sign out</a>
		
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
		