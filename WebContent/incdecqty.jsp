<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int Quantity=0;
int final_total=0;

try
{
	 Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select * from cart where email='"+email+"' and cartPro_Id='"+id+"' and Cr_address is NULL");
     while(rs.next())
     {
    	 price=rs.getInt("price");
    	 total=rs.getInt("total");
    	 Quantity=rs.getInt("quantity");
     }
     if(Quantity==1 && incdec.equals("dec"))
     {
    	 request.getRequestDispatcher("/Cart1.jsp").forward(request, response);
     }
     else if(Quantity !=1 && incdec.equals("dec") )
     {
    	 total=total-price;
    	 Quantity=Quantity-1;
    	 st.executeUpdate("update cart set total='"+total+"', quantity='"+Quantity+"' where email='"+email+"' and cartPro_Id='"+id+"' and Cr_address is NULL");
    	 request.getRequestDispatcher("/Cart1.jsp").forward(request, response);
     }
     else
     {
    	 total=total+price;
    	 Quantity=Quantity+1;
    	 st.executeUpdate("update cart set total='"+total+"', quantity='"+Quantity+"' where email='"+email+"' and cartPro_Id='"+id+"' and Cr_address is NULL");
    	 request.getRequestDispatcher("/Cart1.jsp").forward(request, response);
     }
}
catch(Exception e)
{
	System.out.println(e);
}

%>
</body>
</html>