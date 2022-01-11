<%@page import="com.onlineplantbooking.model.User"%>
<%@page import="com.onlineplantbooking.daoImpl.ProductDaoImpl"%>
<%@page import="java.util.List" %>
<%@page import="com.onlineplantbooking.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of products</title>


<style>
body{
    
    
    background-color: pink;
    background-repeat:no repeat;
    background-size: cover;
    }

table,th,td{
border:5px solid black;
border-collapse:collapse;
}

table {
  width: 100%;
}

td {
  height: 50px;
  font-size: 20px;
}

</style>
</head>
<body>
<form action="cartServlet" method="post">
<table align="center">
<tr>
<td>Plant</td>
<td>Plant Name</td>
<td>Plant Description</td>
<td>category Name</td>
<td>Plant Price</td>
<td>Buy Product</td>
<td>Add To Cart</td>


</tr>
<%ProductDaoImpl productDao=new ProductDaoImpl();
   List<Product> productList=productDao.showProduct();
 	//User user=(User)session.getAttribute("currentUser");
   for(int i=0;i<productList.size();i++)
   { 
	   Product product=productList.get(i);
	   session.setAttribute("plantName", product.getPlantName());
	   session.setAttribute("plantPrice", product.getPlantPrice());
	   session.setAttribute("plantId", product.getPlantId());

	  %> 
	  <tr>
	  <td><img alt="#alter" src="images1/<%=product.getImage() %>" width="200" height="200"></td>
	  <td><%= product.getPlantName() %></td>
	  <td><%= product.getPlantDescription() %></td>
	  <td><%= product.getCategoryName() %></td>
	  <td><%= product.getPlantPrice() %></td>
	  <td><a href="orderDetails.jsp?plantName=<%=product.getPlantName()%>&catName=<%=product.getCategoryName()%>">Buy</a></td>
	  <td><a href="cartInsert.jsp?plantId=<%=product.getPlantId() %>&plantName=<%= product.getPlantName() %>&plantPrice=<%=product.getPlantPrice() %>">cart</a> 
	  </tr>
	  <% } %>	  
	  </table>
	  </form>
	  </body>
	  </html>
	  
	  