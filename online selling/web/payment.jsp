<%-- 
    Document   : payment
    Created on : Feb 10, 2020, 8:05:15 PM
    Author     : pc
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAYING</title>
    </head>
    <body>
        <%
             try{
                 HttpSession userid=request.getSession();
            String uid="";
            if(userid!=null){
            uid=(String)userid.getAttribute("username");}
                String carid=request.getParameter("carid");
                String orderid=request.getParameter("orderid");
                Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement welcome=conn.createStatement();
        ResultSet welogin=welcome.executeQuery("select * from customer where customerid='"+uid+"';");
        if(welogin.next()){
        ResultSet rs=welcome.executeQuery("select * from cars where carid='"+carid+"';");
        if(rs.next()){
            ResultSet order=welcome.executeQuery("select * from orderdetails where orderid='"+orderid+"';");
            if(order.next()){
                PreparedStatement pst=conn.prepareStatement("insert into payment(paymentid,customerid,carid,orderid,paytype,brand,model,price,mileage,cc,seatings,fuel,images) values(?,?,?,?,?,?,?,?,?,?,?,?,?);");
       Random r1=new Random(System.currentTimeMillis());
        String payid="";
        for(int i=0;i<=6;i++){
           payid+=String.valueOf(r1.nextInt(8));}
            pst.setString(1,payid);
            pst.setString(2,uid);
            pst.setString(3,carid);
            pst.setString(4,orderid);
            pst.setString(5,"CASH ON DELIVERY");
            pst.setString(6,order.getString(5));
            pst.setString(7,order.getString(6));
            pst.setString(8,order.getString(7));
            pst.setString(9,order.getString(8));
            pst.setString(10,order.getString(9));
            pst.setString(11,order.getString(10));
            pst.setString(12,order.getString(11));
            pst.setString(13,order.getString(12));
            int con=pst.executeUpdate();
            if(con!=0){
               %><script>
                window.location="paymentconfirmed.jsp?payid=<%=payid%>";
                </script><%
            }
            }
        }
        }

}catch(Exception e){
            out.println(e.getMessage());
        }
            %>
    </body>
</html>
