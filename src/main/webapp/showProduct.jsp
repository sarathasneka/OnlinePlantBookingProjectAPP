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

table, tr, td,th {
  border: 5px solid black;
  border-collapse: collapse;
}
body{
       
    background-color:pink;
    background-repeat:no repeat;
    background-size: cover;
    }
td{
 font-size: 20px;
}    
.searchbar {
	position: relative;
	top: 0px;
	left: 1050px;
}
</style>
</head>
<body>
<h1 style="text-align: center;"> Show Plant</h1>
<div class="searchbar">
<form action="SearchProductController">
<label for="plan"></label> <input type="text" name="search"	id="plan"> <input type="submit" value="search">
</form>
</div>
<form>
<table>
<tr>
<td>Plant</td>
<td>Plant Name</td>
<td>Plant Description</td>
<td>category Name</td>
<td>Plant Price</td>
<td>Update</td>
</tr>

<%ProductDaoImpl productDao=new ProductDaoImpl();
   List<Product> productList=productDao.showProduct();
 	 User user=(User)session.getAttribute("currentUser");
 
 	 for(int i=0;i<productList.size();i++)
   { 
	   Product product=productList.get(i);
	   session.setAttribute("plantName", product.getPlantName());
	   session.setAttribute("plantPrice", product.getPlantPrice());
	   session.setAttribute("plantId", product.getPlantId());

	   System.out.println(product.getImage());
	  %> 
	  <tr>
	  <td><img alt="#alter" src="images1/<%=product.getImage() %>" width="200" height="200"></td>
	  <td><%= product.getPlantName() %></td>
	  <td><%= product.getPlantDescription() %></td>
	  <td><%= product.getCategoryName() %></td>
	  <td><%= product.getPlantPrice() %></td>
	  <td><a href="updateProduct.jsp?productId=<%=product.getPlantId() %>">Update</a></td>
	   </tr>
	  <% } %>	  
	  </table>
	  </form>
	  </body>
	  </html>
	  
	  
	 	  
	  
	  
	  
   
   
   




