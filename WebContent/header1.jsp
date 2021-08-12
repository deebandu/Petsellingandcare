<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<title>Header</title>
</head>
<body>

  
        <nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">
            <a class="navbar-brand ml-4" href="#">DogZilla</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <% 

          
            if(session.getAttribute("email") == null)
            {
            	request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
            }
            String email=session.getAttribute("email").toString();
            
            %>
              <ul class="navbar-nav ml-auto">
              <li class="nav-item mr-4">
                  <a class="nav-link" href="#"><i class="fas fa-user"></i> <%out.println(email); %></a>
                </li>
                <li class="nav-item mr-4">
                  <a class="nav-link" href="HomePage1.jsp">Home</a>
                </li>
                <li class="nav-item mr-4">
                  <a class="nav-link" href="AllProduct.jsp">All</a>
                </li>
                <li class="nav-item mr-4">
                  <a class="nav-link" href="Dogs.jsp">Dogs</a>
                </li>
                <li class="nav-item mr-4">
                  <a class="nav-link " href="Foodproduct.jsp">Food Products</a>
                </li>
                <li class="nav-item mr-4">
                    <a class="nav-link " href="Accessories.jsp">Accessories</a>
                  </li>   
                   
                  <li class="nav-item mr-4">
                    <a class="nav-link " href="Cart1.jsp">Cart</a>
                    <li class="nav-item mr-4">
                    
                      <a class="nav-link " href="Logout.jsp">
                        <button style="
                        padding: 0px 5px;
                        font-size: 15px;
                        color: floralwhite;
                        background-color: rgb(73, 82, 73);">Logout</button>
                      </a>
                  </li>   
                <li class="nav-item m4-5">
                 <form class="form-inline" action="searchHome.jsp" method="post">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search" name="search">
                        <button class="btn btn-success" type="submit">Search</button>
                      </form>              
                </li> 
              </ul>
            </div>  
          </nav> 
       
</body>
</html>