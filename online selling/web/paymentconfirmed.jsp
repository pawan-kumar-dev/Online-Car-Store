<%-- 
    Document   : paymentconfirmed
    Created on : Feb 10, 2020, 8:32:27 PM
    Author     : pc
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAYMENT CONFIRMED</title>
        <link rel="stylesheet" href="main.css"/>
    </head>
    <body>
        <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
<h2><br><br>PAYMENT CONFIRMATION</h2>
        </div>
        <div style="background-color:burlywood; width: 100%; height: 50px; padding-top: 10px;">
            <a href="welcome.jsp"><button class="btd">YOUR<br>DASHBOARD</button></a>&nbsp;  
        <a href="viewcar.jsp"><button class="btd">VIEW ALL<br>CARS</button></a>&nbsp;
        <a href="viewbrand.jsp"><button class="btd">VIEW ALL<br>BRANDS</button></a>&nbsp;
        <a href="searchforcar.jsp"><button class="btd">SEARCH CAR<BR>BY PRICE</button></a>&nbsp;
        <a href="details.jsp"><button class="btd">VIEW<br>DETAILS</button></a>&nbsp;
        <a href="logout.jsp"><button class="btd">LOGOUT<br>HERE</button></a>&nbsp;
        </div>
        <%
            try{
               HttpSession userid=request.getSession();
            String uid="";
            if(userid!=null){
            uid=(String)userid.getAttribute("username");}
String payid=request.getParameter("payid");
                Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement welcome=conn.createStatement();
        ResultSet welogin=welcome.executeQuery("select * from customer where customerid='"+uid+"';");
        if(welogin.next()){
        ResultSet pay=welcome.executeQuery("select * from payment where paymentid='"+payid+"';");
        if(pay.next()){
        %><div id='content'><h2><b>PAYMENT CONFIRMED AND THE CAR WILL GET DELIVERED TO YOUR REGISTERED ADDRESS
            WITHIN 2 To 3 DAYS.</b></h2><%
            %><center><table><tr><td>
                            <img class="imag" src="images/<%=pay.getString(13)%>" style="height: 300px; width: 300px;"></td>
                        <td>BRAND : <%=pay.getString(6)%><br>
                            MODEL : <%=pay.getString(7)%><br>
                            PRICE :<img src="http://i.stack.imgur.com/nGbfO.png" width="8" height="10"><%=pay.getString(8)%> <br>
                            MILEAGE : <%=pay.getString(9)%><br>
                            CC : <%=pay.getString(10)%><br>
                            SEATING : <%=pay.getString(11)%><br>
                FUEL TYPE : <%=pay.getString(12)%></td></tr>
     <%       }
     %></table></center><br><br>
     <a href="finaldetails.jsp"><center><button class="book" style="width:50%;">VIEW FINAL ORDER DETAILS</button></center></a><br>
     <a href="insurance.jsp?orderid=<%=pay.getString(4)%>"><center><button class="book" style="width:50%;">AVAIL CAR INSURANCE</button></center></a></div><%
        }
            }catch(Exception e){
                out.println(e.getMessage());
            }
            %>
        <div id="footer"><center><h2>&copy; CAR ZONE INC.</h2></center></div>    
    </body>
</html>
