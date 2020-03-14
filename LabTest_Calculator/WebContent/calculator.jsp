<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Input Numbers</title>
	</head>
	<body>
	
		<h2>Input</h2>
		<center><h3>Calculator</h3></center>
		
		<form method="post" action="calculatorprocess.jsp">
			<table>
				<tr>
					<td>First Number</td>
					<td>:</td>
					<td><input type="text" name="firstNo" size="30"></td>
				</tr>
				<tr>
					<td>Operation</td>
					<td>:</td>
					<td><select name="operator">
						    <option value="add">Add</option>
						    <option value="minus">Minus</option>
						    <option value="multiply">Multiply</option>
						    <option value="divide">Divide</option>
						    <option value="remainder">Remainder</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Second Number</td>
					<td>:</td>
					<td><input type="text" name="secondNo" size="30"></td>
				</tr>
				<tr>
					<td><input type="submit" name="submit" value="Calculate"></td>
					<td><input type="reset" name="reset" value="Clear"></td>
				</tr>
			</table>
		</form>
	</body>
</html>