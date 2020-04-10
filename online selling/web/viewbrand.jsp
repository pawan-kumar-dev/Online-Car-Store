<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEW BRANDS</title>
        <link rel='stylesheet' href="main.css">
    </head>
    <body>
         <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
            <h2><br><br>BRANDS AVAILABLE</h2>
        </div>
         <div style="background-color:burlywood; width: 100%; height: 50px; padding-top: 10px;">
            <a href="welcome.jsp"><button class="btd">YOUR<br>DASHBOARD</button></a>    
        <a href="viewcar.jsp"><button class="btd">VIEW ALL<br>CARS</button></a>&nbsp;
        <a href="viewbrand.jsp"><button class="btd">VIEW ALL<br>BRANDS</button></a>&nbsp;
        <a href="searchforcar.jsp"><button class="btd">SEARCH<br>CAR</button></a>&nbsp;
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
            %>
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
                              <a href="viewbybrand.jsp?bname=Maruti Suzuki">
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
                                    %>
                                    <div id="footer"><center><h2>&copy; CAR ZONE INC.</h2></center></div>
    </body>
</html>
