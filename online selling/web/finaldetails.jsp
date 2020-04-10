<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAYMENT DETAILS</title>
        <link rel="stylesheet" href="main.css"/>
    </head>
    <body>
        <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
<h2><br><br>BOOKING DETAILS</h2>
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
                Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement welcome=conn.createStatement();
        ResultSet welogin=welcome.executeQuery("select * from customer where customerid='"+uid+"';");
        if(welogin.next()){
            ResultSet pay=welcome.executeQuery("select * from payment where customerid='"+uid+"';");
        if(pay.next()){
            %><center id="brand"><b><h2>YOUR BOOKING DETAILS</h2></b></center>
            <table border='1'>
                <tr><th>PAYMENT ID</th><th>CUSTOMER ID</th><th>IMAGE</th><th>CAR ID</th><th>ORDER ID</th><th>PAYMENT TYPE</th>
                    <th>BRAND</th><th>MODEL</th><th>PRICE</th><th>MILEAGE</th><th>CC</th><th>SEATINGS</th><th>FUEL TYPE</th></tr>
                <%
                     ResultSet pay1=welcome.executeQuery("select * from payment where customerid='"+uid+"';");
                    while(pay1.next()){
                %><tr>
                    <td><%=pay1.getString(1)%></td>
                    <td><%=pay1.getString(2)%></td>
                    <td style="width:25%;height: 300px;"><img src='images/<%=pay1.getString(13)%>' style="width:100%;height: 300px;"></td>
                    <td><%=pay1.getString(3)%></td>
                    <td><%=pay1.getString(4)%></td>
                    <td><%=pay1.getString(5)%></td>
                    <td><%=pay1.getString(6)%></td>
                    <td><%=pay1.getString(7)%></td>
                    <td><%=pay1.getString(8)%></td>
                    <td><%=pay1.getString(9)%></td>
                    <td><%=pay1.getString(10)%></td>
                    <td><%=pay1.getString(11)%></td>
                    <td><%=pay1.getString(12)%></td>             
</tr><% }  %>
            </table><%
        }
        }else{
%><script>
                alert("Session Expired....\n\
            Please Login to Continue....");
                window.location="login.html";
                </script><%
}
}catch(Exception e){
            out.println(e.getMessage());
        }
            %>
            <div id="footer"><center><h2>&copy; CAR ZONE INC.</h2></center></div>
    </body>
</html>
