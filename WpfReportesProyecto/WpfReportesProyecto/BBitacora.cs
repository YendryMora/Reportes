using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfReportesProyecto
{
    public class BBitacora
    {
        private BitacoraDAL bitaDALObj = new BitacoraDAL();
        public List<clsBitacora> FiltroTipoProcedimiento(char tipo)
        {
            return bitaDALObj.FiltroTipoProcedimiento(tipo);
        }

        public List<clsBitacora> FiltroFecha(string fecha)
        {
            return bitaDALObj.FiltroFecha(fecha);
        }

        public List<clsBitacora> FiltroUsuario(string usuario)
        {
            return bitaDALObj.FiltroUsuario(usuario);
        }

        public List<clsBitacora> FiltroTablas(string tabla)
        {
            return bitaDALObj.FiltroTablas(tabla);
        }

        public List<clsBitacora> FiltroEquipo(string equipo)
        {
            return bitaDALObj.FiltroEquipo(equipo);
        }

        public List<clsBitacora> FiltroTodos(char tipo, string Fecha, string tabla, string usuario, string equipo)
        {
            return bitaDALObj.FiltroTodos(tipo, Fecha, tabla, usuario,equipo);
        }
    }
}
