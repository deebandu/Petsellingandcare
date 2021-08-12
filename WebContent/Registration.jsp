<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
 
    
    <%
    
    String fn=request.getParameter("fname");
	String em=request.getParameter("email");
	String pss=request.getParameter("pass1");
	int ph=Integer.parseInt(request.getParameter("phone"));
	String ct=request.getParameter("city");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");
	PreparedStatement pst=con.prepareStatement("insert into registration(C_fname,C_email,C_Password,C_mob,C_city) values(?,?,?,?,?);");

	pst.setString(1, fn);
	pst.setString(2, em);
	pst.setString(3, pss);
	pst.setInt(4, ph);
	pst.setString(5, ct);
	
	int i=pst.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("Registration.html");
		out.print("You are Successfully registered...");
		
	}
    
    %>
    
    
</body>
</html>