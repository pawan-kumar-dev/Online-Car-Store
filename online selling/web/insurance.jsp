<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSURANCE</title>
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
            ResultSet rs=welcome.executeQuery("select * from orderdetails where orderid='"+orderid+"';");
            if(rs.next()){
                PreparedStatement ins=conn.prepareStatement("update orderdetails set AvailInsurance=? where orderid='"+orderid+"';");
                ins.setString(1,"INSURANCE CONFIRMED");
                int insuranced=ins.executeUpdate();
                if(insuranced!=0){
                    %><script>
                alert("INSURANCE FOR CAR IS CONFIRMED");
                window.location="welcome.jsp";
                </script><%
                }
            }
        } 
            }catch(Exception e){
                out.println(e.getMessage());
            }
            %>
    </body>
</html>
