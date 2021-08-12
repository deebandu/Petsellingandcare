<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
window.history.forward();
function noback()
{window.history.forward();}

</script>

<meta charset="ISO-8859-1">
<title>Login</title>

</head>
<body>
 <%-- <%  response.setHeader("Cache-Control", "No-cache, no-store, must-revalidate"); 

 %> --%>
    <%@ page import="java.sql.*" %>
    <% 
    String email=request.getParameter("email");
	String up=request.getParameter("pass2");
	
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");
		PreparedStatement pst=con.prepareStatement("Select * from Registration where C_email=? and C_Password=?");
		pst.setString(1, email);
		pst.setString(2,up);
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
			session.setAttribute("email", email);
			request.getRequestDispatcher("/HomePage1.jsp").forward(request, response);
			
		}
		else
		{
			
			request.getRequestDispatcher("/logindesign.jsp?msg=notexist").forward(request, response);
		}
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		response.sendRedirect("logindesign.jsp?msg=invalid");
	
	}

		
    
    
    %>
    
    
</body>
</html>