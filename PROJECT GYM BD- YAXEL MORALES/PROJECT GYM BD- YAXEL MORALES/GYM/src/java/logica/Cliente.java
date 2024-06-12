package logica;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Define la clase Cliente, que extiende la clase Persona
public class Cliente extends Persona {
    
    // Atributos específicos del Cliente
    private String objetivoEntrenamiento;
    private String disponibilidadEntrenar;

    // Constructores
    public Cliente() {
    }

    public Cliente(String objetivoEntrenamiento, String disponibilidadEntrenar, int id, String nombre, String genero, int edad, int altura, int peso, String estadoFisico) {
        // Llama al constructor de la superclase Persona
        super(id, nombre, genero, edad, altura, peso, estadoFisico);
        // Inicializa los atributos específicos del Cliente
        this.objetivoEntrenamiento = objetivoEntrenamiento;
        this.disponibilidadEntrenar = disponibilidadEntrenar;
    }

    // Métodos getter y setter para los atributos específicos del Cliente
    public String getObjetivoEntrenamiento() {
        return objetivoEntrenamiento;
    }

    public void setObjetivoEntrenamiento(String objetivoEntrenamiento) {
        this.objetivoEntrenamiento = objetivoEntrenamiento;
    }

    public String getDisponibilidadEntrenar() {
        return disponibilidadEntrenar;
    }

    public void setDisponibilidadEntrenar(String disponibilidadEntrenar) {
        this.disponibilidadEntrenar = disponibilidadEntrenar;
    }
    
    // Método para crear una rutina semanal de entrenamiento
    public Map<String, List<String>> crearRutinaSemanal() {
        Map<String, List<String>> weeklyRoutine = new HashMap<>();

        // Determina la disponibilidad de entrenamiento en diferentes momentos del día
        boolean availableInMorning = this.disponibilidadEntrenar.contains("morning");
        boolean availableInAfternoon = this.disponibilidadEntrenar.contains("afternoon");
        boolean availableAtNight = this.disponibilidadEntrenar.contains("night");
        boolean availableAtAllDay = this.disponibilidadEntrenar.contains("all_day");

        // Crea la rutina semanal en función de la disponibilidad de entrenamiento
        if (availableInMorning) {
            weeklyRoutine.put("Monday 6am", crearRutinaDiaria("typeOne"));
            weeklyRoutine.put("Wednesday 8am", crearRutinaDiaria("typeTwo"));
            weeklyRoutine.put("Friday 8am", crearRutinaDiaria("typeThree"));
        }
        if (availableInAfternoon) {
            weeklyRoutine.put("Tuesday 2pm", crearRutinaDiaria("typeTwo"));
            weeklyRoutine.put("Thursday 4pm", crearRutinaDiaria("typeTwo"));
        }
        if (availableAtNight) {
            weeklyRoutine.put("Monday 8pm", crearRutinaDiaria("typeOne"));
            weeklyRoutine.put("Wednesday 8pm", crearRutinaDiaria("typeThree"));
        }
        if (availableAtAllDay) {
            weeklyRoutine.put("Monday 6pm", crearRutinaDiaria("typeOne"));
            weeklyRoutine.put("Tuesday 8pm", crearRutinaDiaria("typeTwo"));
            weeklyRoutine.put("Wednesday 8pm", crearRutinaDiaria("typeThree"));
            weeklyRoutine.put("Thursday 8pm", crearRutinaDiaria("typeTwo"));
            weeklyRoutine.put("Friday 8pm", crearRutinaDiaria("typeThree"));
        }

        return weeklyRoutine; // Retorna la rutina semanal creada
    }

    // Método para crear una rutina diaria de entrenamiento según el tipo especificado
    private List<String> crearRutinaDiaria(String type) {
        List<String> rutinaDiaria = new ArrayList<>();

        // Crea una rutina diaria según el tipo especificado
        if (type.equals("typeOne")) {
            rutinaDiaria.add("Cardiovascular Exercise: 30 minutes (e.g., running, cycling)");
            rutinaDiaria.add("Stretching: 10 minutes");
            rutinaDiaria.add("Push-ups: 3 sets of 15 repetitions");
            rutinaDiaria.add("Pull-ups: 3 sets of 10 repetitions");
            rutinaDiaria.add("Dumbbell Bench Press: 3 sets of 12 repetitions");
            rutinaDiaria.add("Plank: 3 sets of 1 minute");
        } else if (type.equals("typeTwo")) {
            rutinaDiaria.add("Warm-up: 10 minutes (e.g., jumping jacks, dynamic stretching)");
            rutinaDiaria.add("Squats: 4 sets of 12 repetitions");
            rutinaDiaria.add("Deadlifts: 4 sets of 10 repetitions");
            rutinaDiaria.add("Lunges: 3 sets of 15 repetitions per leg");
            rutinaDiaria.add("Leg Press: 3 sets of 12 repetitions");
            rutinaDiaria.add("Calf Raises: 3 sets of 20 repetitions");
            rutinaDiaria.add("Cool-down: 10 minutes (e.g., light stretching)");
        } else if (type.equals("typeThree")) {
            rutinaDiaria.add("Jump Rope: 10 minutes");
            rutinaDiaria.add("Yoga or Meditation: 20 minutes (e.g., Sun Salutations, breathing exercises)");
            rutinaDiaria.add("Core Workout: 20 minutes (e.g., bicycle crunches, Russian twists, leg raises)");
            rutinaDiaria.add("Flexibility Training: 15 minutes (e.g., static stretching, foam rolling)");
            rutinaDiaria.add("Cool-down: 5 minutes (e.g., relaxation poses)");
        }
        
        return rutinaDiaria; // Retorna la rutina diaria creada
    }
}


