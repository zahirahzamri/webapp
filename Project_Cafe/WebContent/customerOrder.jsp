<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="database.*"%>
	
	<%
		String username = (String)session.getAttribute("username");
		String password = (String)session.getAttribute("password");
   	%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="refresh" content="50; url=customerMain.jsp";>
		<title>Order Page</title>
	</head>
	<style type="text/css">
		.btnback{
		  	background-color: #4CAF50;
		  	color: white;
			width: 15%;
		 	height:34px;
		    margin:0 auto;
		    margin-right:30px;
		    float:left;
		}
		.btnSub{
			background-color:  #696969;
			margin-right:150px;
		  padding: 10px 20px;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		
		}
		.btnSign{
			background-color: #4CAF50;
	  	color: white;
		width: 15%;
	 	height:34px;
	    margin:0 auto;
	    margin-right:30px;
	    float:right;
		}
	</style>
	<script>
		function d()
		{
			document.f1.priFood.value=document.f1.food.value;
			document.f1.hdFood.value=document.f1.food.item(document.f1.food.selectedIndex).text;
		}
		function e()
		{
			document.f1.priDrink.value=document.f1.drink.value;
			document.f1.hdDrink.value=document.f1.drink.item(document.f1.drink.selectedIndex).text;
		}
	</script>
	<body>
		<div align="center">
		
		<h4>You have login successfully</h4>
		<p>Welcome <%=username %></p>
 
			<img src="cafe.png" alt="Cafe" width="400" height="200">
			<h3>ORDER MENU</h3>
			<form method="post" action="customerPayment.jsp" name="f1">
				<table>
					<tr>
						<td>Choose a product (FOOD)</td>
						<td>:</td>
						<td><select name="food" onchange="d()">
								<option>Select</option>
								<option value="4.00">Nasi Goreng</option>
								<option value="3.50">Bihun Tomyam</option>
								<option value="7.00">Chicken Chop</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Item Price (FOOD)</td>
						<td>:</td>
						<td><input type="text" name="priFood" readonly>
							<input type="hidden" name="hdFood">
						</td>
					</tr>
										<tr>
						<td>Quantity</td>
						<td>:</td>
						<td><input type="text" name="qtyFood"></td>
					</tr>
					<tr>
						<td>Choose a product (DRINK)</td>
						<td>:</td>
						<td><select name="drink" onchange="e()">
								<option>Select</option>
								<option value="1.00">Ice Lemon Tea</option>
								<option value="1.20">Milo Ice</option>
								<option value="1.50">Orange Juice</option>
							</select>
						</td>
					</tr>		
					<tr>
						<td>Item Price (DRINK)</td>
						<td>:</td>
						<td><input type="text" name="priDrink" readonly>
							<input type="hidden" name="hdDrink">
						</td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td>:</td>
						<td><input type="text" name="qtyDrink"></td>
					</tr>
					<tr>
						<td>Payment Method</td>
						<td>:</td>
						<td><p><input type="radio" name="payMet" value="Cash">Cash</p>
							<p><input type="radio" name="payMet" value="Debit Card">Debit Card</p>
							<p><input type="radio" name="payMet" value="Credit Card">Credit Card</p>
						</td>
					</tr>
					
					<tr><td><input class= "btnSub" type="submit" value="PAY"></td></tr>
					
				</table>
			</form>
		<br>
			<form method="post" action="customerMain.jsp">
				<input class="btnback" type="submit" value="Back">
			</form>
	
		</div>
			<form method="post" action="customerMain.jsp">
				<input class="btnSign" type="submit" value="Sign Out">
			</form>
	</body>
</html>