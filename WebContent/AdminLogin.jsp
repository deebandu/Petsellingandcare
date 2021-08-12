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
    String name=request.getParameter("uname");
	String pass=request.getParameter("pass2");
	
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");
		PreparedStatement pst=con.prepareStatement("Select * from alogin where A_name=? and A_password=?");
		pst.setString(1, name);
		pst.setString(2, pass);
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
			session.setAttribute("name", name);
			request.getRequestDispatcher("/Ahome.jsp").forward(request, response);
			
		}
		else
		{
			
			request.getRequestDispatcher("/AdminLoginDesign.jsp").forward(request, response);
		}
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
			request.getRequestDispatcher("/AdminLoginDesign.jsp").forward(request, response);

	
	}

	
    
    
    %>
</body>
</html>