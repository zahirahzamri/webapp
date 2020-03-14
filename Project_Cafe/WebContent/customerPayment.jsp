<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Payment Page</title>
	</head>
	<style type="text/css">
	
	</style>
	<script>
	
	</script>
	<body>
		<%
			    String b=request.getParameter("payMet");
			    out.println("Payment method: "+b+"<br>");
			    
				String food=request.getParameter("hdFood");
				double priceFood=Double.parseDouble(request.getParameter("priFood"));
				int quantityFood=Integer.parseInt(request.getParameter("qtyFood"));
				
				String drink=request.getParameter("hdDrink");
				double priceDrink=Double.parseDouble(request.getParameter("priDrink"));
				int quantityDrink=Integer.parseInt(request.getParameter("qtyDrink"));
				
				out.println("Food : " + food +"<br>");
				out.println("Price   : RM " + priceFood +"<br>");
				out.println("Quantity: " + quantityFood +"<br>");
				
				out.println("Drink : " + drink +"<br>");
				out.println("Price   : RM " + priceDrink +"<br>");
				out.println("Quantity: " + quantityDrink +"<br>");
				out.println("<hr width='200px' align='left'>");
				
				double total=(priceFood*quantityFood)+(priceDrink*quantityDrink);
				double tax=0.10*total;
				double gst=0.06*total;
				out.println("Your total bill is: RM "+String.format("%.2f", total)+"<br>");
				out.println("*10% Service Tax: RM " +String.format("%.2f", tax)+"<br>");
				out.println("*6% Service Tax: RM " +String.format("%.2f", gst)+"<br>");
				
				double overalltotal = total + tax + gst;
				
			    if(request.getParameter("payMet") != null) 
				 {
			        if(request.getParameter("payMet").equals("debitCard")) 
			        {
			        	double discount = 0.95 * overalltotal;
			        	out.println("Your overall total bill is (5% off): RM "+String.format("%.2f", discount)+"<br>");
			        }
			        else
			        {
			        	out.println("Your overall total bill is: RM "+String.format("%.2f", overalltotal)+"<br>");
			        }
				 }
	
			%>
			
			<%
				Date date = new Date();
				out.println("<br><br>Date: " + date);
			%>
	</body>
</html>