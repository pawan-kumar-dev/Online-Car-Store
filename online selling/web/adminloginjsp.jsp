<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN LOGGING</title>
    </head>
    <body><%
            try{
            String uid=request.getParameter("uid");
        String password=request.getParameter("pass");
        if(uid.isEmpty()||password.isEmpty()||password.length()<8){
             response.sendRedirect("adminlogin.html");
        }else{
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement beforelogin=conn.createStatement();
        ResultSet chkbeforelogin=beforelogin.executeQuery("select * from admin where id='"+uid+"' and pass='"+password+"';");
        if(chkbeforelogin.next()){
            HttpSession userid=request.getSession();
            userid.setAttribute("username",uid);
             %><script>
                alert("Admin Login Successful....");
                window.location="admin.jsp";
                </script><%
        }else{
%><script>
                alert("Invalid Login....");
                window.location="adminlogin.html";
                </script><%
        }}}catch(Exception e){out.println(e.getMessage());}
            %>
    </body>
</html>
