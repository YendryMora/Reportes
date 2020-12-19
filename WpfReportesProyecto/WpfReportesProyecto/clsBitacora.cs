using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfReportesProyecto
{
    public class clsBitacora
    {
        public int idTransaccion { get; set; }
        public char tipoProceso { get; set; }
        public string servidor { get; set; }
        public string baseDatos { get; set; }
        public string tabla { get; set; }
        public string regAnterior { get; set; }
        public string regNuevo { get; set; }
        public string usuario { get; set; }
        public string app { get; set; }
        public string equipo { get; set; }
        public string fechaMov { get; set; }
    }
}
