<%@page import="com.onlineplantbooking.model.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineplantbooking.daoImpl.OrdersDaoImpl"%>
<%@page import="com.onlineplantbooking.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view cancel order</title>
<style>
table,tr,th, td {
  border: 5px solid black;
  border-collapse: collapse;
}
</style>
</head>
<body>
<table>
<tr>

<th>Plant Name</th>
<th>User Name</th>
<th>Quantity</th>
<th>Total Price</th>
<th>Address</th>
<th>Order Date</th>
<th>Order Status</th>
</tr>

<% User user=(User)session.getAttribute("currentUser");
OrdersDaoImpl orderDao=new OrdersDaoImpl();
List<Orders> orderList=orderDao.showCancelOrder(user);
for(int i=0;i<orderList.size();i++){
	Orders order=orderList.get(i);
	
%>
<tr>
<td><%=order.getProduct().getPlantName() %></td>
<td><%=order.getUser().getName() %></td>
<td><%=order.getQuantity() %></td>
<td><%=order.getTotalPrice() %></td>
<td><%=order.getAddress() %></td>
<td><%=order.getOrderDate() %></td>
<td><%=order.getOrderStatus() %></td>
</tr>

<%} %>
</table>
</body>
</html>