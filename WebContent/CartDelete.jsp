<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("P_Id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling", "root", "rat");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM Cart WHERE cartPro_Id="+id);
if(i>0)
{
RequestDispatcher rd=request.getRequestDispatcher("/Cart1.jsp");
rd.forward(request, response);
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>