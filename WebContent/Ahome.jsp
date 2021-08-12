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
    .wrap
    {
        background-image: url("homeBG.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        height: 100vh;
    }
    .center{
         position: sticky;
         margin: 30px 20px;
         text-align: center;
         top: 40%;
         left: 40%;
         font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
         font-size: x-large;
         font-weight: bold;
         
     }
  </style>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<title>Admin Home</title>
</head>
<body>
<div class="wrap">
    <nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">
        <a class="navbar-brand ml-4" href="#">DogZilla</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
         <% String name=session.getAttribute("name").toString(); %>
          <ul class="navbar-nav ml-auto">
           <li class="nav-item mr-4">
                <a class="nav-link" href="#"><i class="fas fa-user"></i>  <%out.println(name); %></a>
              </li> 
            <li class="nav-item mr-4">
                <a class="nav-link" href="Addproduct.html">Add Products</a>
              </li>       
            	<li class="nav-item mr-4">
              		<a class="nav-link" href="DProduct.jsp">Product Details</a>
            	</li>
            <li class="nav-item mr-4">
              <a class="nav-link " href="CustomerDetails.jsp">Customer Detalis</a>
            </li>
            <li class="nav-item mr-4">
                <a class="nav-link " href="#">View Feedback</a>
              </li>   
              <li class="nav-item mr-4">
                <a class="nav-link " href="DeliveryReport.jsp">Delivery Report</a>
              </li>   
              <a class="nav-link " href="HomePage.jsp">
                <button style="
                padding: 0px 5px;
                font-size: 15px;
                color: floralwhite;
                background-color: rgb(73, 82, 73);">Logout</button>
              </a>
            <li class="nav-item m4-5">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-success" type="submit">Search</button>
                
            </li> 
          </ul>
        </div>  
      </nav> 
      <div class="center">
      <h1>Welcome to</h1><h2>Admin Page</h2>
    </div>
    </div>
</body>
</html>