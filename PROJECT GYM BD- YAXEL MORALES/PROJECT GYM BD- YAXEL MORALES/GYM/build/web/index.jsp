<%@page import="java.util.List"%>
<%@page import="logica.Persona"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    // Se obtiene el conjunto de resultados de la sesión
    ResultSet clientes = (ResultSet)session.getAttribute("clientes"); 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Configuración del tipo de contenido y la codificación de caracteres -->
        <title>GYM FITIA- YAXEL MORALES </title>
        <!-- Título de la página -->
        <link rel="stylesheet" href="Presentacion/index_style.css"/>
        <!-- Enlace al archivo CSS para estilos -->
    </head>
    <body>
        <!-- Cuerpo de la página -->
        <h1>GYM FITIA</h1>
        <!-- Título del panel de control -->
        <table>
            <!-- Tabla para mostrar los datos de los clientes -->
            <tr>
                <!-- Encabezados de la tabla -->
                <th>Id</th><th>Name</th><th>Genre</th><th>Age</th><th>Hight</th><th>Weight</th><th>Physical Stage</th><th>Training Objetive</th><th>Availability to Train</th>
            </tr>
            <!-- Bucle para iterar sobre los resultados del conjunto de resultados -->
            <% while (clientes.next()){ %>
                <tr>
                    <!-- Filas de la tabla con los datos de cada cliente -->
                    <td><%= clientes.getString("con_id") %></td>
                    <!-- Celda para mostrar el ID del cliente -->
                    <td><%= clientes.getString("con_nombre") %></td>
                    <!-- Celda para mostrar el nombre del cliente -->
                    <td><%= clientes.getString("con_genero") %></td>
                    <!-- Celda para mostrar el género del cliente -->
                    <td><%= clientes.getString("con_edad") %></td>
                    <!-- Celda para mostrar la edad del cliente -->
                    <td><%= clientes.getString("con_altura") %></td>
                    <!-- Celda para mostrar la altura del cliente -->
                    <td><%= clientes.getString("con_peso") %></td>
                    <!-- Celda para mostrar el peso del cliente -->
                    <td><%= clientes.getString("con_estadoFisico") %></td>
                    <!-- Celda para mostrar el estado físico del cliente -->
                    <td><%= clientes.getString("con_objetivoEntrenamiento") %></td>
                    <!-- Celda para mostrar el objetivo de entrenamiento del cliente -->
                    <td><%= clientes.getString("con_disponibilidadEntrenar") %></td>
                    <!-- Celda para mostrar la disponibilidad para entrenar del cliente -->
                    <td class="links">
                        <!-- Celda para incluir enlaces de acciones para el cliente -->
                        <a href="CargarCliente?op=edit&item=<%= clientes.getString("con_id") %>">Editar</a>
                        <!-- Enlace para editar el cliente -->
                        <a href="CargarCliente?op=delete&item=<%= clientes.getString("con_id") %>">Borrar</a>
                        <!-- Enlace para borrar el cliente -->
                        <a href="CargarCliente?op=details&item=<%= clientes.getString("con_id") %>">Detalles</a>
                        <!-- Enlace para ver los detalles del cliente -->
                    </td>
                </tr>
            <% }%>
            <tr>
                <!-- Fila para agregar un nuevo cliente -->
                <td colspan="5" class="links"><a href="insertar_cliente.jsp">Agregar</a></td>
                <!-- Celda con enlace para agregar un nuevo cliente -->
            </tr>
        </table>
    </body>
</html>

