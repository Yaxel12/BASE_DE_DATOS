<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="utf-8" />
        <!-- Define la codificación de caracteres UTF-8 -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Define la versión de Internet Explorer -->
        <title>Nueva Persona</title>
        <!-- Título de la página -->
        <meta name="description" content="" />
        <!-- Descripción de la página -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!-- Configuración de la visualización para dispositivos móviles -->
        <link rel="stylesheet" href="Presentacion/insertar_style.css"/>
        <!-- Enlace al archivo CSS para estilos -->
        <script src="Funcionalidad/form_validation.js" defer></script>
        <!-- Incluye el archivo de validación de formulario JavaScript -->
    </head>
    <body>
        <!-- Encabezado de la página -->
        <header> GYM FITIA Register</header>

        <!-- Formulario de registro de usuarios -->
        <form id="form" name="frmCliente" class="topBefore" action="InsertarCliente" method="get">

            <!-- Campo para ingresar el nombre -->
            <div>
                <input id="txtNombre" name="txtNombre" type="text" placeholder="NAME" />
                <!-- Campo de texto con marcador de posición "NAME" -->
            </div>

            <!-- Selección de género -->
            <div class="radio_buttom">
                <!-- Botones de opción para género -->
                <input type="radio" class="radio_input" name="txtGenero" id="small" value="male" checked="checked">
                <!-- Opción para género masculino, predeterminada -->
                <label for="small" >Male</label>
                <input type="radio" class="radio_input" name="txtGenero" id="large" value="female">
                <!-- Opción para género femenino -->
                <label for="large"  >Female</label>
            </div><br><br><br><br><br>

            <!-- Control deslizante para la edad -->
            <div class="slider-cont">
                <div> Edad </div>
                <!-- Etiqueta para la edad -->
                <div class="slider">
                    <!-- Contenedor del control deslizante -->
                    <input type="range" name="txtEdad" min="0" max="100" value="18" id="ageSlider" />
                    <!-- Control deslizante para seleccionar la edad -->
                    <progress min="0" max="100" value="50"></progress>
                    <!-- Barra de progreso para la edad -->
                </div>
                <div class="sliderValue" id="txtEdad">18</div>
                <!-- Valor de la edad seleccionada -->
            </div>

            <!-- Control deslizante para la altura -->
            <div class="slider-cont">
                <div> Height </div>
                <!-- Etiqueta para la altura -->
                <div class="slider">
                    <!-- Contenedor del control deslizante -->
                    <input type="range" name="txtAltura" min="100" max="250" value="160" id="heightSlider" />
                    <!-- Control deslizante para seleccionar la altura -->
                    <progress min="0" max="100" value="50"></progress>
                    <!-- Barra de progreso para la altura -->
                </div>
                <div class="sliderValue" id="txtAltura">160</div>
                <!-- Valor de la altura seleccionada -->
            </div>

            <!-- Control deslizante para el peso -->
            <div class="slider-cont">
                <div> Weight </div>
                <!-- Etiqueta para el peso -->
                <div class="slider">
                    <!-- Contenedor del control deslizante -->
                    <input type="range" name="txtPeso" min="30" max="200" value="65" id="weightSlider" />
                    <!-- Control deslizante para seleccionar el peso -->
                    <progress min="0" max="100" value="50"></progress>
                    <!-- Barra de progreso para el peso -->
                </div>
                <div class="sliderValue" id="txtPeso">65</div>
                <!-- Valor del peso seleccionado -->
            </div><br>

            <!-- Selección de estado físico -->
            <div>
                <select name="txtEstadoFisico">
                    <!-- Menú desplegable para el estado físico -->
                    <option value="none" class="selecter">Physical Stage</option>
                    <option value="sedentary">Sedentary</option>
                    <option value="active">Active</option>
                    <option value="fit">Fit</option>
                    <option value="athletic">Athletic</option>
                </select>
                <!-- Opciones para el estado físico -->
            </div><br>

            <!-- Selección de objetivo de entrenamiento -->
            <div>
                <select name="txtObjetivoEntrenamiento">
                    <!-- Menú desplegable para el objetivo de entrenamiento -->
                    <option value="none" class="selec">Training Objective</option>
                    <option value="lose_weight">Lose Weight</option>
                    <option value="gain_muscle_mass">Gain Muscle Mass</option>
                    <option value="physical_conditioning">Physical Conditioning</option>
                    <option value="general_maintenance">General maintenance</option>
                </select>
                <!-- Opciones para el objetivo de entrenamiento -->
            </div><br>

            <!-- Selección de disponibilidad para entrenar -->
            <div>
                <select name="txtDisponibilidadEntrenar">
                    <!-- Menú desplegable para la disponibilidad para entrenar -->
                    <option value="none" class="selec">Availability To Train</option>
                    <option value="morning">Morning</option>
                    <option value="afternoon">Afternoon</option>
                    <option value="night">Night</option>
                    <option value="all_day">All Day</option>
                </select>
                <!-- Opciones para la disponibilidad para entrenar -->
            </div>

            <!-- Botón para enviar el formulario -->
            <input id="submit" type="submit" value="GO!" />
        </form>
    </body>
</html>

