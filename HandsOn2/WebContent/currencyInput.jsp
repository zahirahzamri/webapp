<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Currency Converter</title>
	</head>
	<body>
		<form action="currencyOutput.jsp">
		<h3>Currency Converter</h3>
		<table>
			<tr>
				<td>Amount of currency</td>
				<td>:</td>
				<td><input type="text" name=amount></td>
			</tr>
			<tr>
				<td>Country</td>
				<td>:</td>
				<td><select name="ctr">
				
				<option value="SAR" >Saudi Arabian Riyal (SAR)</option>
				<option value="IDR" >Indonesian Rupiah (IDR)</option>
				<option value="BDT" >Bangladeshi Taka (BDT)</option>
				<option value="AFN" >Afghanistan Afghan Afghani (AFN)</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>	
		</form>

	</body>
</html>