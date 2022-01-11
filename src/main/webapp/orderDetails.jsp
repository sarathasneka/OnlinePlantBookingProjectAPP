<%@page import="java.sql.ResultSet"%>
<%@page import="com.onlineplantbooking.model.*"%>
<%@page import="com.onlineplantbooking.daoImpl.*"%>
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
    
    
 .one{
 top :100px;
 margin-left:550px;

 } 

</style>

</head>
<body>
<%

User rs=(User)session.getAttribute("currentUser");
String pName=request.getParameter("plantName");
String catName=request.getParameter("catName");
ProductDaoImpl proDao=new ProductDaoImpl();
Product product=new Product(pName,catName);

ResultSet rs1=proDao.findProductId(product);
session.setAttribute("currentPlant",product);
if(rs1.next()){
%><br><br><br><br>
<div class="one">
<form action="ordersDetailServlet"  onmouseover="myFunct()">
<h1 >BUY YOUR PLANT</h1>
<label for="plantId" ><b>PlantName:</b></label>
<input type="text" value="<%=product.getPlantName() %>"><br><br>
<b>Quantity:</b><input type="number" onkeyup="myFunct()" value=1 name="quantity" id="quantity" min="1"><br><br>
<b>Address:</b><input type="text"  name="addresss"   id="address" required><br><br>
<b>Total Price:</b><input type="number"  name="total" id="price"><br><br>
<br>
<button type="submit" id="submit"> Submit</button>
</form>
</div>
<script type="text/javascript">
function myFunct() {
	var count=document.getElementById("quantity").value;
	var totalPrice=document.getElementById("price");
	console.log(count)
	totalPrice.value=count*<%=rs1.getInt(2)%>;
	console.log(totalPrice.value);
	
}

<%}%>

</script>
</body>
</html>