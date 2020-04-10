<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGOUT</title>
    </head>
    <body>
       <%
           try{
           HttpSession uid=request.getSession();
           uid.invalidate();%>
           <script>
               alert("LOGOUT SUCCESSFUL");
               window.location.href="index.html";
           </script>
              <%
               }catch(Exception e){
out.println(e.getMessage());
}%></body>
</html>
