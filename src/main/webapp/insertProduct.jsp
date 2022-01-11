<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
    
    background-image: url("table.jpg");
    background-repeat:no repeat;
    background-size: cover;
    }
</style>
</head>
<body>
<form action="insertProduct" method="post" >

<h1>Add Product</h1>
<lable><h2>Enter Plant Name</h2></lable>
<input type="text" name="plantname" id="plantname" required><br><br>
<lable><h2>Enter plant description</h2></lable>
<input type="text" name="plantdescription" id="plantdescription" required><br><br>
<lable><h2>Enter plant price</h2></lable>
<input type="number" name=" plantprice" id="plantprice" min="1" required><br><br>
<lable><h2>Enter plant category</h2></lable>
<select name="category" id="category">
<option value="medicinal">medicinal</option>
<option value="bamboo" >bamboo</option>
<option value="flowering">flowering plant</option>
<option value="indoorplant">indoor plant</option>
<option value="bonsaiplant">bonsai plant</option>
</select><br><br>
<input type="file" name="plantimage">
<button type="submit">Submit</button><br>
</form>
</body>
</html>