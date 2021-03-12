
package Controlador;


import Dto.DtoVisitasPorPaciente;
import Modelo.Empleado;
import Modelo.Paciente;
import Modelo.Visita;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.*;


public class Gestor {
    
         private Connection con;
     

    private void abrirConexion() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(CONN_STR, USER, PASS);
        } catch (Exception exc) {
            exc.printStackTrace();
        }
        
    }
    
    private void cerrarConexion() {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }

        } catch (Exception exc) {
            exc.printStackTrace();
        }
    }

    public static final String CONN_STR = "jdbc:sqlserver://MAURICIO-PC:1433;databaseName=Visitas";
    private String USER = "sa";
    private String PASS = "123456";

    
    
     public void agregarUnaVisita(Visita nuevaVisita) {

        try {
            abrirConexion();

            PreparedStatement st = con.prepareStatement("Insert Into Visitas (IdPaciente,LegajoRecepcionista,Nombre,Duracion) values (?,?,?,?)");
            
            
            
            st.setInt(1,nuevaVisita.getPaciente().getIdPaciente());
            st.setInt(2,nuevaVisita.getEmpleado().getLegajo());
            st.setString(3, nuevaVisita.getNombre());
            st.setInt(4, nuevaVisita.getDuracion());
            
          
            st.executeUpdate();
            st.close();

        } catch (Exception exc) {
            exc.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }   
     
    
       
       
       public ArrayList<Visita> obtenerVisitas2() {
        ArrayList<Visita> lista = new ArrayList<>();

        try {
            abrirConexion();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select Visitas.IdVisita,Pacientes.IdPaciente,Pacientes.Nombre as nombrePaciente ,Empleados.Legajo ,Empleados.Nombre as nombreEmpleado ,Visitas.Nombre,Visitas.Duracion\n" +
                                            "from Visitas\n" +
                                            "left join Pacientes on Visitas.IdPaciente = Pacientes.IdPaciente \n" +
                                            "left join Empleados on Visitas.LegajoRecepcionista = Empleados.Legajo");

            while (rs.next()) {
                int IdVisita = rs.getInt("IdVisita");
                
                int IdPaciente = rs.getInt("IdPaciente");
                String NombrePa = rs.getString("nombrePaciente");
                Paciente pa = new Paciente(IdPaciente, NombrePa);
                
                int Legajo = rs.getInt("Legajo");
                String NombreEM = rs.getString("nombreEmpleado");
                Empleado em = new Empleado(Legajo,NombreEM);
                
                String nombre = rs.getString("nombre");
                int duracion = rs.getInt("duracion");
               

                Visita v2 = new Visita(IdVisita, pa, em, nombre,duracion);
                lista.add(v2);
            }
            st.close();

        } catch (Exception exc) {
            exc.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
         }
       
          public ArrayList<Paciente> ComboPaciente() {
        ArrayList<Paciente> listaPaciente = new ArrayList<>();

        try {
            abrirConexion();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from Pacientes");

            while (rs.next()) {
                
                int IdPaciente = rs.getInt("IdPaciente");
                String Nombre = rs.getString("Nombre");
               
                Paciente pac = new Paciente(IdPaciente,Nombre);
                listaPaciente.add(pac);
            }
            st.close();

        } catch (Exception exc) {
            exc.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return listaPaciente;
         }
          
             public ArrayList<Empleado> ComboEmpleado() {
        ArrayList<Empleado> listaEmpleado = new ArrayList<>();

        try {
            abrirConexion();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from Empleados");

            while (rs.next()) {
                
                int Legajo = rs.getInt("Legajo");
                String Nombre = rs.getString("Nombre");
                
                Empleado em = new Empleado(Legajo,Nombre);
                listaEmpleado.add(em);
            
            }
            st.close();

        } catch (Exception exc) {
            exc.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return listaEmpleado;
         }
             
             
      public ArrayList<DtoVisitasPorPaciente> visitaPorPaciente(){
          ArrayList<DtoVisitasPorPaciente> resultado = new ArrayList<>();
          
          
           try {
            abrirConexion();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select Pacientes.Nombre as NombrePaciente , count(IdVisita) as Cantidad from Pacientes\n" +
                                            "join Visitas on Pacientes.IdPaciente = Visitas.IdPaciente\n" +
                                             "group by Pacientes.Nombre");

            while (rs.next()) {
            
                String nombre = rs.getString("NombrePaciente");
                int    visitas  = rs.getInt("Cantidad");
               
                DtoVisitasPorPaciente dtoVP = new DtoVisitasPorPaciente(nombre,visitas);
                resultado.add(dtoVP);
            }
             } catch (Exception exc) {
            exc.printStackTrace();
        } finally {
            cerrarConexion();
        }
            
          
        return resultado;  
      }
      
      
      public int reportePromedioDuracion(){
       int resultado = -1;     
          
          
        try {
            abrirConexion();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select avg(Visitas.Duracion) as Duracion from Visitas");

            if (rs.next()) {
            
                resultado = rs.getInt("Duracion");
               
              
            }
             } catch (Exception exc) {
            exc.printStackTrace();
        } finally {
            cerrarConexion();
        }
       
       
       return resultado;
       
      }
             
}
