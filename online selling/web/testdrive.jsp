<%-- 
    Document   : testdrive
    Created on : Nov 4, 2019, 9:58:25 PM
    Author     : PAVAN
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BOOK FOR TEST DRIVE</title>
        <link rel="stylesheet" href="main.css"/>
    </head>
       <style>
            form{border: 2px;height: 700px;
width: 340px;padding: 25px;
background-color:transparent;
border-style:outset;
 margin-right: auto;margin-left: auto;}
            form:hover{box-shadow: 0px 0px 4px 4px burlywood;}
        </style>
    <body>
        <%
            String carid=request.getParameter("carid");
            %>
        <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
          <h2><br><br>BOOK FOR THE DRIVE</h2>
        </div>
         <div style="background-color:burlywood; width: 100%; height: 50px; padding-top: 10px;">
            <a href="welcome.jsp"><button class="btd">YOUR<br>DASHBOARD</button></a>&nbsp;  
        <a href="viewcar.jsp"><button class="btd">VIEW ALL<br>CARS</button></a>&nbsp;
        <a href="viewbrand.jsp"><button class="btd">VIEW ALL<br>BRANDS</button></a>&nbsp;
        <a href="searchforcar.jsp"><button class="btd">SEARCH CAR<BR>BY PRICE</button></a>&nbsp;
        <a href="details.jsp"><button class="btd">VIEW<br>DETAILS</button></a>&nbsp;
        <a href="logout.jsp"><button class="btd">LOGOUT<br>HERE</button></a>&nbsp;
        </div>
    <hr><center><h3>TEST DRIVE APPOINTMENT</h3></center><hr><br>
    
    <form method="post" name="f1" style="width:340px;height: 200px;">
            <table>
        <tr>        
            <th><input class="t1" type="date" min="2020-02-14" max="2020-12-31" placeholder="ENTER DATE" name="date" required=""></th></tr>
            <th> <input type="submit" class='book' value="CONFIRM" onclick="test()" formaction="test.jsp?carid=<%=carid%>"> </th></tr>
       </table>
</form>
    </body>
</html>
