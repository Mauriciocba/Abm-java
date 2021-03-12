package Modelo;

public class Empleado {
    private int Legajo;
    private String Nombre;

    public Empleado(int Legajo, String Nombre) {
        this.Legajo = Legajo;
        this.Nombre = Nombre;
    }

    public int getLegajo() {
        return Legajo;
    }

    public void setLegajo(int Legajo) {
        this.Legajo = Legajo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    @Override
    public String toString() {
        return "" + Legajo ;
    }
    
    
}
