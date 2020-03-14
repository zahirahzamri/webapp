<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html> 
	<head> 
		<title>Sign-Up: Staff</title> 
	</head> 
	<style type="text/css">
		.btnSign{
		  color: white;
		  background-color:  #708090;
		  margin-right:90px;
	      float:left;
		  padding: 10px 20px;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		}
		.btnback{
	  		background-color: #8FBC8B;
	  		color: white;
			width: 15%;
	 		height:34px;
	    	margin-left: 3%;
	    	margin-right:50px;
	    	float:left;
		}
		.btnSign:hover{
			background-color: #2F4F4F;
			cursor: pointer;
		}
		.btnback:hover{
			background-color:#4CAF50;
			cursor: pointer;
		}
	</style>
	<body>
		<div align="center">
		
			<img src="cafe.png" alt="Cafe" width="400" height="200">
			<h3>SIGN-UP PAGE</h3>
			<h4>STAFF</h4>
			
			<br>
			
			<!-- Give Servlet reference to the form as an instances 
			GET and POST services can be according to the problem statement-->
			
			<form action="./InsertDataStaff" method="post">
				<table>
					<tr>
						<td bgcolor="#FF9900">Fullname:</td>
						<td bgcolor="#33CCCC"><input type="text" name="name"></td>
					</tr>
					<tr>
						<td bgcolor="#FF9900">Username:</td>
						<td bgcolor="#33CCCC"><input type="text" name="username"></td>
					</tr>
					<tr>
						<td bgcolor="#FF9900">Password:</td>
						<td bgcolor="#33CCCC"><input type="password" name="password"></td>
					</tr>
					<tr><td><input class="btnSign" type="submit" value="Sign-up"></td></tr>
				</table> 
			</form>
			<form method="post" action="staffMain.jsp">
				<input class="btnback" type="submit" value="Back">
			</form>
		</div> 
		
	</body> 
</html> 
