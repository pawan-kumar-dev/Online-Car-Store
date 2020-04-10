<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DASHBOARD</title>
<link rel="stylesheet" href="main.css">
<style>
    
</style>
    </head>
    <body>
         <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
<h2><br><br>WELCOME TO ONLINE CAR STORE</h2>
        </div>
        <div id="pagebutton">
            <a href="#contact"><button class="menu__link">CONTACT US</button></a>
		<a href="#about"><button class="menu__link">ABOUT</button></a>
		<a href="#brandings"><button class="menu__link">VIEW BRANDS</button></a>
                <a href="#maincars"><button class="menu__link">VIEW CARS</button></a>
		<a href="#content"><button class="menu__link">HOME</button></a>
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
            <br><br><hr><hr>
            <div id="search">
                <form name="f1"><table>
                        <tr><td>SEARCH YOUR DREAM CAR</td><td>   <input type="text" class="t1" name="brands" list="datalist" style="width:198px" required/>
                <datalist id="datalist">
                    <%
        Statement welcome1=conn.createStatement();
        ResultSet welogin1=welcome1.executeQuery("select * from cars;");
        while(welogin1.next()){
                    %><option value="<%=welogin1.getString(2)%> <%=welogin1.getString(3)%>" style="color:black;"><%=welogin1.getString(2)%> <%=welogin1.getString(3)%></option>
    <%    }  %>
                </datalist></td></tr>
                        <tr><td></td><td><input class="submit" type="submit" value="SEARCH" onclick="test()" formaction="viewcars.jsp" style="width:200px;"/></td></tr></table></form>
            </div><hr><hr>
                </div><br><br>
                <script>
                    function test(){
                        if(f1.brands.value==""){
                            alert("Please select the Car name....");
                            return false;
                        }return true;
                    }
                    
                </script>
            <div id="maincars">
             <center id="brand"><b><h2>SOME OF THE POPULAR CARS</h2></b></center>
                
                    <table><tr>
                                        <td class="carlist"><a href="viewcar.jsp?name=CITY"><img src="images/Hondacity.jpg" class="imgs"/></a></td>
                                        <td class="carlist"><a href="viewcar.jsp?name=KWID"><img src="images/renault_kwid.jpg"  class="imgs"/></a></td>
                                </tr>
                                <tr><td class="carlist"><a href="viewcar.jsp?name=SCORPIO"><img src="images/scorpio.jpg"  class="imgs"/></a></td>
                                    <td class="carlist"><a href="viewcar.jsp?name=OCTAVIA"><img src="images/Skoda_Octavia.jpg"  class="imgs"/></a>
                                    </td></tr>
                                <tr><td class="carlist"><a href="viewcar.jsp?name=POLO"><img src="images/volkswagen_polo.jpg"  class="imgs"/></a></td>
                                    <td class="carlist"><a href="viewcar.jsp?name=S60"><img src="images/Volvos60.jpg"  class="imgs"/></a>
                                    </td></tr>
                                </table>
                </div><center id="brand"><b><h2>BRANDS AVAILABLE</h2></b></center>
                            <div id="brandings">
                                <table id="brand_table">
                    <tr>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=Ford">
                                <img src="images/Fordlogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=MAHINDRA">
                                <img src="images/Mahindralogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=AUDI">
                                <img src="images/audilogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer"> <a href="viewbybrand.jsp?bname=DATSUN">
                                <img src="images/datsunlogo.jpg" class="brandimg"/></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=HONDA">
                                <img src="images/hondalogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=MARUTI SUZUKI">
                                <img src="images/marutilogo.png" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=NISSAN">
                                <img src="images/nissanlogo.png" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=RENAULT">
                                <img src="images/renaultlogo.jpg" class="brandimg"/></a>
                        </td>
                    </tr><tr>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=SKODA">
                                <img src="images/skodalogo.jpg" class="brandimg"/></a>
                        </td>
                        
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=TOYOTA">
                                <img src="images/toyotalogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=VOLKSWAGEN">
                                <img src="images/volklogo.jpg" class="brandimg"/></a>
                        </td>
                        <td class="imgcontainer"><a href="viewbybrand.jsp?bname=VOLVO">
                                <img src="images/volvologo.jpg" class="brandimg"/></a>
                        </td>
                    </tr>
                </table></div>
                <div id="gallery"></div>
                <div id="about">
                <center id="brand"><b><h2>ABOUT US</h2></b></center>
                            <div style="color:black; font-family:cursive; font-size:20px; height: 400px;">
                                <ul>
                                    <li>Welcome to the Car Zone, the online platform to buy your dream car at affordable price.</li>
                                    <li>Here we have many number of brands having a multiple number of its model cars available.</li>
                                    <li>You can easily search for the car that you are willing to buy.</li>
                                    <li>You can also book a test drive, so you could test the car and get satisfaction before buy it.</li>
                                    <li>You can also avail a discount for some cars and on the special occasions.</li>
                                    <li>Ones you are done with choosing a particular car you can either continue with the buying the car or you can opt for the test drive, that can be done by visiting the nearby store.</li>
                                    <li>After buying the car you can also claim an Insurance if you are willing to do so.</li>
                                    <li>You can pay the amount for the purchased car either through online mode or and opt for the Cash On Delivery option.</li>
                                    <li>We have a very good feedback from our customers.</li>
                                    <li>We are dealing with the car buying and selling from a very long time.</li>
                                </ul>
                            </div></div>
                <center id="brand"><b><h2>CONTACT US</h2></b></center>
                <div id="contact"><center>
                    <div id='conform' style='display:inline-block; color: black; width: 45%;
                         height: 200px;'><center><form style="padding: 11px; border-style:ridge;">
                            <table><caption><h2>LEAVE US A COMMENT</h2></caption>
                                <tr>
                                    <td>
                                        <textarea id="t1" rows="5" cols="50" placeholder="Provide a Feedback"></textarea>
                                    </td>
                                </tr>
                                <tr><td>
                                <center><input type="submit" class="submit" onclick="alert('Thank you for Feedback');window.location.href='welcome.jsp'"</center></td>
                                </tr>
                            </table>
                            </form></center></div>
                    <div id='conadd' style='display:inline-block; color:black; width: 45%; height: 200px;'>
                        <form style="padding: 41px; border-style:ridge;">
                        <table>
                            <tr><td><h2>PHONE : +91-9766236884</h2></td></tr>
                            <tr><td><h2>EMAIL : carzone.org@gmail.com</h2></td></tr>
                            <tr><td><h2>ADDRESS : NEW M.G. ROAD ,MUMBAI-87</h2></td></tr>
                            
                        </table></form>
                    </div></center>
                    
                </div><div id="footer"><center><h2>&copy; CAR ZONE INC.</h2></center></div>
<div id="goto"><span><a href="#top1"><img class="goto" src="images/gototop.jpg" height="90" width="90" style="float: right;"/></a></span></div>
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
             
         }
         %>
    </body>
</html>
