<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CUSTOMER LOGIN</title>
    </head>
    <body>
         <% try{
            String uid=request.getParameter("uid");
        String password=request.getParameter("pass");
        if(uid.isEmpty()||password.isEmpty()||password.length()<8){
             response.sendRedirect("login.html");
        }else{
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement beforelogin=conn.createStatement();
        ResultSet chkbeforelogin=beforelogin.executeQuery("select * from customer where customerid='"+uid+"' and pass='"+password+"';");
        if(chkbeforelogin.next()){
            HttpSession userid=request.getSession();
            userid.setAttribute("username",uid);
             %><script>
                alert("Login Successful....");
                window.location="welcome.jsp";
                </script><%
        }else{
%><script>
                alert("Invalid Login....");
                window.location="login.html";
                </script><%
        }}}catch(Exception e){
response.sendRedirect("errorpage.html");}
    %>
    </body>
</html>
