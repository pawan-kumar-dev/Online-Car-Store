<%-- 
    Document   : deletetestdrivecust
    Created on : Feb 12, 2020, 9:25:02 AM
    Author     : pc
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CUSTOMER DELETE TEST DRIVE</title>
    </head>
    <body>
        <%
try{
   HttpSession userid=request.getSession();
            String uid="";
            if(userid!=null){
            uid=(String)userid.getAttribute("username");}
            String testid=request.getParameter("testid");
            Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement welcome=conn.createStatement();
        ResultSet rs=welcome.executeQuery("select * from customer where customerid='"+uid+"';");
        if(rs.next()){
            ResultSet order=welcome.executeQuery("select * from testdrive where testdriveid='"+testid+"';");
            if(order.next()){
                PreparedStatement pst=conn.prepareStatement("delete from testdrive where testdriveid='"+testid+"';");
                int deleteorder=pst.executeUpdate();
                if(deleteorder!=0){
                    %><script>
                alert("APPOINTMENT DELETED");
                window.location.href="details.jsp";
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
