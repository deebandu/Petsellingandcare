<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
    *{
      margin: 0;
      padding: 0;
    }
     .heading{
         
         text-align: center;
         margin: 50px 50px;
     }
     tr
     {
         font-size :larger;
         padding: 20px;
         text-align: center;
         font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        background-color:gainsboro;
         
     }
  </style>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Delivery Report</title>
</head>
<body style="background-color:#4e657a">
<%@ include file="AdminHeader.html" %>


<h1 style="text-align:center;color:gainsboro;margin:100px 0 0 0">Delivery Report</h1>


<div style="width:100%;height:400px;overflow-y:scroll;display:flex;justify-content:center;margin-top:30px">
<table  border="3">
<tr bgcolor= dodgerblue>
<td>Order Id</td>
<td>Product Name</td>
<td>Quantity</td>
<td>Total Price</td>
<td>email</td>
<td>Mobile No</td>
<td>Payment Method</td>
</tr>
<%@page import="java.sql.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");	
	Statement st=con.createStatement();
	String sql ="select * from products inner join cart on P_Id=cart.cartPro_Id and cart.Cr_address is NOT NULL ";
	ResultSet rs = st.executeQuery(sql);
	while(rs.next()){
%>
<tr>
<td><%=rs.getString("P_Id") %></td>
<td><%=rs.getString("P_name") %></td>
<td><%=rs.getString("quantity") %></td>
<td><%=rs.getString("total") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getString("Cr_mobile") %></td>
<td><%=rs.getString("Cr_paymentMethod") %></td>
</tr>
<%
}
} 
catch (Exception e) {
e.printStackTrace();
}
%>


</body>
</html>