<%-- 
    Document   : bienvenida
    Created on : 28/08/2022, 02:51:43 PM
    Author     : nic01
--%>



<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sesion=request.getSession();

    String usuario=(String)sesion.getAttribute("user"); 
    String password = (String)sesion.getAttribute("password");
   
    
    if(usuario != null){
        out.println("<br>Existe una sesión activa con los datos:<br>");
        out.println("<br>usuario: "+usuario);
        out.println("<br>password: "+password);
      }
    else{
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        
        <style>
            body{
                background-image: url("img/background5.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                width: 100%;
            }
           
        </style>
    </head>
    <body>
        <a class="btn-floating btn-large waves-effect waves-light red right"
           href="seguridad/cerrar_sesion.jsp"><i class="material-icons">exit_to_app</i></a>
        <h1>Bienvenida.jsp</h1>
        
           
           
            <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
