<%-- 
    Document   : validar_sesion
    Created on : 20/05/2022, 01:35:39 PM
    Author     : M. en E. Sergio Ernesto Moreno Soto
--%>

<%--
    PASO 2: Se integran las bibliotecas para hacer uso de las sesiones
    httpSession. 
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="clases.ConexionBD"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%--
    PASO 3: Se reciben los parametros que se ingresaron por el formulario form_sesion
--%>
    <%
        String correo_in = request.getParameter("correo");
        String pass_in = request.getParameter("pss");
        
        Connection conn = ConexionBD.conectarBaseDatos();
        Statement st = null;
        ResultSet rs = null;
        
        String query="";
        try{
            // Se crea un Statement, para realizar la consulta
            st = conn.createStatement();
            
            // Se arma el query
            query ="SELECT correo, pass FROM usuario WHERE correo = '"+correo_in+"' AND pass = '"+pass_in+"';";
            //out.println("<br>El Query Ejecutado es: <br>"+query);
            // Se ejecuta el query
            
            rs = st.executeQuery(query);
            
            String vCorreo="";
            String vPss="";
            
            while(rs.next()){
                vCorreo =rs.getString("correo");
                vPss = rs.getString("pass");
            }
                        
            out.println("form "+correo_in);
            out.println("form "+pass_in);
            out.println("query "+vCorreo);
            out.println("query "+vPss);
            
            //if(vCorreo==correo_in && vPss==pass_in){
            if(correo_in.equals(vCorreo) && vPss.equals(pass_in)){
                out.println("primier if");
                /*Se crea la sesion*/
                HttpSession sesion = request.getSession();
                /*Se agregan atributos a la sesión*/
                
                sesion.setAttribute("password",pass_in);
                sesion.setAttribute("email", correo_in);
                
                /*A manera de prueba se muestran los datos de la sesion*/

                
                String password = (String)sesion.getAttribute("password");
                String email = (String)sesion.getAttribute("email"); 
                
                out.println("<br>Se ha establecido una sesión con los siguientes datos:<br>");
                out.println("<br>password: "+password);
                out.println("<br>email: "+email);
                
                out.println("<br><br><a href='..../inicio.jsp'>Mostrar bienvenida</a>");

                }else{
                out.println("<br>La sesión no pudo ser iniciada, intente nuevamente");
                out.println("<br><br><a href='..../index.html'>Regresar a index.html</a>");

            }

                            
        }catch(Exception e){
            out.println("<br>No se pudo completar la operación: <br>"+e.getMessage()+"<br>");
            out.println(query);
        }
        /*
        * Se debe cerrar la conexión si o sí 
        * hay Resultset o un Statement.
        */
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
            } // ignore
            rs = null;
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException sqlEx) {
                } // ignore
                st = null;
            }
        }
    %>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>validar sesión</title>
        <style>
            body {background-color: #fb8c00}
        </style>
        
    </head>
    <body>
        
    </body>
</html>
