using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows;


namespace WpfReportesProyecto
{
    class clsConexion1
    {
        //public void bloquearUsuario()
        //{
        //    SqlConnection conex = new SqlConnection("Data Source=.;Initial Catalog=master;User ID=sa;Password=b02235eg");
        //    conex.Open();
        //    string comando = "exec PA_BLOQUEAR_USUARIO 'auditor1'";
        //    SqlCommand cmd = new SqlCommand(comando, conex);
        //    MessageBox.Show("Usuario bloqueado");
        //}

        public static List<Tablas> CargarTablasBD()
        {
            /*OBTIENE LA LISTA DE TABLAS QUE COMPONEN LA BASE DE DATOS
            Y LAS CARGA EN EL COMBOBOX CORRESPONDIENTE EN LA VENTANA DE FILTROS*/

            var lista = new List<Tablas>();//ESTA LISTA ALMACENARÁ LOS NOMBRES DE TABLAS QUE ARROJE EL PA QUE SE EJECUTARÁ
            using (var conex=new SqlConnection("Data Source=.;Initial Catalog=ClinicasCR-PrograIII;Integrated Security=True"))
            {
                conex.Open();
                string comando = "exec PA_Tablas";//PROCEDIMIENTO DE ALMACENADO QUE OBTIENE LAS TABLAS
                var cmd = new SqlCommand(comando, conex);
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())//RECORRE CADA REGISTRO ARROJADO POR LA CONSULTA
                {
                    var tabla = new Tablas();//CREA UN NUEVO OBJETO DE LA CLASE TABLA
                    tabla.nombre = lector[0].ToString();//LE ASIGNA A SU ATRIBUTO NOMBRE EL VALOR DE LA COLUMNA 0 DEL REGISTRO QUE SE ESTÁ RECORRIENDO
                    lista.Add(tabla);//AÑADE A LA LISTA EL OBJETO DE TIPO TABLA CREADO
                }
            }
            return lista;//RETORNA LA LISTA LLENA CON LOS NOMBRES DE TABLAS.
        }

        public static List<Usuarios> CargarUsuariosBD()
        {
            /*MISMO PROCEDIMIENTO DEL MÉTODO CARGARTABLASBD,
              EN ESTE CASO SE CARGAN EN EL COMBOBOX LOS USUARIOS DE LA BASE DE DATOS*/
            var lista = new List<Usuarios>();
            using (var conex = new SqlConnection("Data Source=.;Initial Catalog=ClinicasCR-PrograIII;Integrated Security=True"))
            {
                conex.Open();
                string comando = "exec PA_Usuarios";
                var cmd = new SqlCommand(comando, conex);
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    var usuario = new Usuarios();
                    usuario.nombre = lector[0].ToString();
                    lista.Add(usuario);
                }
            }
            return lista;
        }
    }

    public class Tablas
    {
        public string nombre { set; get; }
    }

    public class Usuarios
    {
        public string nombre { set; get; }
    }
}
