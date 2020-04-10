<%@page import="javax.activation.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="main.css"/> 
    </head>
    <body>
        <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
                <h2><br><br>CAR BOOKED</h2>
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
                String car=request.getParameter("carid");
                Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement welcome=conn.createStatement();
        ResultSet welogin=welcome.executeQuery("select * from customer where customerid='"+uid+"';");
        if(welogin.next()){
        ResultSet rs=welcome.executeQuery("select * from cars where carid='"+car+"';");
        if(rs.next()){
            Statement check=conn.createStatement();
            ResultSet rcheck=check.executeQuery("select * from orderdetails where customerid='"+uid+"';");
            if(rcheck.next()){
                %><script>
                alert("ALREADY BOOKED ONE CAR");
    window.location.href="welcome.jsp";
                </script><%
            }else{
            PreparedStatement pst=conn.prepareStatement("insert into orderdetails(orderid,customerid,carid,brand,model,price,mileage,cc,seatings,fuel,images,AvailInsurance) values(?,?,?,?,?,?,?,?,?,?,?,?);");
       Random r1=new Random(System.currentTimeMillis());
        String orderid="";
        for(int i=0;i<=6;i++){
           orderid+=String.valueOf(r1.nextInt(8));}
            pst.setString(1,orderid);
            pst.setString(2,uid);
            pst.setString(3,rs.getString(1));
            pst.setString(4,rs.getString(2));
            pst.setString(5,rs.getString(3));
            pst.setString(6,rs.getString(4));
            pst.setString(7,rs.getString(5));
            pst.setString(8,rs.getString(6));
            pst.setString(9,rs.getString(7));
            pst.setString(10,rs.getString(8));
            pst.setString(11,rs.getString(10));
            pst.setString(12,"INSURANCE NOT DONE");
            int booked=pst.executeUpdate();
            if(booked!=0){
                %><script>
                alert("CAR BOOKED");
                </script><%
                  Statement test=conn.createStatement();
            ResultSet carst=test.executeQuery("select * from cars where carid='"+rs.getString(1)+"';");
                if(carst.next()){
                     %><table border="1"><%
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
                </details></td><td class='allcars'><center><a href="payment.jsp?carid=<%=carst.getString(1)%>&orderid=<%=orderid%>"><button class="book">CONFIRM AND PAY BY COD</button></a></center><br><br>
                <center><a href="deleteorder.jsp?orderid=<%=orderid%>"><button class="book">CANCEL ORDER</button></a></center>
                <br><br><center><a href="testdrive.jsp?carid=<%=rs.getString(1)%>"><button class="book">BOOK FOR TEST DRIVE</button></a></center>
                </td>
                </tr>
            <%
            }
%></table><%       
            }
        }}}else{
%><script>
                alert("Session Expired....\n\
            Please Login to Continue....");
                window.location="login.html";
                </script><%
}
            }catch(Exception e){
                
            }
            %>
    </body>
</html>
