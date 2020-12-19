using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfReportesProyecto
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        string user, password;
        SqlConnection sqlconex;
        int cont = 1;


        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnSalir_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnIngresar_Click(object sender, RoutedEventArgs e)
        {
            //string grupo="";
            if (cont < 3)//CUENTAS LOS INTENTOS FALLIDOS DE CONEXIÓN
            {
                if (txtUsuario.Text != "" && txtContra.Password != "")//COMPRUEBA QUE SE HAYA ESCRITO ALGO EN LOS CAMPOS DE TEXTO
                {
                    user = txtUsuario.Text;
                    password = txtContra.Password;
                    try
                    {
                        sqlconex = new SqlConnection("Data Source=.;Initial Catalog=ClinicasCR-PrograIII;User ID=" + user + ";Password=" + password);
                        sqlconex.Open();
                        MessageBox.Show("Autenticación correcta");
                        Filtros ventanita = new Filtros();//ABRE LA VENTANA PARA SELECCIONAR FILTROS SI LA CONEXIÓN FUE EXITOSA
                        ventanita.Owner = this;
                        ventanita.ShowDialog();
                        this.Close();

                        //string comando = "select v.Grupo from VIS_USUARIOSXGRUPOS as v where v.Usuario = 'auditor1'";
                        //SqlCommand cmd = new SqlCommand(comando, sqlconex);
                        //SqlDataReader result = cmd.ExecuteReader();
                        //while (result.Read())
                        //{
                        //    grupo = result[0].ToString();
                        //}
                        //sqlconex.Close();

                        //if (grupo.Equals("auditores"))
                        //{
                        //    sqlconex = new SqlConnection();
                        //    sqlconex.Open();
                        //    MessageBox.Show("Autenticación correcta");
                        //    Filtros ventanita = new Filtros();
                        //    ventanita.Owner = this;
                        //    ventanita.ShowDialog();
                        //    this.Close();
                        //}
                        //else
                        //{
                        //    MessageBox.Show("El usuario ingresado no pertenece al rol de auditoría");
                        //}


                    }
                    catch (Exception error)
                    {
                        //SI LA CONTRASEÑA O EL USUARIO NO SON LOS CORRECTOS SE AUMENTA EL CONTADOR DE ERRORES
                        MessageBox.Show("No se pudo realizar la conexión. Intentos restantes: "+(3-cont));
                        txtContra.Password = "";
                        txtUsuario.Text = "";
                        cont++;
                    }
                }
            }
            else
            {
                //SI EL CONTADOR DE ERRORES ES IGUAL O MAYOR A 3, SE EJECUTA EL PA PARA BLOQUEAR AL USUARIO DESDE LA BASE DE DATOS
                sqlconex = new SqlConnection("Data Source=.;Initial Catalog=ClinicasCR-PrograIII;Integrated Security=True");//SE GENERA UNA CONEXIÓN PARA PODER EJECUTAR EL PA
                sqlconex.Open();
                string comando = "exec PA_BLOQUEAR_USUARIO 'auditor1'";
                SqlCommand cmd = new SqlCommand(comando, sqlconex);
                cmd.ExecuteNonQuery();//EJECUCIÓN DEL COMANDO EN LA BASE DE DATOS
                sqlconex.Close();//SE CIERRA LA CONEXIÓN
                MessageBox.Show("Usuario bloqueado");
                this.Close();//CIERRA LA APLICACIÓN
            }
        }
    }
}

