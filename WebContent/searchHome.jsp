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
  
<title>Search... </title>
</head>
<body>
 <%@ include file="header1.jsp" %>
 
  <%@page import="java.sql.*"%>
   <div class="container">
    <div class="row">
<%
int z=0;
try{
	String search=request.getParameter("search");
	
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");	
	Statement st=con.createStatement();
	String sql ="select * from products where P_name like '%"+search+"%' or P_category like '%"+search+"%'";
	ResultSet rs = st.executeQuery(sql);
	
	
	while(rs.next()){
		z=1;
%>

          
             <div class="col-md-3 offset-1 p-0" style="border:1px solid grey;position:relative; margin-bottom: 40px; margin-top:140px;box-shadow:5px 8px 5px 8px gray"">
             <a href="#" style=" text-decoration: none">
            
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
           <div><a href="CartProcess.jsp?P_image=<%=rs.getString("P_image") %>&P_name=<%=rs.getString("P_name") %>&P_price=<%=rs.getString("P_price") %>"><button type="submit" class="btn btn-primary cart-btn-transform m-3">Add to cart</button></a></div>
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
<% if(z==0){ %>
<h2 style="text-align:center;margin-top:140px">Nothing to Show</h2>
<% }%>
</body>
</html>