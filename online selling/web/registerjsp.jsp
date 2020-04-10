<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.util.Random,javax.activation.*,javax.servlet.*,javax.mail.internet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTERING</title>
    </head>
    <body>
         <%
            try{
        String name,address,password,idtype,email,phone,aadharpan=null;
        name=request.getParameter("name");
        address=request.getParameter("add");
        password=request.getParameter("pass");
        idtype=request.getParameter("id");
        email=request.getParameter("mail");
        phone=request.getParameter("num");
        if(idtype.equalsIgnoreCase("aadhar")){aadharpan=request.getParameter("aadhar");}
       else if(idtype.equalsIgnoreCase("pan")){aadharpan=request.getParameter("pan");}
         if(name.isEmpty()|| address.isEmpty()||password.isEmpty()||idtype.equalsIgnoreCase("selectid")||email.isEmpty()||phone.isEmpty()){
        response.sendRedirect("register.html");}
Random r1=new Random(System.currentTimeMillis());
        String uid="";
        for(int i=0;i<=5;i++){
           uid+=String.valueOf(r1.nextInt(8));}
         Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/car","root","root");
        Statement chkuser=conn.createStatement();
        ResultSet chkuser1=chkuser.executeQuery("select * from customer where email='"+email+"';");
        if(chkuser1.next()){
            %><script>
                alert("Customer Already Registered....\n\
            Please Login To Continue....");
                window.location="login.html";
                </script><%
        }else{
        PreparedStatement pst=conn.prepareStatement("insert into customer(customerid,name,address,phone,email,pass,idproof,idtype) values(?,?,?,?,?,?,?,?);");
pst.setString(1,uid);
        pst.setString(2,name);
        pst.setString(3,address);
        pst.setString(4,phone);
        pst.setString(5,email);
        pst.setString(6,password);
        pst.setString(7,aadharpan);
         pst.setString(8,idtype);
        int insertdata=pst.executeUpdate();
if(insertdata!=0){
String host ="smtp.gmail.com";
             String from ="carzone.org@gmail.com";  //Your mail id
             String pass ="pawan1999";   // Your Password
             Properties props = System.getProperties();
             props.put("mail.smtp.starttls.enable", "true"); // added this line
             props.put("mail.smtp.host", host);
             props.put("mail.smtp.user", from);
             props.put("mail.smtp.password", pass);
             props.put("mail.smtp.port", "25");
             props.put("mail.smtp.auth", "true");
             String to=email;
             Session session1 = Session.getDefaultInstance(props, null);
             MimeMessage message = new MimeMessage(session1);
             message.setFrom(new InternetAddress(from));
             message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
             message.setSubject("Welcome to Car Zone");
             message.setText("Hello Customer your Registration  ID is "+uid);
             Transport.send(message, from, pass);
HttpSession registered=request.getSession();
     registered.setAttribute("username",uid);
%><script>
                alert("Customer Successfully Registered....");
                window.location="successregister.jsp";
                </script><%
}
}
        }catch(Exception e){
            out.println(e.getMessage());
        }
        %>
    </body>
</html>
