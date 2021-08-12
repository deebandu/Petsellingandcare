
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
    <title>Customer Details</title>
</head>
<body style="background-color:#4e657a"> 

<%@ include file="AdminHeader.html" %>

<h1 style="text-align:center;color:gainsboro;margin:100px 0 0 0">Customer Details</h1>


<div style="width:100%;height:400px;overflow-y:scroll;display:flex;justify-content:center;margin-top:30px">
<table  border="3">
<tr bgcolor= dodgerblue>
<td>Customer Id</td>
<td>Full Name</td>
<td>E-mail</td>
<td>Password</td>
<td>Mobile No</td>
<td>City</td>
<td>Delete</td>
</tr>
<%@page import="java.sql.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");	
	Statement st=con.createStatement();
	String sql ="select * from registration";
	ResultSet rs = st.executeQuery(sql);
	while(rs.next()){
%>
<tr>
<td><%=rs.getString("C_Id") %></td>
<td><%=rs.getString("C_fname") %></td>
<td><%=rs.getString("C_email") %></td>
<td><%=rs.getString("C_Password") %></td>
<td><%=rs.getString("C_mob") %></td>
<td><%=rs.getString("C_city") %></td>
<td><a href="Cdelete.jsp?C_Id=<%=rs.getString("C_Id") %>"><i class="fa fa-trash"></i></a>
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