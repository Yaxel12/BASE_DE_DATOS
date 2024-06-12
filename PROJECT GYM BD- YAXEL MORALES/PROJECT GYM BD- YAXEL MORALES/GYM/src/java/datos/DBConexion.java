package datos;

import java.sql.*;

public class DBConexion {
    static String bd = "gym"; // Nombre de la base de datos
    static String login = "root"; // Usuario de la base de datos
    static String password = ""; // Contraseña de la base de datos
    static String url = "jdbc:mysql://localhost/"+bd; // URL de conexión a la base de datos
    static String mensaje = ""; // Mensaje para almacenar errores de conexión
    
    Connection conexion = null; // Objeto Connection para la conexión a la base de datos

    // Constructor de la clase
    public DBConexion() {
        try {
            // Carga el driver de MySQL
            Class.forName("com.mysql.jdbc.Driver");
            // Establece la conexión a la base de datos
            conexion = DriverManager.getConnection(url, login, password);

            // Verifica si la conexión se realizó correctamente
            if (conexion != null) {
                System.out.println("Conexión a la base de datos " + bd + " OK");
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Captura cualquier excepción que pueda ocurrir durante la conexión
            mensaje = e.getMessage(); // Almacena el mensaje de error
        }
    }

    // Método para obtener el mensaje de error
    public static String getMensaje() {
        return mensaje;
    }

    // Método para establecer el mensaje de error
    public static void setMensaje(String mensaje) {
        DBConexion.mensaje = mensaje;
    }
     
    // Método para obtener la conexión a la base de datos
    public Connection getConexion(){
        return conexion;
    }

    // Método para desconectar la base de datos
    public void desconectar(){
        conexion = null; // Asigna null a la conexión para cerrarla
    }

}

