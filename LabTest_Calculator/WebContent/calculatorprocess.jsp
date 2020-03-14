<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Output</title>
	</head>
	<body>
		
		<jsp:useBean id="calculate" class="Calculator.calculate"></jsp:useBean>
		<jsp:setProperty name="calculate" property="*"/>
		
		<%
		calculate.calc();
		%>
		
		
		<h2>Output</h2>
		<center><h3>Calculator</h3></center>
		
		<table>
			<tr>
				<td>First Number</td>
				<td>:</td>
				<td><jsp:getProperty property="firstNo" name="calculate"/></td>
			</tr>
			<tr>
				<td>Operation</td>
				<td>:</td>
				<td><jsp:getProperty property="operator" name="calculate"/></td>
			</tr>
			<tr>
				<td>Second Number</td>
				<td>:</td>
				<td><jsp:getProperty property="secondNo" name="calculate"/></td>
			</tr>
			<tr>
				<b><td>Total</td>
				<td>:</td>
				<td><jsp:getProperty property="total" name="calculate"/></td></b>
			</tr>
		</table>
		
		
		
		
	</body>
</html>