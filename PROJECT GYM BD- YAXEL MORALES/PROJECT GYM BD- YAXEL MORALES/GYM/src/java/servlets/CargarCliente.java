package servlets;

import datos.DBClientes; // Importa la clase para interactuar con la base de datos
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet; // Importa ResultSet para manejar los resultados de la consulta a la base de datos
import java.sql.SQLException; // Importa SQLException para manejar excepciones de SQL
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Cliente; // Importa la clase Cliente para manejar los datos del cliente

public class CargarCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Cliente p = new Cliente(); // Crea un nuevo objeto Cliente para almacenar los datos del cliente
        DBClientes conDB = new DBClientes(); // Crea una instancia de DBClientes para manejar la conexión con la base de datos

        try {
            // Obtiene el ID del cliente a cargar y la operación a realizar (editar, eliminar, detalles)
            int conId = Integer.parseInt(request.getParameter("item"));
            String opc = request.getParameter("op");
            
            // Obtiene los detalles del cliente de la base de datos
            ResultSet res = conDB.getClienteById(conId);
            if (res.next()) {
                // Establece los atributos del objeto Cliente con los datos obtenidos de la base de datos
                p.setId(res.getInt("con_id"));
                p.setNombre(res.getString("con_nombre"));
                p.setGenero(res.getString("con_genero"));
                p.setEdad(res.getInt("con_edad"));
                p.setAltura(res.getInt("con_altura"));
                p.setPeso(res.getInt("con_peso"));
                p.setEstadoFisico(res.getString("con_estadoFisico"));
                p.setObjetivoEntrenamiento(res.getString("con_objetivoEntrenamiento"));
                p.setDisponibilidadEntrenar(res.getString("con_disponibilidadEntrenar"));
            }

            // Calcula el índice de masa corporal (IMC) del cliente
            double imc = p.calcularIMC();
            request.setAttribute("cliente", p); // Establece el objeto Cliente como atributo de la solicitud
            request.setAttribute("imc", imc); // Establece el IMC como atributo de la solicitud

            // Crea una rutina semanal para el cliente
            Map<String, List<String>> rutinaSemanal = p.crearRutinaSemanal();
            System.out.println("Rutina Semanal Generada: " + rutinaSemanal);

            request.setAttribute("rutinaSemanal", rutinaSemanal); // Establece la rutina semanal como atributo de la solicitud

            // Maneja diferentes operaciones según la opción seleccionada
            if (opc.equals("edit")) {
                request.setAttribute("cliente", p);
                request.getRequestDispatcher("editar_cliente.jsp").forward(request, response);
            }
            if (opc.equals("delete")) {
                conDB.borrarCliente(p); // Elimina el cliente de la base de datos
                response.sendRedirect("Inicio"); // Redirecciona al usuario a la página de inicio
            }
            if (opc.equals("details")) {
                request.setAttribute("cliente", p);
                request.setAttribute("imc", imc);
                request.setAttribute("rutinaSemanal", rutinaSemanal);
                request.getRequestDispatcher("mostrar_cliente.jsp").forward(request, response); // Muestra los detalles del cliente
            }
        } catch (IOException | NumberFormatException | SQLException e) {
            // Maneja las excepciones
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

