<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Admin Page</title>
<style>
body{
    
    background-image: url("table.jpg");
    background-repeat:no repeat;
    background-size: cover;
    }
 </style>
</head>
<body>
<h1>WELCOME ADMIN</h1>
<a href="showuser.jsp?userId=0"><h3>Show all user</h3></a><br>
<a href="showProduct.jsp?"><h3>Show all product</h3></a><br>
<a href="deleteProduct.jsp?plantId=0"><h3>Delete  product</h3></a><br>
<a href="insertProduct.jsp"><h3> Add New Product</h3></a>
<form action="DeleteProductServlet" >
</form>
</body>
</html>