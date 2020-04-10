<%-- 
    Document   : viewbybrands
    Created on : Feb 8, 2020, 6:50:42 PM
    Author     : PAVAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEW CARS BY BRAND</title>
        <link rel="stylesheet" href="main.css"/>
    </head>
    <body>
        <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
<h2><br><br>VIEW CARS BY BRAND NAME</h2>
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
            String brand=request.getParameter("bname");
             Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement car=conn.createStatement();
            ResultSet carst1=car.executeQuery("select * from cars where brand='"+brand.toUpperCase()+"';");
                if(carst1.next()){
                    ResultSet carst=car.executeQuery("select * from cars where brand='"+brand.toUpperCase()+"';");
                     %><table border="1"><%
            while(carst.next()){
            %>
            <tr><td class="allcars">
                <img class="imag" src="images/<%=carst.getString(10)%>"></td>
                <td class="allcars">BRAND : <%=carst.getString(2)%></td>
                <td class="allcars">MODEL : <%=carst.getString(3)%></td>
                <td id="cardet">
                <details><summary>VIEW MORE DETAILS</summary>
                    <table border="1" style="width:100%;"><TR><TD>PRICE  </TD><td><img src="http://i.stack.imgur.com/nGbfO.png" width="8" height="10"><%=carst.getString(4)%></td></TR> 
                        <tr><td>MILEAGE</td><td>  <%=carst.getString(5)%></td></tr>
                        <tr><td>CC</td><td>  <%=carst.getString(6)%></td></tr>
                        <tr><td>SEATING</td><td>  <%=carst.getString(7)%></td></tr>
                        <tr><td>FUEL TYPE</td><td>  <%=carst.getString(8)%></td></tr></table>
                </details></td><td class='allcars'><center><a href='book.jsp?carid=<%=carst.getString(1)%>'><button class="book">BUY NOW</button></a></center>
              <center>OR</center>  <center><a href="testdrive.jsp?carid=<%=carst.getString(1)%>"><button class="book">BOOK FOR TEST DRIVE</button></a></center>
                </td>
                </tr>
            <%
            } %></table><% }else{
%><center><h2>NO CAR AVAILABLE OF <%=brand.toUpperCase()%></h2></center><%
}
%><div id="footer"><center><h2>&copy; CAR ZONE INC.</h2></center></div>
    </body>
</html>
