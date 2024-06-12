package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import logica.Cliente;

public class DBClientes {

    private DBConexion cn; // Instancia de DBConexion para establecer la conexión con la base de datos

    public DBClientes() {
        cn = new DBConexion(); // Inicializa la instancia de DBConexion en el constructor
    }

    // Método para obtener un cliente por su ID
    public ResultSet getClienteById(int id) throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement(
                "SELECT con_id, con_nombre, con_genero, con_edad, con_altura, con_peso, con_estadoFisico, con_objetivoEntrenamiento, con_disponibilidadEntrenar FROM clientes WHERE con_id = ?");
        pstm.setInt(1, id); // Establece el parámetro en la consulta preparada
        return pstm.executeQuery(); // Ejecuta la consulta y retorna el resultado
    }

    // Método para obtener todos los clientes
    public ResultSet getClientes() throws SQLException {
        PreparedStatement pstm = cn.getConexion().prepareStatement(
                "SELECT con_id, con_nombre, con_genero, con_edad, con_altura, con_peso, con_estadoFisico, con_objetivoEntrenamiento, con_disponibilidadEntrenar FROM clientes ORDER BY con_id");
        return pstm.executeQuery(); // Ejecuta la consulta y retorna el resultado
    }

    // Método para insertar un nuevo cliente en la base de datos
    public void insertarCliente(Cliente cliente) {
        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement(
                    "INSERT INTO clientes (con_nombre, con_genero, con_edad, con_altura, con_peso, con_estadoFisico, con_objetivoEntrenamiento, con_disponibilidadEntrenar) VALUES (?, ?, ?, ? , ?, ?, ?, ?)");
            // Establece los valores de los parámetros en la consulta preparada
            pstm.setString(1, cliente.getNombre());
            pstm.setString(2, cliente.getGenero());
            pstm.setInt(3, cliente.getEdad());
            pstm.setInt(4, cliente.getAltura());
            pstm.setInt(5, cliente.getPeso());
            pstm.setString(6, cliente.getEstadoFisico());
            pstm.setString(7, cliente.getObjetivoEntrenamiento());
            pstm.setString(8, cliente.getDisponibilidadEntrenar());
            pstm.executeUpdate(); // Ejecuta la consulta
        } catch (SQLException e) {
            System.out.println("Error al insertar cliente: " + e.getMessage()); // Maneja las excepciones
        }
    }

    // Método para actualizar un cliente en la base de datos
    public void actualizarCliente(Cliente cliente) {
        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement(
                    "UPDATE clientes SET con_nombre = ?, con_genero = ?, con_edad = ?, con_altura = ?, con_peso = ?, con_estadoFisico = ?, con_objetivoEntrenamiento = ?, con_disponibilidadEntrenar = ? WHERE con_id = ?");
            // Establece los valores de los parámetros en la consulta preparada
            pstm.setString(1, cliente.getNombre());
            pstm.setString(2, cliente.getGenero());
            pstm.setInt(3, cliente.getEdad());
            pstm.setInt(4, cliente.getAltura());
            pstm.setInt(5, cliente.getPeso());
            pstm.setString(6, cliente.getEstadoFisico());
            pstm.setString(7, cliente.getObjetivoEntrenamiento());
            pstm.setString(8, cliente.getDisponibilidadEntrenar());
            pstm.setInt(9, cliente.getId());
            pstm.executeUpdate(); // Ejecuta la consulta
        } catch (SQLException e) {
            System.out.println("Error al actualizar cliente: " + e.getMessage()); // Maneja las excepciones
        }
    }

    // Método para borrar un cliente de la base de datos
    public void borrarCliente(Cliente cliente) {
        try {
            PreparedStatement pstm = cn.getConexion().prepareStatement(
                    "DELETE FROM clientes WHERE con_id = ?");
            // Establece el valor del parámetro en la consulta preparada
            pstm.setInt(1, cliente.getId());
            pstm.executeUpdate(); // Ejecuta la consulta
        } catch (SQLException e) {
            System.out.println("Error al borrar cliente: " + e.getMessage()); // Maneja las excepciones
        }
    }

    // Método para obtener el mensaje de la conexión a la base de datos
    public String getMensaje() {
        return cn.getMensaje();
    }
}

