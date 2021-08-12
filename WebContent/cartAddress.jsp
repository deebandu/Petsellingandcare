<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
      
    <%@ page import="java.sql.*" %>
    <%
    String email=session.getAttribute("email").toString();
    String addr=request.getParameter("addrs");
    String mob=request.getParameter("mob");
    String pm=request.getParameter("PM");
    
    try
    {
    	 Class.forName("com.mysql.jdbc.Driver");
    	    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");
    		PreparedStatement pst=con.prepareStatement("Update cart set Cr_address=?, Cr_mobile=?, Cr_paymentMethod=? where email='"+email+"' ");
    		
    		pst.setString(1, addr);
    		pst.setString(2, mob);
    		pst.setString(3, pm);
    		
    		int i=pst.executeUpdate();
    		if(i>0)
    		{
    			request.getRequestDispatcher("/Confirm.jsp").forward(request, response);
    		}
    		
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
    %>


</body>
</html>