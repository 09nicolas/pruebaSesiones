<%-- 
    Document   : index
    Created on : 23/08/2022, 08:12:45 PM
    Author     : Alumno
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ServletLogin.ConexionBD"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--
    PASO 3: Se reciben los parametros que se ingresaron por el formulario form_sesion
--%>
    <%
        String user_in = request.getParameter("campo_user");
        String pass_in = request.getParameter("campo_pass");
        
        Connection conn = ConexionBD.conectarBaseDatos();
        Statement st = null;
        ResultSet rs = null;
        
        String query="";
        try{
            // Se crea un Statement, para realizar la consulta
            st = conn.createStatement();
            
            // Se arma el query
            query ="SELECT USU_NOMUSUARIO, USU_PASSWORD FROM usuario WHERE USU_NOMUSUARIO = '"+user_in+"' AND USU_PASSWORD = '"+pass_in+"';";
            //out.println("<br>El Query Ejecutado es: <br>"+query);
            // Se ejecuta el query
            
            rs = st.executeQuery(query);
            
            String vUsuario="";
            String vPss="";
            
            while(rs.next()){
                vUsuario =rs.getString("USU_NOMUSUARIO");
                vPss = rs.getString("USU_PASSWORD");
            }
                        
            /*
            out.println("form "+user_in);
            out.println("form "+pass_in);
            out.println("query "+vUsuario);
            out.println("query "+vPss);
            */
            //if(vCorreo==correo_in && vPss==pass_in){
            if(user_in.equals(vUsuario) && vPss.equals(pass_in)){
                out.println("primier if");
                /*Se crea la sesion*/
                HttpSession sesion = request.getSession();
                /*Se agregan atributos a la sesión*/
                
                sesion.setAttribute("password",pass_in);
                sesion.setAttribute("user", user_in);
                
                /*A manera de prueba se muestran los datos de la sesion*/

                
                String password = (String)sesion.getAttribute("password");
                String usuario = (String)sesion.getAttribute("user"); 
                
                out.println("<br>Se ha establecido una sesión con los siguientes datos:<br>");
                out.println("<br>password: "+password);
                out.println("<br>usuario: "+usuario);
                
                out.println("<br><br><a href='./bienvenida.jsp'>Mostrar bienvenida</a>");

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
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <style>
            .button_menu{
                background-color: #FFF6EA;
                border: white;
                color: #2A3A3B;
                padding: 10px 21px;
                text-align: center;
                text-decoration: none;
                display: flex;
                font-size: 27px;
                margin: 10px;
                cursor: pointer;
                border-radius: 15px;
            }
            body{
                background-image: url("img/background6.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                width: 100%;
            }
            .input-field input{
                border-bottom: 1px solid #000;
                box-shadow: 0 1px 0 0 #000;
            }           
            label{
                font-family: cursive;
                font-size: 15px;
                color: black;
            }
            input{
                background: #97C0C2;
            }
            #formulario{
                text-align: center;
                margin: 0 auto;
                margin-top: 5%
            }
        </style>
    </head>
    <body>
        <div id="formulario">                 
        <form action="index.jsp" method="post">
            <div class="input-field">
                        <i class="material-icons prefix">person_pin</i>
                        <label class="white-text">Usuario:</label> 
                        <input type="text" name="campo_user" minlength="8" maxlength="15" class="validate" required>
                    <br>
                </div>
            <div class="input-field">
                        <i class="material-icons prefix">lock_outline</i>
                        <label class="white-text">Contraseña:</label>
                        <input type="password" name="campo_pass" minlength="8" maxlength="15" class="validate" required>
                        <br>
            </div>
            <a class="waves-effect waves-light btn"><i class="material-icons left">save</i><input type="submit" value="Iniciar"></a>
        </form>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>
