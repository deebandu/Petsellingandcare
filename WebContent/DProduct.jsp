
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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Product Details</title>
</head>
<body style="background-color:#4e657a"> 

<%@ include file="AdminHeader.html" %>
          

<h1 style="text-align:center;color:gainsboro;margin:100px 0 0 0">Product Details</h1>


<div style="width:100%;height:400px;overflow-y:scroll;display:flex;justify-content:center;margin-top:30px">
<table  border="3">
<tr style="bgcolor:red;">
<td>Product Id</td>
<td>Product name</td>
<td>Price</td>
<td>Content</td>
<td>Category</td>
<td>Image</td>
<td>Quantity</td>
<td>Edit</td>
<td>Remove</td>
</tr>
<%@page import="java.sql.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");	
	Statement st=con.createStatement();
	String sql ="select * from products";
	ResultSet rs = st.executeQuery(sql);
	while(rs.next()){
%>
<tr>
<td><%=rs.getString("P_Id") %></td>
<td><%=rs.getString("P_name") %></td>
<td><%=rs.getString("P_price") %></td>
<td><%=rs.getString("P_info") %></td>
<td><%=rs.getString("P_category") %></td>
<td><%=rs.getString("P_image") %></td>
<td><%=rs.getString("P_quentity") %></td>
<td><a href="update.jsp?P_Id=<%=rs.getString("P_Id")%>"><i class="fa fa-pencil icon"></i></a>
</td>
<td><a href="delete.jsp?P_Id=<%=rs.getString("P_Id") %>"><i class="fa fa-trash"></i></a>
	</td>
</tr>
<%
}
} 
catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>