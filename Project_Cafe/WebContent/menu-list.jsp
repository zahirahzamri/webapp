<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
	 <title>Menu Management Application</title>
	</head>
	<body>
	
	<div align="center">
	  <h1>Menu Management</h1>
	        <h2>
	         <a href="menu-form.jsp">Add New Menu</a>
	         &nbsp;&nbsp;&nbsp;
	         <a href="menu-list.jsp">List All Menu</a>
	         
	        </h2>

	    
	        <table border="1" cellpadding="5">
	            <caption><h2>List of Menu</h2></caption>
	            <tr>
	                <th>ID</th>
	                <th>Product Name</th>
	                <th>Quantity</th>
	                <th>Category</th>
	                <th>Price</th>
	                <th>Actions</th>
	            </tr>
	            <c:forEach var="menu" items="${listMenu}">
	                <tr>
	                    <td><c:out value="${menu.productID}" /></td>
	                    <td><c:out value="${menu.productName}" /></td>
	                    <td><c:out value="${menu.quantity}" /></td>
	                    <td><c:out value="${menu.productCategory}" /></td>
	                    <td><c:out value="${menu.productPrice}" /></td>
	                    <td>
	                     <a href="edit?id=<c:out value='${menu.productID}' />">Edit</a>
	                     &nbsp;&nbsp;&nbsp;&nbsp;
	                     <a href="delete?id=<c:out value='${menu.productID}' />">Delete</a>                     
	                    </td>
	                </tr>
	            </c:forEach>
	        </table>
	    </div> 
	</body>
</html>