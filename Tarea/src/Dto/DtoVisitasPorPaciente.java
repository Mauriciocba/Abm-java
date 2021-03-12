
package Dto;


public class DtoVisitasPorPaciente {
    
    public String NombrePaciente;
    public int Cantidad;

    public DtoVisitasPorPaciente(String NombrePaciente, int Cantidad) {
        this.NombrePaciente = NombrePaciente;
        this.Cantidad = Cantidad;
    }

    @Override
    public String toString() {
        return "Nombre: " + NombrePaciente + " Cantidad: " + Cantidad;
    }
    
    
    
    
}
