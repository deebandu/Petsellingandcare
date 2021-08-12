<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
         body{
           margin: 0%;
           padding: 0%;
           background-color: lavender;
           font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;

       }
        .div1{
            margin: 150px 420px;
           padding: 60px;
           background-color: dodgerblue;
           box-shadow: 0 2px 4px rgba(0, 0, 0, 0.9);
        }
        .div1 #un,#up{
            display: block;
           box-sizing: border-box;
           margin-bottom: 20px;
           padding: 4px;
           width: 220px;
           height: 32px;
           border: none;
           border-bottom: dodgerblue;
           font-family: 'Roboto', sans-serif;
           font-weight: 400;
           font-size: 15px;
           transition: 0.2s ease;
        }
        .div1 #log{
            margin: 10px 0px;
           height: 40px;
           width: 120px;
           font-size: 18px;
           font-weight: bold;
           color: floralwhite;
           background-color: rgb(73, 82, 73);
        }


    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Login</title>
<script type="text/javascript">
window.history.forward();
function noback()
{window.history.forward();}
setTimeout("preventBack()", 0);  
window.onunload = function () { null };</script>
</head>
<body >
<%-- <%  response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate");
%> --%>
<%  if(session.getAttribute("email") !=  null)
{
	request.getRequestDispatcher("/HomePage1.jsp").forward(request, response);
} %>
<div class="div1">
       <form action="login.jsp" method="post">
        <input id="un" type="email" placeholder="email" name="email" required pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
        <input id="up" type="password" placeholder="Password" name="pass2" required><br>
        <button type="submit">Login</button>
        </form>
       <%
       String msg=request.getParameter("msg");
       if("notexit".equals(msg))
       {
    	   %>
        <br>
         <h4 style="text-align:center">Email or Password Incorrect</h4>
         <% }
      
       if("invalid".equals(msg))
       {
       
       %>
         <br>
         <h4 style="text-align:center">Some thing went wrong! Try Again</h4>
         <%  }  %>
    </div>
   
</body>
</html>