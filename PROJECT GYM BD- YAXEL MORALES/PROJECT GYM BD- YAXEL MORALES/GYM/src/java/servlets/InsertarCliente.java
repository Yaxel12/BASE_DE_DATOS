package servlets;

import datos.DBClientes; // Importa la clase para interactuar con la base de datos
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Cliente; // Importa la clase que representa un Cliente

public class InsertarCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Crea un nuevo objeto Cliente y una instancia de DBClientes para manejar la conexión con la base de datos
        Cliente p = new Cliente();
        DBClientes conDb = new DBClientes();

        try {
            // Obtiene los datos del cliente del formulario enviado por el usuario
            p.setNombre(request.getParameter("txtNombre"));
            p.setGenero(request.getParameter("txtGenero"));
            p.setEdad(Integer.parseInt(request.getParameter("txtEdad")));
            p.setAltura(Integer.parseInt(request.getParameter("txtAltura")));
            p.setPeso(Integer.parseInt(request.getParameter("txtPeso")));
            p.setEstadoFisico(request.getParameter("txtEstadoFisico"));
            p.setObjetivoEntrenamiento(request.getParameter("txtObjetivoEntrenamiento"));
            p.setDisponibilidadEntrenar(request.getParameter("txtDisponibilidadEntrenar"));
            
            // Inserta el cliente en la base de datos
            conDb.insertarCliente(p);
            
            // Redirecciona al usuario a la página de inicio después de insertar el cliente
            response.sendRedirect("Inicio");
            
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


