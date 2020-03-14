<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%
	   	session.removeAttribute("username");
   		session.removeAttribute("password");
   		session.invalidate();
   %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>
	<body>
	
	<h1>Login Page</h1>
	
	<form method="post" action="validate.jsp">
		<table>
		<tr>
			<td>Login</td>
			<td>:</td>
			<td><input type="text" name="username" size="30"></td> 
		</tr>
		<tr>
			<td>Password</td>
			<td>:</td>
			<td><input type="password" name="password" size="30"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><input type="submit" name="submit" value="Login"></td>
			<td><input type="reset" name="reset" value="Reset"></td>
		</tr>
		<tr>
			<td align="center" colspan="3">
			<font color="red">
				<%
					String error = request.getParameter("error");
					
					if(error != null){
				%>
					Invalid Login and Password!
				<%
					}
				%>	
			</font>
			</td>
		</tr> 
		</table>
		
	</form>
	
	
	</body>
</html>