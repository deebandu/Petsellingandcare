<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
*{
margin:0;
padding:0;
}
 h1{
            text-align: center;
            margin: 60px 0px;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            text-decoration: solid;
            font-size: 40px;
        }

.container{
margin : 30px;

}
</style>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>All Products</title>
</head>
<body>
 
 <%@ include file="header1.jsp" %>
          
          <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
          <li data-target="#demo" data-slide-to="0" class="active"></li>
          <li data-target="#demo" data-slide-to="1"></li>
          <li data-target="#demo" data-slide-to="2"></li>
        </ul>
        
        <!-- The slideshow -->
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="https://images.unsplash.com/photo-1580024620753-b3ed0ffed2cd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80" alt="Los Angeles" width="100%" height="600">
          </div>
          <div class="carousel-item">
            <img src="https://images.unsplash.com/photo-1570402383251-9f8a173630da?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1498&q=80" alt="Chicago" width="100%" height="600">
          </div>
          <div class="carousel-item">
            <img src="https://image.freepik.com/free-vector/animal-shelter-with-staff-volunteers-rooms-dogs-cats-vet-service-isometric-vector-illustration_1284-30389.jpg" alt="New York" width="100%" height="600">
          </div>
        </div>
        
        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>
       <h1 style="margin:0px;position:sticky;top:0;display:block;background-color:lightgray;width:100%;height:60px;z-index:9999">All</h1>
           <div class="container">
    <div class="row"> 
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

          
             <div class="col-md-3 offset-1 p-0" style="border:1px solid grey;position:relative; margin-bottom: 40px; margin-top:40px;box-shadow:5px 8px 5px 8px gray"">
             <a href="viewProduct.jsp?P_Id=<%=rs.getString("P_Id") %>" style=" text-decoration: none">
            
                 <img alt="" src="<%=rs.getString("P_image") %>" width="100%" height="250px" >
                 <div style="padding:10px 0 0 20px;font-weight:bolder">
          <%out.print(rs.getString("P_name")); %>
          </div>
          <div style="padding:0 0 0 20px">
          <% out.print(rs.getString("P_info")); %>
          </div>
          <div style="position:absolute;bottom:10px;right:16px">

           <i class="fa fa-rupee"></i> <%out.print(rs.getString("P_price")); %></div>
           </a>
           <div><a href="CartProcess.jsp?P_Id=<%=rs.getString("P_Id") %>"><button type="submit" class="btn btn-primary cart-btn-transform m-3">Add to cart</button></a></div>
          </div>
       
         
 <%
 
}
} 
catch (Exception e) {
e.printStackTrace();
}
%>
</div>
</div>
  <%@ include file="Footer1.jsp" %>
</body>
</html>