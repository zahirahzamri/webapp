<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%> 
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Main Page</title>
	</head>
	<style type="text/css">
		.button {
		  display: inline-block;
		  border-radius: 4px;
		  background-color: #f4511e;
		  border: none;
		  color: #FFFFFF;
		  text-align: center;
		  font-size: 28px;
		  padding: 20px;
		  width: 200px;
		  transition: all 0.5s;
		  cursor: pointer;
		  margin: 5px;
		}
		
		.button span {
		  cursor: pointer;
		  display: inline-block;
		  position: relative;
		  transition: 0.5s;
		}
		
		.button span:after {
		  content: '\00bb';
		  position: absolute;
		  opacity: 0;
		  top: 0;
		  right: -20px;
		  transition: 0.5s;
		}
		
		.button:hover span {
		  padding-right: 25px;
		}
		
		.button:hover span:after {
		  opacity: 1;
		  right: 0;
		}
		.btn{
			width: 100%;
			height: 50px;
			margin: 10px;
			table-layout: fixed;
			border-style: inset;
			border-width: medium;
			border-color: #FF4500;
			background-color: white; 
			border-radius: 4px;
		}
		.btn:hover{
			background-color: #FFEFD5;
			cursor: pointer;
		}
		img{
			border-radius: 8px;
		}
		.border{
			border: 6px solid #000000;
			border-radius: 17px;
		}
	
	</style>
	<body>
	
		<div align="center" class="border">
			<img src="cafe.png" alt="Cafe" width="500" height="300">
			<h1>MAHALLAH'S CAFE SYSTEM</h1>
			<h3>Choose an option</h3>
			<table>
				<tr>
					<td>
						<form method="post" action="customerMain.jsp">
							<input class="btn" type="submit" value="Customer">
						</form>
					</td>
					<td>	
						<form method="post" action="staffMain.jsp">
							<input class="btn" type="submit" value="Staff">
						</form>
					</td>
				</tr>
			</table>
		</div>
	
	</body>
</html>