<%-- 
    Document   : searchforcar
    Created on : Nov 4, 2019, 9:56:28 PM
    Author     : PAVAN
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEARCH FOR CAR</title>
        <link rel='stylesheet' href="main.css"/>
        <style>
            form{border: 2px;height: 700px;
width: 340px;padding: 25px;
background-color:transparent;
border-style:outset;
 margin-right: auto;margin-left: auto;}
            form:hover{box-shadow: 0px 0px 4px 4px burlywood;}
        </style>
    </head>
    <body>
        <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
            <h2><br><br>SEARCH CAR</h2>
        </div>
         <div style="background-color:burlywood; width: 100%; height: 50px; padding-top: 10px;">
            <a href="welcome.jsp"><button class="btd">YOUR<br>DASHBOARD</button></a>&nbsp;  
        <a href="viewcar.jsp"><button class="btd">VIEW ALL<br>CARS</button></a>&nbsp;
        <a href="viewbrand.jsp"><button class="btd">VIEW ALL<br>BRANDS</button></a>&nbsp;
        <a href="searchforcar.jsp"><button class="btd">SEARCH CAR<BR>BY PRICE</button></a>&nbsp;
        <a href="details.jsp"><button class="btd">VIEW<br>DETAILS</button></a>&nbsp;
        <a href="logout.jsp"><button class="btd">LOGOUT<br>HERE</button></a>&nbsp;
        </div>
    <hr><center><h3>SEARCH FOR CAR</h3></center><hr><br>
    
    <form method="post" name="f1" style="width:340px;height: 200px;">
            <table>
        <tr>        
            <th><input class="t1" type="number" min="2" max="99" placeholder="ENTER MINIMUM PRICE" name="price1" required="" autocomplete="off"></th></tr>
               <tr>
                   <th><input class="t1" type="number" min="2" max="99" placeholder="ENTER MAXIMUM PRICE" name="price2" required="" autocomplete="off"></th></tr> 
               <tr>
            <th> <input type="submit" class='book' value="SEARCH" onclick="test()" formaction="search.jsp"> </th></tr>
       </table>
</form><script>
        function test(){
           var brand=document.forms["f1"]["brands"];
            var price1=document.forms["f1"]["price1"];
            var price2=document.forms["f1"]["price2"];
            if(Number(price1.value)>Number(price2.value)){
                alert("Maximum Price should me greater than Minimum Price");
            price1.value="";
        price2.value="";
    return false;}
            return true;}
       </script>
</body>
</html>
