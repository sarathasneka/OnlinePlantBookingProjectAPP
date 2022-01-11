<%@page import="com.onlineplantbooking.daoImpl.ProductDaoImpl"%>
<%@page import="java.util.List" %>
<%@page import="com.onlineplantbooking.model.Product"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table,td,tr
{
border:1px solid black;
border-collapse:collapse;
}
</style>
</head>
<body>
<form action="updateProduct" method="post">
<table>
<tr>
<td>Plant Id</td>
<td>Plant Name</td>
<td>Plant Description</td>
<td>category Name</td>
<td>Plant Price</td>
</tr>
<%ProductDaoImpl productDao=new ProductDaoImpl();
   List<Product> productList=productDao.showProduct();
  
   for(int i=0;i<productList.size();i++)
   {
	   Product product=productList.get(i);
  
	  %> 
	   <tr>
	  <td><%= product.getPlantId() %>
	  <td><%= product.getPlantName() %></td>
	  <td><%= product.getPlantDescription() %></td>
	  <td><%= product.getCategoryName() %></td>
	  <td><%= product.getPlantPrice() %></td>
	  <td><a href="deleteProduct.jsp?plantId=<%= product.getPlantId() %>"> Delete</a></td>
	  </tr>
	  <% } %>
	  
	  <% int plantId=Integer.parseInt(request.getParameter("plantId"));
	  productDao.deleteProduct(plantId); %>                                                           
	  </table>
	  </form>
</body>
</html>