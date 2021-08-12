<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>


img {
  max-width: 100%; }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
 
.card {
  margin-top: 50px;
  background: #eee;
  padding: 3em;
  line-height: 1.5em; }



.details {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  
</style>
<meta charset="ISO-8859-1">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>View</title>
</head>
<body style="background-color:#4e657a">
<%@ include file="header1.jsp" %>
	<div class="container" style="margin-top:10%">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
				<%@page import="java.sql.*"%>
				<% 
				
				String id=request.getParameter("P_Id");
				
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
				    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");	
					Statement st=con.createStatement();
					String sql ="select * from products where P_Id="+id;
					ResultSet rs = st.executeQuery(sql);
					
					
					while(rs.next()){
				
				
				%>
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="<%=rs.getString("P_image") %>" /></div>
						  
						</div>
						
						
					</div>
					<div class="details col-md-6">
						<h3 class="product-title"> <%out.print(rs.getString("P_name")); %></h3>
						
						<p class="product-description"><% out.print(rs.getString("P_info")); %></p>
						<h4 class="price">Price: <span><i class="fa fa-rupee"></i> <%out.print(rs.getString("P_price")); %></span></h4>
						
						<h5 class="sizes" style="margin-top:50px">
						Category: <%out.print(rs.getString("P_category")); %>	
						</h5>
						
						<div class="action">
							<a href="CartProcess.jsp?P_Id=<%=rs.getString("P_Id") %>"><button class="add-to-cart btn btn-default" type="button" style="color: floralwhite;background-color: rgb(73, 82, 73);margin-top:50px">add to cart</button></a>
							
						</div>
					</div>
			<%
				}
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
			%>		
					
				</div>
			</div>
		</div>
	</div>
	 <%@ include file="Footer1.jsp" %>
</body>
</html>