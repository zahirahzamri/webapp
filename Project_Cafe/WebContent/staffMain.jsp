<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Staff Main Page</title>
	</head>
	<style type="text/css">
		.btn{
			width: 100%;
			height: 30px;
			margin: 5px;
			table-layout: fixed;
			border-collapse: collapse;
			background-color: white;
		}
		.btnR{
		  color: white;
		  background-color:  #CD5C5C;
		  table-layout: fixed;
		  border-collapse: collapse;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		}
		.btnLog{
		  color: white;
		  background-color:  #708090;
		  table-layout: fixed;
		  border-collapse: collapse;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		}
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
		.btn:hover{
			background-color: #F08080;
			cursor: pointer;
		}
		.btnR:hover {
			background-color: #B22222;
			cursor: pointer;
		} 
		.btnSign:hover, .btnLog:hover{
			background-color: #2F4F4F;
			cursor: pointer;
		}
		.btnback:hover{
			background-color: #4CAF50;
			cursor: pointer;
		}
		.imgcontainer {
  		text-align: center;
 		margin: 14px 0 12px 0;
		}
		img.avatar {
  		width: 15%;
  		border-radius: 50%;
		}
			.border{
			border: 6px solid #000000;
			border-radius: 17px;
		}
	</style>
	<body>
		<div align="center" class="border">
			<h1>MAHALLAH'S CAFE SYSTEM</h1>
			<h3>STAFF PAGE</h3>
			<div class="imgcontainer">
		    <img src="img_avatar2.png" alt="Avatar" class="avatar">
		  </div>

			<br>
			
			<form method="post" action="checkStaffMain.jsp">
				<table>
					<tr>
						<td bgcolor="#FF9900">Username:</td>
						<td bgcolor="#33CCCC"><input type="text" name="username"></td>
					</tr>
					<tr>
						<td bgcolor="#FF9900">Password:</td>
						<td bgcolor="#33CCCC"><input type="password" name="password"></td>
					</tr>
					<tr>
						<td><input class="btnR" type="reset" value="Reset"></td>
						<td><input class="btnLog" type="submit" value="Login"></td>
					</tr>
					
				</table>
			</form>
			
			<form method="post" action="insertStaff.jsp">
				<table>
			
					<tr><td><input class="btnSign" type="submit" value="Sign-up"></td></tr>
				</table>
			</form>
			<form method="post" action="main.jsp">
				<input class="btnback" type="submit" value="Back">
			</form>
		<br>
		<br>
		<br>
		</div>


	
	</body>
</html>