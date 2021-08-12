<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update Process</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String id=request.getParameter("p_id");
String nm=request.getParameter("pname1");
String pr=request.getParameter("price1");
String in=request.getParameter("info1");
String cat=request.getParameter("catg1");
String img=request.getParameter("imge1");
String qty=request.getParameter("qty1");


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");
String sql="Update products set P_name=?, P_price=?, P_info=?, P_category=?, P_image=?, P_quentity=? where P_Id="+id;
PreparedStatement ps=con.prepareStatement(sql);

ps.setString(1, nm);
ps.setString(2, pr);
ps.setString(3, in);
ps.setString(4, cat);
ps.setString(5, img);
ps.setString(6, qty);

int i=ps.executeUpdate();
if(i>0)
{
	RequestDispatcher rd=request.getRequestDispatcher("DProduct.jsp");
	rd.forward(request, response);
}


%>
</body>
</html>