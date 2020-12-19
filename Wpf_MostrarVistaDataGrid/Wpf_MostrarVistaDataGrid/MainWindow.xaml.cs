using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace Wpf_MostrarVistaDataGrid
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnMostrar_Click(object sender, RoutedEventArgs e)
        {
            SqlConnection conex = new SqlConnection("Data Source=.;Initial Catalog=ClinicasCR-ProyectoFinal;Integrated Security=True");

            try
            {
                conex.Open();
                /*SUSTITUIR POR LA VISTA DE LOS USUARIOS Y ROLES QUE CREASTE*/
                /*SE PONEN LOS CAMPOS DE LA VISTA QUE SE QUIEREN MOSTRAR, TAMBIEN SE PUEDE DEJAR SOLO CON SELECT*FROM VISTA...*/
                string consulta = "select v.Cédula, v.Nombre_Completo, v.Fecha_Nacimiento from Vista_ASEGURADOS as v";
                SqlCommand comando = new SqlCommand(consulta, conex);
                comando.ExecuteNonQuery();

                SqlDataAdapter dataAdp = new SqlDataAdapter(comando);
                DataTable dt = new DataTable("Vista_ASEGURADOS");//PONERLE EL MISMO NOMBRE DE LA VISTA
                dataAdp.Fill(dt);
                dataGrid.ItemsSource = dt.DefaultView;//dataGrid ES EL NOMBRE QUE LE PONE AL DATAGRID CUANDO SE AGREGA A LA VENTANA...
                dataAdp.Update(dt);

                conex.Close();
            }catch(Exception error)
            {
                MessageBox.Show(error.Message);

            }
            
        }

        private void btnSalir_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
