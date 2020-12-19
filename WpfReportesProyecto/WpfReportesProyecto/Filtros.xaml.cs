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
using System.Windows.Shapes;

namespace WpfReportesProyecto
{
    /// <summary>
    /// Interaction logic for Filtros.xaml
    /// </summary>
    public partial class Filtros : Window
    {
        public Filtros()
        {
            InitializeComponent();
            limpiar();
        }

        private BBitacora bBitaObj = new BBitacora();
        private void btnGenerar_Click(object sender, RoutedEventArgs e)
        {
            switch (boxFiltros.SelectedIndex)//EVALUA CUAL FILTRO SELECCIONÓ EL USUARIO
            {
                case 1://FILTRAR POR FECHA
                    List<clsBitacora> BitaInfoList = bBitaObj.FiltroFecha(txtFecha.Text);

                    if (BitaInfoList.Count > 0)
                    {
                        BitacoraCrystalReport bitacoraInfoCrystalReport = new BitacoraCrystalReport();
                        Muestra.Display_report(bitacoraInfoCrystalReport, BitaInfoList, this);
                    }
                    else
                    {
                        MessageBox.Show("No existen datos en la tabla", "Información Veterinario", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    break;

                case 2://FILTRAR POR TIPO DE PROCESO
                    List<clsBitacora> BitaInfoList2 = bBitaObj.FiltroTipoProcedimiento(boxProceso.Text.ElementAt(0));

                    if (BitaInfoList2.Count > 0)
                    {
                        BitacoraCrystalReport bitacoraInfoCrystalReport = new BitacoraCrystalReport();
                        Muestra.Display_report(bitacoraInfoCrystalReport, BitaInfoList2, this);
                    }
                    else
                    {
                        MessageBox.Show("No existen datos en la tabla", "Información Veterinario", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    break;

                case 3://FILTRAR POR TABLA
                    List<clsBitacora> BitaInfoList3 = bBitaObj.FiltroTablas(boxTablas.Text);

                    if (BitaInfoList3.Count > 0)
                    {
                        BitacoraCrystalReport bitacoraInfoCrystalReport = new BitacoraCrystalReport();
                        Muestra.Display_report(bitacoraInfoCrystalReport, BitaInfoList3, this);
                    }
                    else
                    {
                        MessageBox.Show("No existen datos en la tabla", "Información Veterinario", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    break;

                case 4://FILTRAR POR USUARIO
                    List<clsBitacora> BitaInfoList4 = bBitaObj.FiltroUsuario(boxUsuarios.Text);

                    if (BitaInfoList4.Count > 0)
                    {
                        BitacoraCrystalReport bitacoraInfoCrystalReport = new BitacoraCrystalReport();
                        Muestra.Display_report(bitacoraInfoCrystalReport, BitaInfoList4, this);
                    }
                    else
                    {
                        MessageBox.Show("No existen datos en la tabla", "Información Veterinario", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    break;

                case 5://FILTRAR POR NOMBRE DE EQUIPO
                    List<clsBitacora> BitaInfoList5 = bBitaObj.FiltroEquipo(txtEquipo.Text);

                    if (BitaInfoList5.Count > 0)
                    {
                        BitacoraCrystalReport bitacoraInfoCrystalReport = new BitacoraCrystalReport();
                        Muestra.Display_report(bitacoraInfoCrystalReport, BitaInfoList5, this);
                    }
                    else
                    {
                        MessageBox.Show("No existen datos en la tabla", "Información Veterinario", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    break;

                case 6://APLICAR TODOS LOS FILTROS
                    List<clsBitacora> BitaInfoList6 = bBitaObj.FiltroTodos(boxProceso.Text.ElementAt(0), txtFecha.Text, boxTablas.Text, boxUsuarios.Text, txtEquipo.Text);

                    if (BitaInfoList6.Count > 0)
                    {
                        BitacoraCrystalReport bitacoraInfoCrystalReport = new BitacoraCrystalReport();
                        Muestra.Display_report(bitacoraInfoCrystalReport, BitaInfoList6, this);
                    }
                    else
                    {
                        MessageBox.Show("No existen datos en la tabla", "Información Veterinario", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    break;
            }

            limpiar();

        }

        private void boxFiltros_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            /*SE DESACITIVAN O ACTIVAN LOS COMBOBOX 
             Y CAMPOS DE TEXTO SEGÚN SEA EL FILTRO QUE SELECCIONÓ EL USUARIO*/
            if (boxFiltros.SelectedIndex == 0)
            {
                boxProceso.IsEnabled = false;
                boxTablas.IsEnabled = false;
                boxUsuarios.IsEnabled = false;
                txtEquipo.IsEnabled = false;
                txtFecha.IsEnabled = false;
                btnGenerar.IsEnabled = false;
            }
            if (boxFiltros.SelectedIndex == 1)
            {
                boxProceso.IsEnabled = false;
                boxTablas.IsEnabled = false;
                boxUsuarios.IsEnabled = false;
                txtEquipo.IsEnabled = false;
                txtFecha.IsEnabled = true;
                btnGenerar.IsEnabled = true;
            }
            if (boxFiltros.SelectedIndex == 2)
            {
                boxProceso.IsEnabled = true;
                boxTablas.IsEnabled = false;
                boxUsuarios.IsEnabled = false;
                txtEquipo.IsEnabled = false;
                txtFecha.IsEnabled = false;
                btnGenerar.IsEnabled = true;
            }
            if (boxFiltros.SelectedIndex == 3)
            {
                boxProceso.IsEnabled = false;
                boxTablas.IsEnabled = true;
                txtFecha.IsEnabled = false;
                boxUsuarios.IsEnabled = false;
                txtEquipo.IsEnabled = false;
                btnGenerar.IsEnabled = true;
            }
            if (boxFiltros.SelectedIndex == 4)
            {
                boxProceso.IsEnabled = false;
                boxTablas.IsEnabled = false;
                txtFecha.IsEnabled = false;
                boxUsuarios.IsEnabled = true;
                txtEquipo.IsEnabled = false;
                btnGenerar.IsEnabled = true;
            }
            if (boxFiltros.SelectedIndex == 5)
            {
                boxProceso.IsEnabled = false;
                boxTablas.IsEnabled = false;
                txtFecha.IsEnabled = false;
                boxUsuarios.IsEnabled = false;
                txtEquipo.IsEnabled = true;
                btnGenerar.IsEnabled = true;
            }
            if (boxFiltros.SelectedIndex == 6)
            {
                boxProceso.IsEnabled = true;
                boxTablas.IsEnabled = true;
                txtFecha.IsEnabled = true;
                boxUsuarios.IsEnabled = true;
                txtEquipo.IsEnabled = true;
                btnGenerar.IsEnabled = true;
            }
        }

        private void limpiar()
        {
            txtFecha.Text = "";
            boxFiltros.SelectedIndex = 0;
            boxProceso.SelectedIndex = 0;
            boxTablas.SelectedIndex = 0;
            boxUsuarios.SelectedIndex = 0;
            txtEquipo.Text = "";
        }

        private void boxTablas_IsEnabledChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            boxTablas.ItemsSource = clsConexion1.CargarTablasBD();//CARGA EL COMBOBOX CON LAS TABLAS DE LA BD
            boxTablas.DisplayMemberPath = "nombre";
        }

        private void boxUsuarios_IsEnabledChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            boxUsuarios.ItemsSource = clsConexion1.CargarUsuariosBD();//CARGA EL COMBOBOX CON LOS USUSARIOS DE LA BD
            boxUsuarios.DisplayMemberPath = "nombre";
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            limpiar();
        }
    }
}
