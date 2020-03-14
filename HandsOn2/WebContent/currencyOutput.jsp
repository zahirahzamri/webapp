<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="java.io.*, convert.currencyConverter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Currency Converter</title>
</head>
<body>
	<h2> Result </h2>
	
	
	<% 
		convert.currencyConverter myClass = new convert.currencyConverter();
		
		myClass.doPost(request, response);
		
	 %>
	 
	 <h5><%= myClass.country %> to MYR</h5>
	 
	 <%= myClass.amount %> = RM <%= myClass.resultOutput %>
	 
</body>
</html>
