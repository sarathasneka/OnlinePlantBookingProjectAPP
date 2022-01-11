<%@page import="com.onlineplantbooking.daoImpl.UserDaoImpl"%>
<%@page import="com.onlineplantbooking.model.User" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Plant Booking</title>

<style>
table,td,tr
{
border:5px solid black;
border-collapse:collapse;
}

body{
    
    background-image: url("table.jpg");
    background-repeat:no repeat;
    background-size: cover;
    }
td{
font-size= 20px;
} 

.center {
  margin-left: auto;
  margin-right: auto;
}   
</style>
</head>
<body>
<form>
<table class="center">
<tr>
<td>User Id</td>
<td>Name</td>
<td>Email Id</td>
<td>Password</td>
<td>Mobile Number</td>
<td>Address</td>
<td>Delete</td>
</tr>
<%
UserDaoImpl userDao=new UserDaoImpl();
   List<User> userList=userDao.showAllUser();

   for(int i=0;i<userList.size();i++)
   {
	  
	   User user=userList.get(i);
  
	  %> 
	  <tr>
	  <td><%= user.getUserId() %></td>
	  <td><%= user.getName() %></td>
	  <td><%= user.getEmailId() %></td>
	  <td><%= user.getPassword() %></td>
	  <td><%= user.getMobileNumber() %></td>
	  <td><%= user.getAddress() %></td>
	  <td><a href="showuser.jsp?userId=<%=user.getUserId()%>">Delete</a></td>
	   </tr>
	  <% } %>	  
	  <%  int userId=Integer.parseInt(request.getParameter("userId"));
	  userDao.deleteUser(userId); %>
	  </table>
	  </form>
</body>
</html>