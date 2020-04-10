<%-- 
    Document   : test
    Created on : Feb 12, 2020, 12:07:47 AM
    Author     : pc
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>APPOINTING TEST DRIVE</title>
    </head>
    <body>
       <%
            try{
             HttpSession userid=request.getSession();
            String uid="";
            if(userid!=null){
            uid=(String)userid.getAttribute("username");}
                String car=request.getParameter("carid");
                String date=request.getParameter("date");
                Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement welcome=conn.createStatement();
        ResultSet welogin=welcome.executeQuery("select * from customer where customerid='"+uid+"';");
        if(welogin.next()){
        ResultSet rs=welcome.executeQuery("select * from cars where carid='"+car+"';");
        if(rs.next()){
            Statement check=conn.createStatement();
            ResultSet rcheck=check.executeQuery("select * from testdrive where customerid='"+uid+"' and carid='"+car+"';");
            if(rcheck.next()){
                %><script>
                alert("Already Appionted for testdrive for \n\
            this car choose another car");
    window.location.href="welcome.jsp";
                </script><%
            }else{
            PreparedStatement pst=conn.prepareStatement("insert into testdrive(testdriveid,customerid,carid,date,brand,model,price,mileage,cc,seatings,fuel,images) values(?,?,?,?,?,?,?,?,?,?,?,?);");
       Random r1=new Random(System.currentTimeMillis());
        String testid="";
        for(int i=0;i<=6;i++){
           testid+=String.valueOf(r1.nextInt(8));}
            pst.setString(1,testid);
            pst.setString(2,uid);
            pst.setString(3,car);
            pst.setString(4,date);
            pst.setString(5,rs.getString(2));
            pst.setString(6,rs.getString(3));
            pst.setString(7,rs.getString(4));
            pst.setString(8,rs.getString(5));
            pst.setString(9,rs.getString(6));
            pst.setString(10,rs.getString(7));
            pst.setString(11,rs.getString(8));
            pst.setString(12,rs.getString(10));
            int booked=pst.executeUpdate();
if(booked!=0){
%><script>
                alert("TESTDRIVE APPOINTMENT BOOKED");
                window.location="details.jsp#brandings";
                </script><%
}
}}}else{
%><script>
                alert("Session Expired....\n\
            Please Login to Continue....");
                window.location="login.html";
                </script><%
}}catch(Exception e){
out.println(e.getMessage());}
            %>
    </body>
</html>
