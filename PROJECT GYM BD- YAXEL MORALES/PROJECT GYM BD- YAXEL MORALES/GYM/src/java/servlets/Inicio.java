package servlets;

import datos.DBClientes; // Importa la clase para interactuar con la base de datos
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet; // Importa ResultSet para manejar los resultados de la consulta a la base de datos
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.*; // Importa las clases de lógica necesarias

public class Inicio extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DBClientes conDb = new DBClientes(); // Crea una instancia de DBClientes para manejar la conexión con la base de datos

        try {
            ResultSet res = conDb.getClientes(); // Obtiene los clientes de la base de datos
            request.getSession().setAttribute("clientes", res); // Guarda el resultado en la sesión como atributo "clientes"

            response.sendRedirect("index.jsp"); // Redirecciona al usuario a la página index.jsp

        } catch (Exception e) {
            // Si hay un error, muestra una página de error
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Inicio</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Error at " + e.toString() + "</h1>");
            out.println("<p>seguimiento: "+conDb.getMensaje()+"</p>");
            out.println("</body>");
            out.println("</html>");
            
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

