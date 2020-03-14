<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>

	<%
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
   	%>
   	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Payment Page</title>
	</head>
	<style type="text/css">
		#username{
			font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
			font-size: 20px;
			letter-spacing: 2px;
			word-spacing: 2px;
			color: #000000;
			font-weight: 400;
			text-decoration: underline solid rgb(68, 68, 68);
			font-style: normal;
			font-variant: small-caps;
			text-transform: none;
		}
		.btnback{
		  	background-color: #8FBC8B;
		  	color: white;
			width: 15%;
		 	height:34px;
		    margin-left: 3%;
		    margin-right:30px;
		    float:left;
		}
		.btnSign{
			background-color: #8FBC8B;
		  	color: white;
			width: 15%;
		 	height:34px;
		    margin:0 auto;
		    margin-right:30px;
		    float:right;
		}
		.btnSign:hover{
			background-color: #4CAF50;
			cursor: pointer;
		}
		.btnback:hover{
			background-color: #4CAF50;
			cursor: pointer;
		}
		.border{
			border: 6px solid #000000;
			border-radius: 17px;
		}
	</style>
	<script>
	
	</script>
	<body>
		<div align="center" class="border">
			<img src="cafe.png" alt="Cafe" width="400" height="200">
			<h3>RECEIPT</h3>
		
			<p id="username">Customer Name: <%=username %></p>
			<table>
			
		<%
			    String b = request.getParameter("payMet");
			    out.println("<tr><td>Payment method</td><td>:</td><td>"+b+"<br></td></tr>");
			    
				String product      = request.getParameter("product");
				double priceFood 	= Double.parseDouble(request.getParameter("priProduct"));
				int quantityFood 	= Integer.parseInt(request.getParameter("qty"));
				
				out.println("<tr><td>Product </td><td>:</td><td>" + product +"<br></td></tr>");
				out.println("<tr><td>Price   </td><td>:</td><td>RM " + String.format("%.2f", priceFood) +"<br></td></tr>");
				out.println("<tr><td>Quantity</td><td>:</td><td>" + quantityFood +"<br></td></tr>");
				
				
				double total = (priceFood*quantityFood);
				double tax   = 0.10*total;
				double gst   = 0.06*total;
				out.println("<tr><td>Your total bill  </td><td>:</td><td>RM " + String.format("%.2f", total)+"<br></td></tr>");
				out.println("<tr><td>*10% Service Tax </td><td>:</td><td>RM " + String.format("%.2f", tax)+"<br></td></tr>");
				out.println("<tr><td>*6% GST  </td><td>:</td><td>RM " + String.format("%.2f", gst)+"<br></td></tr>");
				
				
				double overalltotal = total + tax + gst;
				
			    if(request.getParameter("payMet") != null){
			        if(request.getParameter("payMet").equals("Debit Card")){
			        	double discount = 0.95 * overalltotal;
			        	out.println("<tr><td>Overall total bill (5% off)</td><td>:</td><td> RM "+String.format("%.2f", discount)+"<br></td></tr>");
			        }
			        else{
			        	out.println("<tr><td>Overall total bill </td><td>:</td><td> RM "+String.format("%.2f", overalltotal)+"<br></td></tr>");
			        }
				 }
	
			%>
			
			<%
				Date date = new Date();
				out.println("<br><br><tr><td>Date </td><td>:</td><td> " + date + "</td></tr>");
			%>
			</table>
			<br>
			<br>
			<form method="post" action="tryOrder.jsp">
				<input class="btnback" type="submit" value="Order">
			</form>
			<form method="post" action="customerMain.jsp">
				<input class="btnSign" type="submit" value="Sign Out">
			</form>
			<br>
			<br>
			<br>
		</div>

	</body>
</html>