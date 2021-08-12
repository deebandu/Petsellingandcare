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
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("P_Id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;

int z=0;
try
{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");	
	Statement st=con.createStatement();
	String sql ="select * from products where P_Id="+product_id;
	ResultSet rs = st.executeQuery(sql);
	while(rs.next())
	{
		product_price=rs.getInt(3);
		product_total=product_price;
	}
	String sql1 ="select * from cart where cartPro_Id='"+product_id+"' and email='"+email+"'and Cr_address is NULL";
	ResultSet rs1 = st.executeQuery(sql1);
	while(rs1.next())
	{
		cart_total=rs1.getInt(4);
		cart_total=cart_total+product_total;
		quantity=rs1.getInt(2);
		quantity=quantity+1;
		z=1;
	}
	if(z==1)
	{
		st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where cartPro_Id='"+product_id+"' and email='"+email+"' and Cr_address is NULL");
		request.getRequestDispatcher("/AllProduct.jsp").forward(request, response);
	}
	if(z==0)
	{
		PreparedStatement ps=con.prepareStatement("insert into cart(email,quantity,price,total,cartPro_Id) values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setInt(2, quantity);
		ps.setInt(3, product_price);
		ps.setInt(4, product_total);
		ps.setString(5, product_id);
		ps.executeUpdate();
		request.getRequestDispatcher("/AllProduct.jsp").forward(request, response);
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>