
package Modelo;


public class Visita {
    
    private int IdVisita;
    private Paciente paciente;
    private Empleado empleado;
    private String Nombre;
    private int Duracion;

    public Visita(int IdVisita, Paciente paciente, Empleado empleado, String Nombre, int Duracion) {
        this.IdVisita = IdVisita;
        this.paciente = paciente;
        this.empleado = empleado;
        this.Nombre = Nombre;
        this.Duracion = Duracion;
    }

    public int getIdVisita() {
        return IdVisita;
    }

    public void setIdVisita(int IdVisita) {
        this.IdVisita = IdVisita;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getDuracion() {
        return Duracion;
    }

    public void setDuracion(int Duracion) {
        this.Duracion = Duracion;
    }

    @Override
    public String toString() {
        return "Visita{" + "IdVisita=" + IdVisita + ", paciente=" + paciente.getIdPaciente() + ", empleado=" + empleado.getLegajo() + ", Nombre=" + Nombre + ", Duracion=" + Duracion + '}';
    }
    
    
}
