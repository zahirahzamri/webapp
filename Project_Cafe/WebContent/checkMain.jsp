<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Invalid Login</title>
	</head>
	<style type="text/css">
		.btnAgain{
			background-color: #8FBC8B;
		  	color: white;
			width: 15%;
		 	height:34px;
		    margin-right:5px;
		    cursor: pointer;
		}
		.btnAgain:hover{
			background-color: #4CAF50;
		  	color: white;
		}
		a{
			font-size: 24px;
			color:red;
		}
	
}
	</style>
	<body>
		<div align="center">
	<%
	    String username = request.getParameter("username");    
	    String password = request.getParameter("password");
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useTimezone=true&serverTimezone=UTC", "root", "Zahirah98@");
	    Statement st = con.createStatement();
	    ResultSet rs;
	    rs = st.executeQuery("select * from users where username='" + username + "' and pass='" + password + "'");
	    if (rs.next()) {
	        session.setAttribute("username", username);
	        response.sendRedirect("tryOrder.jsp");
	    } 
	    else {
	    	
	        out.println("<br><br><br><a><b>INVALID<b></a> <br>USERNAME AND PASSWORD! <br><br>");
	 %>
	        <form method="post" action="customerMain.jsp">
				<input class="btnAgain" type="submit" value="Try Again">
			</form>
   		</div> 
    <% 
 
    	}
    
	%>

	</body>
</html>

