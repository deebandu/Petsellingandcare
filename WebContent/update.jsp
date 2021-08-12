<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <style>

        .head{
           color: #4e657a;
           text-align:center;
           margin: 0 0 10px 0;
           font-weight: bold;
           font-size: 32px;
       }
       .details{
         margin-top: 30px;
         background: rgb(204, 194, 194);
         padding: 50px 50px;
       }
        
    </style>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Update Products</title>
</head>
<body style="background-color:#4e657a">
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("P_Id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling", "root", "rat");
Statement st=conn.createStatement();
String sql ="select * from products where P_Id="+id;
ResultSet rs = st.executeQuery(sql);
while(rs.next()){
%>

 <div class="container details" >
        <h2 class="head">Update Product</h2>
        <form action="updateProcess.jsp" method="post">
         <div class="form-group"> 
         <label for="formGroupExampleInput">Product Id</label> 
        <input class="form-control" type="text" placeholder="ID" value="<%=rs.getString("P_Id") %>" name="p_id" readonly>
       </div>
        <div class="form-group"> 
         <label for="formGroupExampleInput">Product Name</label> 
        <input class="form-control" type="text" placeholder="name" value="<%=rs.getString("P_name") %>" name="pname1">
       </div>
        <div class="form-group"> 
         <label for="formGroupExampleInput">Product Price</label> 
        <input class="form-control" type="text" placeholder="Price" value="<%=rs.getString("P_price") %>" name="price1">
       </div>
         <div class="form-group"> 
         <label for="formGroupExampleInput">Product Info</label> 
        <input class="form-control" type="text" placeholder="Information" value="<%=rs.getString("P_info") %>" name="info1">
       </div>
        <div class="form-group"> 
         <label for="formGroupExampleInput">Product Category</label> 
         <input class="form-control" type="text" placeholder="Category" value="<%=rs.getString("P_category") %>" name="catg1">
       </div>
       <div class="form-group"> 
         <label for="formGroupExampleInput">Product Image</label> 
        <input class="form-control" type="text" placeholder="Image" value="<%=rs.getString("P_image") %>" name="imge1">
       </div>
        <div class="form-group"> 
         <label for="formGroupExampleInput">Product Quantity</label> 
        <input class="form-control" type="text" placeholder="Quantity" value="<%=rs.getString("P_quentity") %>" name="qty1">
       </div>
       <br>
          <input type="submit" value="Update" style="position: absolute;left:50%;transform: translate(-50%,0);">
      </div>
        </form>
    </div>
    
   <%
}
} 
catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>