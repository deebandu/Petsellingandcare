<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


  <style>
    *{
        padding: 0;
        margin: 0;
    }
    .wrap
    {
        background-image: url("homeBG.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        height: 100vh;
    }
    
    }
      h1{
          font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
          font-size: xx-large;
          text-align: center;
          
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
    <title>Home</title>
</head>
<body>

<div class="wrap">
<%@ include file="header1.jsp" %>

       <div id="demo" class="carousel slide" data-ride="carousel">

      </div>
      <div class="center">
        <h1>Welcome To</h1>
        <h2>DogZilla pet kennel</h2>
     </div>
</div>

</body>
</html>