<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GYM FITIA Client Details</title>
        <!-- Enlace al archivo CSS para estilos -->
        <link rel="stylesheet" href="Presentacion/mostrar_style.css"/>
    </head>
    <body>
        <% // Scriptlet de Java para obtener datos del ámbito de solicitud %>
        <%
            // Obtener el objeto Cliente desde el ámbito de solicitud (request)
            Cliente cliente = (Cliente) request.getAttribute("cliente");
            // Obtener el valor de IMC desde el ámbito de solicitud
            Double imc = (Double) request.getAttribute("imc");
            // Obtener la rutina semanal desde el ámbito de solicitud
            Map<String, List<String>> rutinaSemanal = (Map<String, List<String>>) request.getAttribute("rutinaSemanal");
        %>
        <div class="container">
            <h1>Personalized Weekly Workout Routine</h1>
            <div class="personal-info">
                <h1>Client Details</h1>
                <h2>Personal Information</h2>
                <!-- Mostrar la información personal del cliente -->
                <p>Name: <%= cliente.getNombre()%></p>
                <p>Genre: <%= cliente.getGenero()%></p>
                <p>Age: <%= cliente.getEdad()%></p>
                <p>Height: <%= cliente.getAltura()%> cm</p>
                <p>Weight: <%= cliente.getPeso()%> kg</p>
                <p>Physical Stage: <%= cliente.getEstadoFisico()%></p>
                <p>Train Objetive: <%= cliente.getObjetivoEntrenamiento()%></p>
                <p>Availability to Train: <%= cliente.getDisponibilidadEntrenar()%></p>

                <h2>IMC</h2>

                <!-- Mostrar el IMC del cliente -->
                <p>IMC: <%= imc%></p>
            </div>
            <div class="weekly-routine">
                <h2>Weekly Routine</h2>
                <!-- Mostrar la rutina semanal de entrenamiento del cliente -->
                <% for (Map.Entry<String, List<String>> entry : rutinaSemanal.entrySet()) {%>
                <h3><%= entry.getKey()%></h3>
                <ul>
                    <% for (String ejercicio : entry.getValue()) {%>
                    <li><%= ejercicio%></li>
                        <% } %>
                </ul>
                <% }%>
            </div>
        </div>
    </body>
</html>

