<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CAR SEARCH</title>
        <link rel="stylesheet" href="main.css"/>
    </head>
    <body>
        <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
<h2><br><br>SEARCH CARS</h2>
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
            String minp,maxp;
            minp=request.getParameter("price1");
            maxp=request.getParameter("price2");
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement st=conn.createStatement();
        ResultSet rst=st.executeQuery("select * from customer where customerid='"+uid+"';");
        if(rst.next()){
            Statement car=conn.createStatement();
            ResultSet carst=car.executeQuery("select * from cars where price>='"+minp+"' and price<='"+maxp+"';");
%><table border='1'><%while(carst.next()){ %>
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
                        <tr><td>FUEL TYPE</td><td>  <%=carst.getString(8)%></td></tr>
                        </table>
                </details></td>
                <td>
                    <a href='book.jsp?id=<%=carst.getString(1)%>'><button class="book" style="width:100%;">BOOK NOW</button></a><center>OR</center> 
                    <a href="testdrive.jsp?carid=<%=carst.getString(1)%>"><button class="book" style="width:100%;">BOOK FOR TEST DRIVE</button></a>
                </td>
                </tr>
<%
        }%></table><%
            }}catch(Exception e){
                out.println(e.getMessage());
            }
            %>
    </body>
</html>
