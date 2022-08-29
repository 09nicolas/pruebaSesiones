package ServletLogin;

//import paquete.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    
    public static Connection conectarBaseDatos() {
        Connection conn = null; //Instancia de Tipo conexion
        String user = "root"; // Nombre de Usuario para el acceso a la base de datos
        String pass = "n0m3l0"; // Contraseña del Usuario para el acceso a la base de datos
        String baseDatos ="pruebatdd"; // Nombre de la base de datos
        String autoReconnect = "true"; // Permite autoreconectarse
        String publicKey = "true"; //Permite recuperación de llave Publica
        String useSSL = "false"; //Usa Certificado de seguridad  
        
        //Carga del Driver jdbc
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            // Manejador de errores
            System.out.println("Mensaje: " + ex.getMessage());
            ex.getMessage();
        }
        
        //Establece la conexión a la Base de Datos indicada
        try {
           //conn = DriverManager.getConnection("jdbc:mysql://localhost/"+baseDatos+"?user="+user+"&password="+pass+"&autoReconnect=true&allowPublicKeyRetrieval=true&useSSL=false");
           conn = DriverManager.getConnection("jdbc:mysql://localhost/"+baseDatos+"?user="+user+"&password="+pass+"&autoReconnect="+autoReconnect+"&allowPublicKeyRetrieval="+publicKey+"&useSSL="+useSSL);
        } catch (SQLException ex) {
        // Manejador de errores
        System.out.println("--------> Excepción SQL: " + ex.getMessage());
        System.out.println("--------> Estado SQL: " + ex.getSQLState());
        System.out.println("--------> Error del Proveedor: " + ex.getErrorCode());
        
        }
        return conn;
    }
}
