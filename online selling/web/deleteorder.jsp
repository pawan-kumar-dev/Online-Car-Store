<%-- 
    Document   : deleteorder
    Created on : Feb 11, 2020, 5:46:25 PM
    Author     : pc
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN ORDER DETAILS</title>
    </head>
    <body>
        <%
try{
    HttpSession userid=request.getSession();
            String uid="";
            if(userid!=null){
            uid=(String)userid.getAttribute("username");}
            String orderid=request.getParameter("orderid");
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement welcome=conn.createStatement();
        ResultSet welogin=welcome.executeQuery("select * from customer where customerid='"+uid+"';");
        if(welogin.next()){
            ResultSet order=welcome.executeQuery("select * from orderdetails where orderid='"+orderid+"';");
            if(order.next()){
                PreparedStatement pst=conn.prepareStatement("delete from orderdetails where orderid='"+orderid+"';");
                int deleteorder=pst.executeUpdate();
                if(deleteorder!=0){
                    %><script>
                alert("ORDER CANCELLED");
                window.location.href="welcome.jsp";
                </script><%
                }
            }
        }else{
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
    </body>
</html>
