<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
window.history.forward();
function noback()
{window.history.forward();}
setTimeout("preventBack()", 0);  
window.onunload = function () { null };</script>
</head>
<body>
<% 
response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate"); 

session.invalidate(); 

request.getRequestDispatcher("/HomePage.jsp").forward(request, response);

%>
</body>
</html>