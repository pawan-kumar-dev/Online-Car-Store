<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <style>
            body{
                margin:0;
                width: 100%;
                background-image: url(images/audiback.jpg);
background-repeat: no-repeat;background-size:cover;
            }
            #top1{
                background-color: lightcoral;
                width: 100%;
                height: 140px;
               display: inline-block;
               text-align: center;
               font-size: 15px;
               margin-left: auto;
               margin-right: auto;
               top:0;
               z-index: 0;
            }.bt1{
               display: inline-block;
               float: right;
margin-left: 10px;
margin-right: 10px;
background-color:lightcyan;
border-radius: 8px;
height: 40px;
color:crimson;
text-decoration: solid;
    border-style: none;
cursor: pointer;outline: none;text-align: center;
            }
             h2{
                display: inline;
                text-decoration:underline solid;
                font-family:cursive;
            }
            h3{
                font-family:serif;
                text-decoration:underline;
                color:red;
                font-size:30px;
            }
            #content{border: 2px;height: 400px;
width: 400px;padding: 25px;
background-color:transparent;
border-style:outset;
box-shadow: 0px 0px 4px 4px burlywood;
 margin-right: auto;margin-left: auto;}
 .t1{font-size: 12px;padding-bottom: 8px;
margin-bottom: 15px;border:1px solid outset; 
box-shadow: 0px 0px 2px 2px whitesmoke;
width: 300px;padding-top: 10px;
border-top-style: none; border-left-style: none; border-right-style: none;
 outline: none;}
 .bt2{
background-color:lightcyan;
border-radius: 8px;
height: 40px;
width: 100px;
color:crimson;
text-decoration: solid;
    border-style: none;
cursor: pointer;outline: none;text-align: center;
            font-size: 20px;
 }
 .goto{
     border-radius: 45px;
 }</style>
    </head>
    <div id="top1">
    		<img src="images/carlogo.png" style="height: 150px; width:160px; float: left;">
           <h2><br><br>WELCOME TO ONLINE CAR STORE</h2>
            <a href="login.html"><button  class="bt1"><b>LOGIN</b></button></a>
    </div><BR><BR>
    <body>
       <%
            HttpSession registered=request.getSession();
            String uid="";
            if(registered!=null){
            uid=(String)registered.getAttribute("username");}
            try{
             Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement register=conn.createStatement();
        ResultSet showuid=register.executeQuery("select * from customer where customerid='"+uid+"';");
        if(showuid.next()){%>
        <div id="content">
            <center>
                <h2 style="color:lavender;">
                        DEAR CUSTOMER YOU ARE SUCCESSFULLY REGISTERED<br> YOUR CUSTOMER ID IS<br></h2>
                <h1 style="font-weight: bolder; text-align: center; text-decoration: blink; text-orientation: sideways-right;"><span style="color: whitesmoke;"><%=showuid.getString(1)%></span></h1>
                <h2 style="color:lavender;"><br>SEND TO YOUR REGISTERED EMAIL ID <br>USE IT TO LOGIN INTO YOUR ACCOUNT.
</h2><br><br><a href="login.html"><button value="LOGIN" class="bt2">LOGIN</button></a>
            </center>
        </div>
                <br><br><%   }        registered.removeAttribute("username");
                   registered.invalidate();
}catch(Exception e){
    }
%>
    </body>
</html>
