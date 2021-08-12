<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String msg=request.getParameter("msg");
if(msg.equals("dzFb"))
{
	response.sendRedirect("https://www.facebook.com/dogzillapetkennel");
}
else if(msg.equals("dzinsta"))
{
	response.sendRedirect("https://www.instagram.com/dogzilla_pet_kennel/");
}
else if(msg.equals("insta"))
{
	response.sendRedirect("https://www.instagram.com/deebandu163/");
}
else if(msg.equals("Fb"))
{
	response.sendRedirect("https://www.facebook.com/deebandu.ghosh");
}
else if(msg.equals("linkedin"))
{
	response.sendRedirect("https://www.linkedin.com/in/deebandu-ghosh-511873155/");
}
%>
</body>
</html>