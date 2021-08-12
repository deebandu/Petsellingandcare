<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
</head>
<body>
   
         
    <%@ page import="java.sql.*" %>
    <%
    String pn=request.getParameter("pname");
    int pr=Integer.parseInt(request.getParameter("price"));
	String in=request.getParameter("info");
	String ctg=request.getParameter("catg");
	String im=request.getParameter("img");
	String qt=request.getParameter("qty");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");
	PreparedStatement pst=con.prepareStatement("insert into products(P_name,P_price,P_info,P_category,P_image,P_quentity) values(?,?,?,?,?,?);");

	pst.setString(1, pn);
	pst.setInt(2, pr);
	pst.setString(3, in);
	pst.setString(4, ctg);
	pst.setString(5, im);
	pst.setString(6, qt);
	
	int i=pst.executeUpdate();
	if(i>0)
	{
		response.sendRedirect("Addproduct.html");
		
	}
    
    %>
    
    
    
</body>
</html>