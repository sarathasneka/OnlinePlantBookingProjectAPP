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
<style>
<%String plantName=request.getParameter("plantName");
int price=Integer.parseInt(request.getParameter("plantPrice"));
int plantId=Integer.parseInt(request.getParameter("plantId"));
%>
</style>
<form action="InserCartServlet" >
<h2>Plant Id</h2><input type="text" value="<%=plantId %>" name="plantId"><br><br>
<h2>Plant Name</h2><input type="text" value="<%=plantName %>" name="plantname"><br><br>
<h2>Plant Price</h2><input type="text" value="<%=price %>" name="Price"><br><br>
<button type="submit"><b>submit</b></button><br><br>

</form>









</body>
</html>