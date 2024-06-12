// Esperamos a que el DOM esté completamente cargado (DOCUMENT OBJET MODEL)
document.addEventListener("DOMContentLoaded", function () {
    // Archivo functions.js
    var ageSlider = document.getElementById("ageSlider");
    var ageProgressBar = ageSlider.nextElementSibling;
    var ageSliderText = document.getElementById("txtEdad");

    ageSlider.oninput = function () {
        ageProgressBar.value = ageSlider.value;
        ageSliderText.innerHTML = ageSlider.value;
    };

    var heightSlider = document.getElementById("heightSlider");
    var heightProgressBar = heightSlider.nextElementSibling;
    var heightSliderText = document.getElementById("txtAltura");

    heightSlider.oninput = function () {
        heightProgressBar.value = heightSlider.value;
        heightSliderText.innerHTML = heightSlider.value;
    };

    var weightSlider = document.getElementById("weightSlider");
    var weightProgressBar = weightSlider.nextElementSibling;
    var weightSliderText = document.getElementById("txtPeso");

    weightSlider.oninput = function () {
        weightProgressBar.value = weightSlider.value;
        weightSliderText.innerHTML = weightSlider.value;
    };

});


// Form validation
function validateForm(event) {
    const form = document.forms['frmCliente'];
    const name = form['txtNombre'].value.trim();
    const physicalStage = form['txtEstadoFisico'].value;
    const trainingObjective = form['txtObjetivoEntrenamiento'].value;
    const availability = form['txtDisponibilidadEntrenar'].value;

    if (name.length < 3) {
        alert("Please enter a name with at least 3 characters.");
        event.preventDefault();
        return false;
    }
    if (physicalStage === "none") {
        alert("Please select a physical stage.");
        event.preventDefault();
        return false;
    }
    if (trainingObjective === "none") {
        alert("Please select a training objective.");
        event.preventDefault();
        return false;
    }
    if (availability === "none") {
        alert("Please select your availability to train.");
        event.preventDefault();
        return false;
    }
}
document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById('form');
    form.addEventListener('submit', validateForm);
});
