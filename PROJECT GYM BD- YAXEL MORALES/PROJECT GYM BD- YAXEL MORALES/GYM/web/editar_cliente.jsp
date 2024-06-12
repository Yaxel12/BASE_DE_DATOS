<%@page import="logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GYM FITIA Edit Client</title>
        <script src='validar.jsp' language='JavaScript1.2'></script>
        <link href='diseno.css' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Presentacion/editar_style.css"/>
        <script src="Funcionalidad/form_validation.js" defer></script>
    </head>
    <body>
        <%
            // Obtener el objeto Cliente desde el ámbito de solicitud (request)
            Cliente cliente = (Cliente) request.getAttribute("cliente");
        %>
        <form id="frmActualizarCliente" action="ActualizarCliente" method="POST">
            <input type="hidden" id="txtId" name="txtId" value="<%= cliente.getId()%>">
            <center>
                <table>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" id="txtNombre" name="txtNombre" value="<%= cliente.getNombre()%>"></td>
                    </tr>
                    <tr>
                        <td>Genre</td>
                        <td>
                            <div class="genre-container">
                                <input type="radio" class="radio_input" name="txtGenero" id="male" value="male" <%= cliente.getGenero().equals("male") ? "checked" : ""%>>
                                <label for="male">Male</label>
                                <input type="radio" class="radio_input" name="txtGenero" id="female" value="female" <%= cliente.getGenero().equals("female") ? "checked" : ""%>>
                                <label for="female">Female</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Age</td>
                        <td>
                            <div class="slider-cont">
                                <div class="slider">
                                    <input type="range" name="txtEdad" min="0" max="100" value="<%= cliente.getEdad()%>" id="ageSlider" />
                                    <progress min="0" max="100" value="50"></progress>
                                </div>
                                <div class="sliderValue" id="txtEdad"><%= cliente.getEdad()%></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Height</td>
                        <td>
                            <div class="slider-cont">
                                <div class="slider">
                                    <input type="range" name="txtAltura" min="100" max="250" value="<%= cliente.getAltura()%>" id="heightSlider" />
                                    <progress min="0" max="100" value="<%= cliente.getAltura()%>"></progress>
                                </div>
                                <div class="sliderValue" id="txtAltura"><%= cliente.getAltura()%></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Weight</td>
                        <td>
                            <div class="slider-cont">
                                <div class="slider">
                                    <input type="range" name="txtPeso" min="30" max="200" value="<%= cliente.getPeso()%>" id="weightSlider" />
                                    <progress min="0" max="100" value="<%= cliente.getPeso()%>"></progress>
                                </div>
                                <div class="sliderValue" id="txtPeso"><%= cliente.getPeso()%></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Physic Stage</td>
                        <td>
                            <select name="txtEstadoFisico">
                                <option value="none" class="selecter">Physical Stage</option>
                                <option value="sedentary" <%= cliente.getEstadoFisico().equals("sedentary") ? "selected" : ""%>>Sedentary</option>
                                <option value="active" <%= cliente.getEstadoFisico().equals("active") ? "selected" : ""%>>Active</option>
                                <option value="fit" <%= cliente.getEstadoFisico().equals("fit") ? "selected" : ""%>>Fit</option>
                                <option value="athletic" <%= cliente.getEstadoFisico().equals("athletic") ? "selected" : ""%>>Athletic</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Train Objetive</td>
                        <td>
                            <select name="txtObjetivoEntrenamiento">
                                <option value="none" class="selec">Training Objective</option>
                                <option value="lose_weight" <%= cliente.getObjetivoEntrenamiento().equals("lose_weight") ? "selected" : ""%>>Lose Weight</option>
                                <option value="gain_muscle_mass" <%= cliente.getObjetivoEntrenamiento().equals("gain_muscle_mass") ? "selected" : ""%>>Gain Muscle Mass</option>
                                <option value="physical_conditioning" <%= cliente.getObjetivoEntrenamiento().equals("physical_conditioning") ? "selected" : ""%>>Physical Conditioning</option>
                                <option value="general_maintenance" <%= cliente.getObjetivoEntrenamiento().equals("general_maintenance") ? "selected" : ""%>>General Maintenance</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Availability to Train </td>
                        <td>
                            <select name="txtDisponibilidadEntrenar">
                                <option value="none" class="selec">Availability To Train</option>
                                <option value="morning" <%= cliente.getDisponibilidadEntrenar().equals("morning") ? "selected" : ""%>>Morning</option>
                                <option value="afternoon" <%= cliente.getDisponibilidadEntrenar().equals("afternoon") ? "selected" : ""%>>Afternoon</option>
                                <option value="night" <%= cliente.getDisponibilidadEntrenar().equals("night") ? "selected" : ""%>>Night</option>
                                <option value="all_day" <%= cliente.getDisponibilidadEntrenar().equals("all_day") ? "selected" : ""%>>All Day</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input id="submit" type="submit" value="GO!"></td>
                    </tr>
                </table>
            </center>
        </form>
    </body>
</html>

