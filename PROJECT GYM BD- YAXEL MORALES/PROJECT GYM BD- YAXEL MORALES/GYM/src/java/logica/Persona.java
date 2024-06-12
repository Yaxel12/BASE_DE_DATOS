package logica;

import java.io.Serializable;

public class Persona {
    
    private int id;
    private String nombre;
    private String genero;
    private int edad;
    private int altura;
    private int peso;
    private String estadoFisico;

    public Persona() {
    }

    public Persona(int id, String nombre, String genero, int edad, int altura, int peso, String estadoFisico) {
        this.id = id;
        this.nombre = nombre;
        this.genero = genero;
        this.edad = edad;
        this.altura = altura;
        this.peso = peso;
        this.estadoFisico = estadoFisico;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getAltura() {
        return altura;
    }

    public void setAltura(int altura) {
        this.altura = altura;
    }

    public int getPeso() {
        return peso;
    }

    public void setPeso(int peso) {
        this.peso = peso;
    }

    public String getEstadoFisico() {
        return estadoFisico;
    }

    public void setEstadoFisico(String estadoFisico) {
        this.estadoFisico = estadoFisico;
    }
    
        //*************** METODOS de PERSONA *******************//

    // Método para calcular el Índice de Masa Corporal (IMC)
    public double calcularIMC() {
        // Convertir altura de centímetros a metros
        double alturaMetros = altura / 100.0;

        // Calcular IMC utilizando la fórmula: peso / (altura^2)
        double imc = peso / (alturaMetros * alturaMetros);

        return imc;
    }
    
    
}
