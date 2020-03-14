<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

		  <c:if test="${menu != null}">
		  	 <form action="update" method="post">
		  </c:if>
		  
		  <c:if test="${menu == null}">
		  	 <form action="insert" method="post">
		  </c:if>
		  
		  
	        <table border="1" cellpadding="5">
	            <caption>
		             <h2>
			              <c:if test="${menu != null}">Edit Menu</c:if>
			              <c:if test="${menu == null}">Add New Menu</c:if>
		             </h2>
	            </caption>
	            
	          <c:if test="${menu != null}">
	           		<input type="hidden" name="id" value="<c:out value='${menu.id}' />" />
	          </c:if>
	                      
	            <tr>
	                <th>Product Name: </th>
	                <td>
	                 <input type="text" name="name" size="45"
	                   value="<c:out value='${menu.productName}' />"
	                  />
	                </td>
	            </tr>
	            <tr>
	                <th>Quantity: </th>
	                <td>
	                 <input type="text" name="quantity" size="45"
	                   value="<c:out value='${menu.quantity}' />"
	                 />
	                </td>
	            </tr>
	            <tr>
	                <th>Category: </th>
	                <td>
	                 <input type="text" name="type" size="15"
	                   value="<c:out value='${menu.productCategory}' />"
	                 />
	                </td>
	            </tr>
	            <tr>
	                <th>Price: </th>
	                <td>
	                 <input type="text" name="price" size="15"
	                   value="<c:out value='${menu.productPrice}' />"
	                 />
	                </td>
	            </tr>
	            <tr>
	             <td colspan="2" align="center">
	              <input type="submit" value="Save" />
	             </td>
	            </tr>
	        </table>
	        </form>
    </div> 
	</body>
</html>