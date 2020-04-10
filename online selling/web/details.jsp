<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DETAILS</title>
        <link rel="stylesheet" href="main.css"/>
        <style>
            #brandings{
                width: 100%;
                margin: 0;
            }
            .imag{
                width: 35%;
            }
        </style>
    </head>
    <body>
        <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
<h2><br><br>DETAILS</h2>
        </div>
        <div id="pagebutton">
		<a href="#about"><button class="menu__link">VIEW TEST DRIVE BOOKINGS</button></a>
		<a href="#brandings"><button class="menu__link">VIEW ORDER DETAILS</button></a>
                <a href="#maincars"><button class="menu__link">VIEW ORDER DETAILS</button></a>
		<a href="#content"><button class="menu__link">VIEW DETAILS</button></a>
				</div>
        <div style="background-color:burlywood; width: 100%; height: 50px; padding-top: 10px;">
            <a href="welcome.jsp"><button class="btd">YOUR<br>DASHBOARD</button></a>&nbsp;  
        <a href="viewcar.jsp"><button class="btd">VIEW ALL<br>CARS</button></a>&nbsp;
        <a href="viewbrand.jsp"><button class="btd">VIEW ALL<br>BRANDS</button></a>&nbsp;
        <a href="searchforcar.jsp"><button class="btd">SEARCH CAR<BR>BY PRICE</button></a>&nbsp;
        <a href="details.jsp"><button class="btd">VIEW<br>DETAILS</button></a>&nbsp;
        <a href="logout.jsp"><button class="btd">LOGOUT<br>HERE</button></a>&nbsp;
        </div>
         <% try{
            HttpSession userid=request.getSession();
            String uid="";
            if(userid!=null){
            uid=(String)userid.getAttribute("username");}
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement welcome=conn.createStatement();
        ResultSet welogin=welcome.executeQuery("select * from customer where customerid='"+uid+"';");
        if(welogin.next()){
%><br><br><div id="content"><table style="padding-bottom: 100px;">
                <tr><td><b><u>NAME :</u></b></td>
                    <td><b><%=welogin.getString(2).toUpperCase()%></u></b></td>
                </tr>
                <tr><td><b><u>CUSTOMER ID :</u></b></td>
                    <td><b><%=welogin.getString(1)%></u></b></td>
                </tr>
                <tr><td><b><u>PHONE NO. :</u></b></td>
                    <td><b><%=welogin.getString(4)%></u></b></td>
                </tr>
                <tr><td><b><u>EMAIL ID :</u></b></td>
                    <td><b><%=welogin.getString(5).toLowerCase()%></u></b></td>
                </tr>
                <%
                    if(welogin.getString(8).equalsIgnoreCase("aadhar")){
                    %>
                    <tr><td><b><u>AADHAR DETAIL :</u></b></td>
                    <td><b><%=welogin.getString(7)%></u></b></td>
                </tr>
                <% }
else if(welogin.getString(8).equalsIgnoreCase("pan")){
%>
                    <tr><td><b><u>PAN DETAIL :</u></b></td>
                    <td><b><%=welogin.getString(7)%></u></b></td>
                </tr>
                <%
}
                    
                %>
            </table>
          </div><div id="maincars"><center id="brand"><b><h2>VIEW ORDER DETAILS</h2></b></center>
<% String ins="",orderid="";
    ResultSet carst1=welcome.executeQuery("select * from orderdetails where customerid='"+uid+"';");
if(carst1.next()){
    ins=carst1.getString(3).toUpperCase();
    orderid=carst1.getString(1);
    ResultSet order1=welcome.executeQuery("select * from payment where customerid='"+uid+"';");
            if(order1.next()){
                %><table border="1" style="width:100%;"><tr>
<th>ORDER ID</th><th>INSURANCE AVAILED</th><th>CAR ID</th><th>BRAND</th><th>MODEL</th>
<th>PRICE</th><th>IMAGES</th>
                </tr>            
                <%
                    ResultSet order=welcome.executeQuery("select * from payment where customerid='"+uid+"';");
            while(order.next()){
                %><tr>
                    <td class="ord"><%=orderid%></td>
                    <td class="ord"><%=ins.toUpperCase()%></td>
                    <td class="ord"><%=order.getString(3)%></td>
                    <td class="ord"><%=order.getString(6)%></td>
                    <td class="ord"><%=order.getString(7)%></td>
                    <td class="ord"><%=order.getString(8)%></td>
                    <td class="imag"><img src="images/<%=order.getString(13)%>" style="height: 300px; width: 100%;"></td>
</tr><% }
%></table><%
            }else{
ResultSet ord=welcome.executeQuery("select * from orderdetails where customerid='"+uid+"';");
%><h3><b><center>CAR BOOKED BUT NOT PROCEED WITH PAYMENT</center></b></h3>
              <table border="1" style="width:100%;">
                <tr>
<th>ORDER ID</th><th>CAR ID</th><th>BRAND</th><th>MODEL</th>
<th>PRICE</th><th>IMAGES</th><th>MANAGE ORDER</th>
                </tr>            
                <%
            while(ord.next()){
                %><tr>
                    <td class="ord"><%=ord.getString(1)%></td>
                    <td class="ord"><%=ord.getString(4)%></td>
                    <td class="ord"><%=ord.getString(5)%></td>
                    <td class="ord"><%=ord.getString(6)%></td>
                    <td class="ord"><%=ord.getString(7)%></td>
                    <td class="imag"><img src="images/<%=ord.getString(12)%>" style="height: 300px; width: 100%;"></td>
                    <td class="ord"><a href="payment.jsp?carid=<%=ord.getString(4)%>&orderid=<%=ord.getString(1)%>"><button style="height:40px;" class="book">PROCEED TO PAY</button></a>
                <center>OR</center>
              <a href="deleteorder.jsp?orderid=<%=orderid%>"><button class="book">CANCEL ORDER</button></a></td>
</tr><%
            }
%></table>
<%              
}}
else{
%><h3><b><center>NO CAR BOOKED</center></b></h3><%
}
%></div><div id="brandings">
    <center id="brand"><b><h2>VIEW TEST DRIVE BOOKINGS</h2></b></center>
    <%
        ResultSet test1=welcome.executeQuery("select * from testdrive where customerid='"+uid+"';");
        if(test1.next()){
        ResultSet test=welcome.executeQuery("select * from testdrive where customerid='"+uid+"';");       
    %><center><h2><b>Visit here or Contact us</b><br>PHONE : +91-9766236884<br>EMAIL : carzone.org@gmail.com<br>ADDRESS : NEW M.G. ROAD ,MUMBAI-87</h2></center>
    <table border="1">
                <tr>
    <th>TESTDRIVE ID</th><th>CAR ID</th><th>BRAND</th><th>MODEL</th>
<th>DATE</th><th>IMAGES</th><th>MANAGE BOOKINGS</th>
                </tr>            
                <%
            while(test.next()){
                %><tr>
                    <td class="ord"><%=test.getString(1)%></td>
                    <td class="ord"><%=test.getString(3)%></td>
                    <td class="ord"><%=test.getString(5)%></td>
                    <td class="ord"><%=test.getString(6)%></td>
                    <td class="ord"><%=test.getString(4)%></td>
                    <td class="imag"><img src="images/<%=test.getString(12)%>" style="height: 300px; width: 100%;"></td>
                    <td class="ord"><a href="deletetestdrivecust.jsp?testid=<%=test.getString(1)%>"><button class="book" style="height:40px;">DELETE BOOKING</button></a></td>
</tr>
            <%
            }
%></table>
<%}else{
%><h3><b><center>NO APPOINTMENT BOOKED</center></b></h3><%
}
                                       %>
</div><div id="footer"><center><h2>&copy; CAR ZONE INC.</h2></center></div><%
         }else{
            %><script>
                alert("Session Expired....\n\
            Please Login to Continue....");
                window.location="login";
                </script><%
            }}catch(Exception e){
             
         }
         %>
<div id="goto"><span><a href="#top1"><img class="goto" src="images/gototop.jpg" height="90" width="90" style="float: right;"/></a></span></div>         
    </body>
</html>
