<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage ="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Error Page</title>
	</head>
	<body>
		<%
        	 try {
        		String num1=request.getParameter("n1");  
     			String num2=request.getParameter("n2");  
     			  
     			int a=Integer.parseInt(num1);  
     			int b=Integer.parseInt(num2);
     			int c=a/b;  
     			out.print("Division of numbers is: " + c); 	
	         }
	         catch (Exception e) {
	            out.println("An exception occurred: " + e.getMessage());
	         }
      	%>
 	
	</body>
</html>