<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN</title>
    </head>
    <body>
        <link rel="stylesheet" href="main.css">
        <style>
            #brandings
            {
                width:100%;
                margin: 0;
            }        
        .ord{
            width: 10%;
        }
        </style>
        <%
            try{
                HttpSession userid=request.getSession();
            String uid="";
            if(userid!=null){
            uid=(String)userid.getAttribute("username");}
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement welcome=conn.createStatement();
        ResultSet rs=welcome.executeQuery("select * from admin where id='"+uid+"';");
        if(rs.next()){
            Statement cus=conn.createStatement();
            ResultSet cusrs=cus.executeQuery("select * from customer;");
        %><div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
                <h2><br><br>WELCOME ADMIN</h2></div>
         <div id="pagebutton">
             <a href="logout.jsp"><button class="menu__link">LOGOUT</button></a>
		<a href="#about"><button class="menu__link">VIEW TEST DRIVE BOOKINGS</button></a>
		<a href="#brandings"><button class="menu__link">VIEW ORDER DETAILS</button></a>
                <a href="#maincars"><button class="menu__link">VIEW CARS</button></a>
		<a href="#content"><button class="menu__link">CUSTOMER DETAILS</button></a>
				</div><br><br>
                                <div id="content"><center><table border="1" style="padding-bottom: 100px;">
                                            <caption><h3>CUSTOMER DETAILS</h3></caption>
     <tr><th>CUSTOMER ID</th><th>NAME</th><th>PHONE NO</th><th>EMAIL</th></tr><%
     while(cusrs.next()){
         %><tr><td><%=cusrs.getString(1)%></td>
         <td><%=cusrs.getString(2).toUpperCase()%></td>
         <td><%=cusrs.getString(4)%></td>
         <td><%=cusrs.getString(5)%></td>
     </tr><%
     }    
     %></table></center></div>
            <div id="maincars"><center id="brand"><b><h2>VIEW AVAILABLE CARS</h2></b></center><%
                                       ResultSet carst=welcome.executeQuery("select * from cars;");
            %><table border="1"><%
            while(carst.next()){
            %><tr><td class="allcars">
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
                </tr>
            <%
            }
%></table></div><div id="brandings">
    <center id="brand"><b><h2>VIEW ORDER DETAILS</h2></b></center>
    <% ResultSet order1=welcome.executeQuery("select * from orderdetails;");
                                       if(order1.next()){
                                           ResultSet order=welcome.executeQuery("select * from orderdetails;");
            %><table border="1" style="width:100%;">
                <tr>
<th>ORDER ID</th><th>CUSTOMER ID</th><th>INSURANCE AVAILED</th><th>CAR ID</th><th>BRAND</th><th>MODEL</th>
<th>PRICE</th><th>IMAGES</th><th>MANAGE ORDER</th>
                </tr>            
                <%
            while(order.next()){
                %><tr>
                    <td class="ord"><%=order.getString(1)%></td>
                    <td class="ord"><%=order.getString(2)%></td>
                    <td class="ord"><%=order.getString(3)%></td>
                    <td class="ord"><%=order.getString(4)%></td>
                    <td class="ord"><%=order.getString(5)%></td>
                    <td class="ord"><%=order.getString(6)%></td>
                    <td class="ord"><%=order.getString(7)%></td>
                    <td class="imag"><img src="images/<%=order.getString(12)%>" style="height: 300px; width: 100%;"></td>
                    <td class="ord"><a href="deletecarorder.jsp?orderid=<%=order.getString(1)%>"><button style="height:40px;" class="book">DELETE ORDER</button></a></td>
</tr><%
            }
%></table>
<%
    }else{

%><h3><b><center>NO CAR BOOKED</center></b></h3><%
}%>
</div><div id="about"><center id="brand"><b><h2>VIEW TEST DRIVE BOOKINGS</h2></b></center>
     <%
                                       ResultSet test1=welcome.executeQuery("select * from testdrive;");
                                       if(test1.next()){
                                     ResultSet test=welcome.executeQuery("select * from testdrive;");       
            %><table border="1">
                <tr>
    <th>TESTDRIVE ID</th><th>CUSTOMER ID</th><th>CAR ID</th><th>BRAND</th><th>MODEL</th>
<th>DATE</th><th>IMAGES</th><th>MANAGE BOOKINGS</th>
                </tr>            
                <%
            while(test.next()){
                %><tr>
                    <td class="ord"><%=test.getString(1)%></td>
                    <td class="ord"><%=test.getString(2)%></td>
                    <td class="ord"><%=test.getString(3)%></td>
                    <td class="ord"><%=test.getString(5)%></td>
                    <td class="ord"><%=test.getString(6)%></td>
                    <td class="ord"><%=test.getString(4)%></td>
                    <td class="imag"><img src="images/<%=test.getString(12)%>" style="height: 300px; width: 100%;"></td>
                    <td class="ord"><a href="deletetestdrive.jsp?testid=<%=test.getString(1)%>"><button class="book" style="height:40px;">DELETE BOOKING</button></a></td>
</tr>
            <%
            }
%></table>
<%}else{
%><h3><b><center>NO APPOINTMENT BOOKED</center></b></h3><%
}%></div><div id="footer"><center><h2>&copy; CAR ZONE INC.</h2></center></div>
<div id="goto"><span><a href="#top1"><img class="goto" src="images/gototop.jpg" height="90" width="90" style="float: right;"/></a></span></div>            <%
}else{
%><script>
                alert("Session Expired....\n\
            Please Login to Continue....");
                window.location="adminlogin.html";
                </script><%
}
            }catch(Exception e){
                out.println(e.getMessage());
            }
            %>
    </body>
</html>
