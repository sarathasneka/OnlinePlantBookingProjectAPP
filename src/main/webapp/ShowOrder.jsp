<%@page import="com.onlineplantbooking.daoImpl.UserDaoImpl"%>
<%@page import="com.onlineplantbooking.model.User"%>
<%@page import="com.onlineplantbooking.model.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineplantbooking.daoImpl.OrdersDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>plant Booking</title>
<style>
table,tr,th, td {
  border: 5px solid black;
  border-collapse: collapse;
}
body{
    
    background-image: url("table.jpg");
    background-repeat:no repeat;
    background-size: cover;
    }
td{
font-size:150%
}    
</style>
</head>
<body>
<h1>Show Orders</h1>
<table>
<tr>
<td>User Name</td>
<td>Product Name</td>
<td>Quantity</td>
<td>Price</td>
<td>Order Date</td>
</tr>
<%OrdersDaoImpl orderDao=new OrdersDaoImpl();

User user=(User)session.getAttribute("currentUser");
List<Orders> orderList=orderDao.ShowOrder(user);
for(int i=0;i<orderList.size();i++){
	Orders order=orderList.get(i);
%>
<tr>
<td><%= order.getUser().getName()%></td>
<td><%= order.getProduct().getPlantName() %></td>
<td><%= order.getQuantity() %></td>
<td><%= order.getTotalPrice() %></td>
<td><%= order.getOrderDate() %></td>
</tr>
<%} %>
</table>
<br><br>
<strong><h2>Your Balance:</h2></strong><lable><b><%=user.getWallet() %></lable>
</body>
</html>