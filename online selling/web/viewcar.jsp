<%-- 
    Document   : viewcar
    Created on : Nov 4, 2019, 12:24:36 PM
    Author     : PAVAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEW CARS</title>
        <link rel="stylesheet" href="main.css">
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
HttpSession userid=request.getSession();
            String uid="";
            if(userid!=null){
            uid=(String)userid.getAttribute("username");}
        String carname=request.getParameter("name");
         Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
         Statement welcome=conn.createStatement();
        ResultSet welogin=welcome.executeQuery("select * from customer where customerid='"+uid+"';");
        if(welogin.next()){
        Statement car=conn.createStatement();
        if(carname==null){
            ResultSet carst=car.executeQuery("select * from cars;");
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
                        <tr><td>FUEL TYPE</td><td>  <%=carst.getString(8)%></td></tr>
                        </table>
                </details></td>
                <td>
                    <a href='book.jsp?carid=<%=carst.getString(1)%>'><button class="book" style="width:100%;">BUY NOW</button></a>
                    <br><center>OR</center><a href="testdrive.jsp?carid=<%=carst.getString(1)%>"><button class="book" style="width:100%;">BOOK FOR TEST DRIVE</button></a>
                </td>
                </tr>
            <%
            }
%></table><%
        }else{
        
             ResultSet carst=car.executeQuery("select * from cars where model='"+carname+"';");
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
                        <tr><td>FUEL TYPE</td><td>  <%=carst.getString(8)%></td></tr>
                        </table>
                </details></td>
                <td>
                    <a href='book.jsp?carid=<%=carst.getString(1)%>'><button class="book" style="width:100%;">BUY NOW</button></a>
           <br><center>OR</center><a href='testdrive.jsp?carid=<%=carst.getString(1)%>'><button class="book" style="width:100%;">BOOK FOR TEST DRIVE</button></a>
                </td>
                </tr><%
            }%></table><%}
%>
       
                 <br><br>
                 <center id="brand"><b><h2>SEARCH BY BRAND</h2></b></center>
                            <div id="brandings">
                                <table id="brand_table">
                    <tr>
                        <td class="imgcontainer">
                            <a href="viewbybrand.jsp?bname=Ford">
                                <img src="images/Fordlogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer">
                            <a href="viewbybrand.jsp?bname=Mahindra">
                                <img src="images/Mahindralogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer">
                             <a href="viewbybrand.jsp?bname=Audi">
                                 <img src="images/audilogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer"> 
                            <a href="viewbybrand.jsp?bname=Datsun">
                                <img src="images/datsunlogo.jpg" class="brandimg"/></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="imgcontainer">
                             <a href="viewbybrand.jsp?bname=Honda">
                                 <img src="images/hondalogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer">
                              <a href="viewbybrand.jsp?bname=Maruti">
                                  <img src="images/marutilogo.png" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer">
                            <a href="viewbybrand.jsp?bname=Nissan">
                                <img src="images/nissanlogo.png" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer">
            <a href="viewbybrand.jsp?bname=Renault">
                <img src="images/renaultlogo.jpg" class="brandimg"/></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="imgcontainer">
                             <a href="viewbybrand.jsp?bname=Skoda">
                                 <img src="images/skodalogo.jpg" class="brandimg"/></a>
                        </td>
                        
                        <td class="imgcontainer">
                             <a href="viewbybrand.jsp?bname=Toyota">
                                 <img src="images/toyotalogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer">
                            <a href="viewbybrand.jsp?bname=Volkswagen">
                                <img src="images/volklogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer">
                            <a href="viewbybrand.jsp?bname=Volvo">
                            <img src="images/volvologo.jpg" class="brandimg"/></a>
                        </td>
                    </tr>
                </table></div>
                                
    
                      <%
        
        }
else{
%><script>
                alert("Session Expired....\n\
            Please Login to Continue....");
                window.location="login.html";
                </script><%
}
}catch(Exception e){
        out.println(e.getMessage());
        }
        %><div id="footer"><center><h2>&copy; CAR ZONE INC.</h2></center></div>
 <div id="goto"><span><a href="#top1"><img src="images/gototop.jpg" height="90" width="90" style="float: right; border-radius: 45px;"/></a></span></div>       
    </body>
</html>
