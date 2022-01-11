<%@page import="com.onlineplantbooking.model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlineplantbooking.daoImpl.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
table,tr,th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
</head>
<body>
<h1>My Profile</h1>
<table>
<tr>
<td>Name</td>
<td>EmailId</td>
<td>Password</td>
<td>Phone Number</td>
<td>Address</td>
<td>Wallet</td>
</tr>
<%UserDaoImpl userDao=new UserDaoImpl();
List<User> userList=new ArrayList<User>();
int userId=(int)session.getAttribute("userId");
userList=userDao.myProfile(userId);
for(int i=0;i<userList.size();i++){
	User user=userList.get(i);
%>
<tr>
<td><%= user.getName()%></td>
<td><%= user.getEmailId() %></td>
<td><%= user.getPassword() %></td>
<td><%= user.getMobileNumber() %></td>
<td><%= user.getAddress() %></td>

</tr>
<%} %>
</table>
</body>
</html>
</body>
</html>