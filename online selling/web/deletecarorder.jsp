<%-- 
    Document   : deletecarorder
    Created on : Feb 12, 2020, 12:40:05 AM
    Author     : pc
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN CAR DELETE</title>
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
        ResultSet rs=welcome.executeQuery("select * from admin where id='"+uid+"';");
        if(rs.next()){
            ResultSet order=welcome.executeQuery("select * from orderdetails where orderid='"+orderid+"';");
            if(order.next()){
                PreparedStatement pst=conn.prepareStatement("delete from orderdetails where orderid='"+orderid+"';"); 
                int deleteorder=pst.executeUpdate();
                if(deleteorder!=0){
                    %><script>
                alert("ORDER DELETED");
                window.location.href="admin.jsp";
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
