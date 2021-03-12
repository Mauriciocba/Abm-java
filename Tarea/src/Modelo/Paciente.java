
package Modelo;
public class Paciente {
    private int IdPaciente;
    private String Nombre;

    public Paciente(int IdPaciente, String Nombre) {
        this.IdPaciente = IdPaciente;
        this.Nombre = Nombre;
    }

    public int getIdPaciente() {
        return IdPaciente;
    }

    public void setIdPaciente(int IdPaciente) {
        this.IdPaciente = IdPaciente;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    @Override
    public String toString() {
        return  Nombre;
    }
    
    
}
