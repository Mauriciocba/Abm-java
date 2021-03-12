
package Dto;


public class DtoPromedioVisitas {
    
    public int Duracion;

    public DtoPromedioVisitas(int Duracion) {
        this.Duracion = Duracion;
    }

    @Override
    public String toString() {
        return "DtoPromedioVisitas{" + "Duracion=" + Duracion + '}';
    }
    
    
    
}
