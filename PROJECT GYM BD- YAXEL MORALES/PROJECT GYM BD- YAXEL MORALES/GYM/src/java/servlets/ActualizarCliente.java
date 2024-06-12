package servlets;

import datos.DBClientes;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Cliente;

public class ActualizarCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Crear un objeto Cliente y DBClientes para actualizar la información en la base de datos
        Cliente p = new Cliente();
        DBClientes conDb = new DBClientes();

        try {
            // Obtener y establecer los valores del cliente desde el formulario
            p.setId(Integer.parseInt(request.getParameter("txtId")));
            p.setNombre(request.getParameter("txtNombre"));
            p.setGenero(request.getParameter("txtGenero"));
            p.setEdad(Integer.parseInt(request.getParameter("txtEdad")));
            p.setAltura(Integer.parseInt(request.getParameter("txtAltura")));
            p.setPeso(Integer.parseInt(request.getParameter("txtPeso")));
            p.setEstadoFisico(request.getParameter("txtEstadoFisico"));
            p.setObjetivoEntrenamiento(request.getParameter("txtObjetivoEntrenamiento"));
            p.setDisponibilidadEntrenar(request.getParameter("txtDisponibilidadEntrenar"));

            // Actualizar el cliente en la base de datos
            conDb.actualizarCliente(p);

            // Redireccionar a la página de inicio o a la página correspondiente
            response.sendRedirect("Inicio");

        } catch (IOException | NumberFormatException e) {
            response.getWriter().println("Error al actualizar el cliente: " + e.getMessage());
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
        return "Servlet para actualizar un cliente";
    }
}

