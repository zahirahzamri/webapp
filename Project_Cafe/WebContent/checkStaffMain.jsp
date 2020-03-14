<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
    
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
			
		    
		    
			if(username != null && password != null){
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useTimezone=true&serverTimezone=UTC","root","Zahirah98@");
					
				    Statement st = con.createStatement();
				    ResultSet rs = st.executeQuery("SELECT username, password FROM staff WHERE username = '" + username + "' and password = '" + password + "'");
				    

				    while(rs.next()){
				    	
				    	if(username.equals(rs.getString(1)) && password.equals(rs.getString(2))){
				    		
				    		out.println("You have logined succesfully");
				    		out.println("Welcome " + username);
				    		session.setAttribute("username", username);
				    		session.setAttribute("password", password);
				    		response.sendRedirect("staffView.jsp");
				    	}
				    	else{
				    		 out.println("<br><br><br><a><b>INVALID<b></a> <br>USERNAME AND PASSWORD! <br><br>");
				    		
				    		 
				    	}
				    	  con.close();
				    }

				}
				catch(Exception e){
					out.println(e);
					e.printStackTrace();
				}
		%>
		
		<%
				}

		%>
		<br><br><br><a><b>INVALID<b></a> <br>USERNAME AND PASSWORD! <br><br>
		<form method="post" action="staffMain.jsp">
				  			<input class="btnAgain" type="submit" value="Try Again">
				  		</form>
				     </div> 
	</body>
</html>