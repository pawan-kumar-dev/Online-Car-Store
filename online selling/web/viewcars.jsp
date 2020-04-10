<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEW CARS</title>
        <link rel="stylesheet" href='main.css'/>
    </head>
    <body>
        <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
<h2><br><br>VIEW CARS</h2>
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
                String car="";
            String name=request.getParameter("brands");
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
              Statement cars=conn.createStatement();
            ResultSet search=cars.executeQuery("select * from cars;");
            while(search.next()){
            car=search.getString(2)+" "+search.getString(3);
            if(car.equalsIgnoreCase(name)){
Statement st1=conn.createStatement();
ResultSet rst12=st1.executeQuery("select * from cars where model='"+search.getString(3)+"';");
%><table border="1"><%
while(rst12.next()){
%>
<tr><td class="allcars">
                <img class="imag" src="images/<%=rst12.getString(10)%>"></td>
                <td class="allcars">BRAND : <%=rst12.getString(2)%></td>
                <td class="allcars">MODEL : <%=rst12.getString(3)%></td>
                <td id="cardet">
                <details><summary>VIEW MORE DETAILS</summary>
                    <table border="1" style="width:100%;"><TR><TD>PRICE  </TD><td><img src="http://i.stack.imgur.com/nGbfO.png" width="8" height="10"><%=rst12.getString(4)%></td></TR> 
                        <tr><td>MILEAGE</td><td>  <%=rst12.getString(5)%></td></tr>
                        <tr><td>CC</td><td>  <%=rst12.getString(6)%></td></tr>
                        <tr><td>SEATING</td><td>  <%=rst12.getString(7)%></td></tr>
                        <tr><td>FUEL TYPE</td><td>  <%=rst12.getString(8)%></td></tr></table>
                </details></td><td class='allcars'><center><a href='book.jsp?carid=<%=rst12.getString(1)%>'><button class="book">BUY NOW</button></a></center>
                <center>OR</center><a href="testdrive.jsp?carid=<%=rst12.getString(1)%>"><button class="book">BOOK FOR TEST DRIVE</button></a></center>
                </td>
                </tr>
                <%       }%></table><%
}}}catch(Exception e){
out.println(e.getMessage());
}
     %></table><%
            %>
    <div id="footer"><center><h2>&copy; CAR ZONE INC.</h2></center></div>
    </body>
</html>
