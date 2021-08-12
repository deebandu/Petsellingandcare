<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style >
body {
    background: #ddd;
    min-height: 100vh;
    vertical-align: middle;
    display: flex;
    font-family: sans-serif;
    font-size: 0.8rem;
    font-weight: bold
}

.title {
    margin-bottom: 5vh
}

.card {
    margin: auto;
    max-width: 950px;
    width: 90%;
    box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    border-radius: 1rem;
    border: transparent
}


.cart {
    background-color: #fff;
    padding: 4vh 5vh;
    border-bottom-left-radius: 1rem;
    border-top-left-radius: 1rem
}



.summary {
    background-color: #ddd;
    border-top-right-radius: 1rem;
    border-bottom-right-radius: 1rem;
    padding: 4vh;
    color: rgb(65, 65, 65)
}

.main {
    margin: 0;
    padding: 2vh 0;
    width: 100%
}



.back-to-shop {
    margin-top: 4.5rem
}


form {
    padding: 2vh 0
}

select {
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1.5vh 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247)
}

input {
    border: 1px solid rgba(0, 0, 0, 0.137);
    padding: 1vh;
    margin-bottom: 4vh;
    outline: none;
    width: 100%;
    background-color: rgb(247, 247, 247)
}



.btn {
    background-color: black;
    border-color: #000;
    
    width: 100%;
    font-size: 0.7rem;
    margin-top: 4vh;
    padding: 1vh;
    border-radius: 0
}


</style>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Cart</title>
</head>
<body>
<%@page import="java.sql.*"%>
 <% 
 String email=session.getAttribute("email").toString();
 int total=0;
 int sno=0;
 %>
<div class="card">
    <div class="row">
        <div class="col-md-8 cart">
            <div class="title">
                <div class="row">
                    <div class="col">
                        <h4><b>Shopping Cart</b></h4>
                    </div>
                   
                </div>
            </div>
 <%
 try
 {
	 Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petselling","root","rat");	
 	 Statement st=con.createStatement();
 	 String sql="select * from products inner join cart on P_Id=cart.cartPro_Id and cart.email='"+email+"' and cart.Cr_address is NULL ";
 	 ResultSet rs=st.executeQuery(sql);
 	 while(rs.next())
 	 {
 		 %>
 	
             <% sno=sno+1; %>
            <div class="row border-top border-bottom">
                <div class="row main align-items-center">
                    <div class="col-2"><img class="img-fluid" src="<%=rs.getString("P_image") %>"></div>
                    <div class="col">
                        <div class="row text-muted"><%=rs.getString("P_category")%></div>
                        <div class="row"><%=rs.getString("P_name")%></div>
                    </div>
                    <div class="col"> <a href="incdecqty.jsp?id=<%=rs.getString("P_Id") %> &quantity=dec"><i class="fa fa-minus-circle"></i></a> <%=rs.getString("quantity")%> <a href="incdecqty.jsp?id=<%=rs.getString("P_Id") %> &quantity=inc"><i class="fa fa-plus-circle"></i></a> </div>
                    <div class="col"> <i class="fa fa-rupee"></i> <%=rs.getInt("total")%> </div>
                    <div class="col"> <span class="close">
                    <a href="CartDelete.jsp?P_Id=<%=rs.getString("P_Id") %>"><i class="fa fa-trash"></i></a>
                   </span>
                    </div>
                </div>
            </div>
            	 <% 
 	 }
 
 
 %>
  <div class="col align-self-center text-right text-muted"><%out.println(sno); %> items</div>
            <div class="back-to-shop"><a href="AllProduct.jsp">&leftarrow;<span class="text-muted">Back to shop</span></a></div>
        </div>
        <% ResultSet rs1=st.executeQuery("select SUM(total) from cart where email='"+email+"' and Cr_address is NULL");
            while(rs1.next())
            {
            	total=rs1.getInt(1);
            }
            
            %>
        <div class="col-md-4 summary">
            <div>
            
                <h5><b>Summary</b></h5>
            </div>
            <hr>
            <div class="row">
                <div class="col" style="padding-left:10;"> Sub Total</div>
                <div class="col text-right"><i class="fa fa-rupee"></i>  <% out.println(total); %></div>
            </div>
            <form>
                <p>SHIPPING</p> <select>
                    <option class="text-muted">Delivery Charges - NULL</option>
                </select>
                <p>GIVE CODE</p> <input id="code" placeholder="Enter your code">
            </form>
            <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                <div class="col">TOTAL PRICE</div>
                <div class="col text-right"><i class="fa fa-rupee"></i>  <% out.println(total); %></div>
            </div><a href="cartAddress.html"> <button class="btn" style="color: floralwhite;background-color: rgb(73, 82, 73)">CHECKOUT</button></a>
        </div>
        <%
 }
 catch(Exception e)
 {
	 System.out.println(e);
 }
        
        %>
    </div>
</div>
</body>
</html>