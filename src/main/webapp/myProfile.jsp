<%@page import="java.util.ArrayList"%>
<%@page import="com.onlineplantbooking.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineplantbooking.daoImpl.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user profile</title>
<style>
body{
    
    background-image: url("table.jpg");
    background-repeat:no repeat;
    background-size: cover;
    }
 .one{
 top :50px;
 margin-left:600px;

 } 
 .menu-bar{
    background:#ace600;
    text-align: center;
}
.menu-bar ul{
    display:inline-flex;
    list-style: none;
    color: #fff;
}
.menu-bar ul li
{
width: 100px;
margin: 15px;
padding: 4px;
}
.menu-bar ul li a{
    text-decoration:none;
    font-size: 20px;
}
    
</style>
</head>
<body>

<%
UserDaoImpl userDao=new UserDaoImpl();
int userId=(int)session.getAttribute("userId");
List<User> userList=new ArrayList<User>();
userList=userDao.myProfile(userId);


%>
<%
int i=0;
for(User showUser:userList){
	i++;
	%>
	<nav>
<div class="menu-bar">
        <ul>
            <li ><a href="homePage.jsp">HOME</a></li>
            <li><a href="aboutus.jsp">ABOUT</a></li>
            <li><a href="contactus.jsp">CONTACT</a></li>
            <li><a href="buyProduct.jsp">BUY</a>       
    </ul>
    </div>

</nav>
	<div class="one">
    <h1 style="text-align: left;">My Profile</h1>
	<b>Name:</b><%=showUser.getName() %><br><br>
	<b>EmailId:</b><%= showUser.getEmailId() %><br><br>
	<b>Password:</b><%= showUser.getPassword() %><br><br>
	<b>Mobile Number:</b><%=showUser.getMobileNumber() %><br><br>

	<b>Wallet:</b><%= showUser.getWallet() %><br><br>
	<a href="rechargeWallet.jsp">Recharge Wallet</a>
	</div>
<%
}

%>


</body>
</html>