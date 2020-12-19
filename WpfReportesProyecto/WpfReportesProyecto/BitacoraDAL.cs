using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfReportesProyecto
{
    public class BitacoraDAL
    {
        private ReporteDatosDataContext reportDataContextObj = new ReporteDatosDataContext();

        /*METODO PARA FILTRAR LOS DATOS DE LA BITÁCORA POR EL TIPO DE PROCEDIMIENTO (I=INSERCIÓN, M=MODIFICACIÓN Y E=ELIMINACIÓN)
         SE LE ENVIA COMO PARÁMETRO LO QUE SE SELECCIONE DEL COMBO BOX*/
        internal List<clsBitacora> FiltroTipoProcedimiento(char tipo)
        {
            List<clsBitacora> Bitacora = new List<clsBitacora>();
            foreach (var info in reportDataContextObj.bitacoras)
            {
                clsBitacora eBitaObj = new clsBitacora();
                if (tipo.Equals(info.tipoProceso))//AGREGA A LA LISTA SOLO LOS REGISTROS QUE COINCIDEN CON EL TIPO DE PROCESO DEASEADO
                {
                    eBitaObj.idTransaccion = info.idTransaccion;
                    eBitaObj.tipoProceso = info.tipoProceso;
                    eBitaObj.servidor = info.servidor;
                    eBitaObj.baseDatos = info.baseDatos;
                    eBitaObj.tabla = info.tabla;
                    eBitaObj.usuario = info.usuario;
                    eBitaObj.equipo = info.equipo;
                    eBitaObj.fechaMov = info.fechaMov.ToString();
                    Bitacora.Add(eBitaObj);
                }
            }
            return Bitacora;
        }

        internal List<clsBitacora> FiltroFecha(string Fecha)
        {
            List<clsBitacora> Bitacora = new List<clsBitacora>();
            foreach (var info in reportDataContextObj.bitacoras)
            {
                clsBitacora eBitaObj = new clsBitacora();
                if (Fecha.Equals(info.fechaMov.ToShortDateString()))//AGREGA A LA LISTA SOLO LOS REGISTROS QUE COINCIDEN CON EL TIPO DE PROCESO DEASEADO
                {
                    eBitaObj.idTransaccion = info.idTransaccion;
                    eBitaObj.tipoProceso = info.tipoProceso;
                    eBitaObj.servidor = info.servidor;
                    eBitaObj.baseDatos = info.baseDatos;
                    eBitaObj.tabla = info.tabla;
                    eBitaObj.usuario = info.usuario;
                    eBitaObj.equipo = info.equipo;
                    eBitaObj.fechaMov = info.fechaMov.ToString();
                    Bitacora.Add(eBitaObj);
                }
            }
            return Bitacora;
        }

        internal List<clsBitacora> FiltroTablas(string tabla)
        {
            List<clsBitacora> Bitacora = new List<clsBitacora>();
            foreach (var info in reportDataContextObj.bitacoras)
            {
                clsBitacora eBitaObj = new clsBitacora();
                if (tabla.Equals(info.tabla))//AGREGA A LA LISTA SOLO LOS REGISTROS QUE COINCIDEN CON LA TABLA DEASEADO
                {
                    eBitaObj.idTransaccion = info.idTransaccion;
                    eBitaObj.tipoProceso = info.tipoProceso;
                    eBitaObj.servidor = info.servidor;
                    eBitaObj.baseDatos = info.baseDatos;
                    eBitaObj.tabla = info.tabla;
                    eBitaObj.usuario = info.usuario;
                    eBitaObj.equipo = info.equipo;
                    eBitaObj.fechaMov = info.fechaMov.ToString();
                    Bitacora.Add(eBitaObj);
                }
            }
            return Bitacora;
        }

        internal List<clsBitacora> FiltroUsuario(string usuario)
        {
            List<clsBitacora> Bitacora = new List<clsBitacora>();
            foreach (var info in reportDataContextObj.bitacoras)
            {
                clsBitacora eBitaObj = new clsBitacora();
                if (usuario.Equals(info.usuario))//AGREGA A LA LISTA SOLO LOS REGISTROS QUE COINCIDEN CON EL USUARIO DEASEADO
                {
                    eBitaObj.idTransaccion = info.idTransaccion;
                    eBitaObj.tipoProceso = info.tipoProceso;
                    eBitaObj.servidor = info.servidor;
                    eBitaObj.baseDatos = info.baseDatos;
                    eBitaObj.tabla = info.tabla;
                    eBitaObj.usuario = info.usuario;
                    eBitaObj.equipo = info.equipo;
                    eBitaObj.fechaMov = info.fechaMov.ToString();
                    Bitacora.Add(eBitaObj);
                }
            }
            return Bitacora;
        }

        internal List<clsBitacora> FiltroEquipo(string equipo)
        {
            List<clsBitacora> Bitacora = new List<clsBitacora>();
            foreach (var info in reportDataContextObj.bitacoras)
            {
                clsBitacora eBitaObj = new clsBitacora();
                if (equipo.Equals(info.equipo))//AGREGA A LA LISTA SOLO LOS REGISTROS QUE COINCIDEN CON EL NOMBRE DE EQUIPO DEASEADO
                {
                    eBitaObj.idTransaccion = info.idTransaccion;
                    eBitaObj.tipoProceso = info.tipoProceso;
                    eBitaObj.servidor = info.servidor;
                    eBitaObj.baseDatos = info.baseDatos;
                    eBitaObj.tabla = info.tabla;
                    eBitaObj.usuario = info.usuario;
                    eBitaObj.equipo = info.equipo;
                    eBitaObj.fechaMov = info.fechaMov.ToString();
                    Bitacora.Add(eBitaObj);
                }
            }
            return Bitacora;
        }

        internal List<clsBitacora> FiltroTodos(char tipo, string Fecha, string tabla, string usuario, string equipo)
        {
            List<clsBitacora> Bitacora = new List<clsBitacora>();
            foreach (var info in reportDataContextObj.bitacoras)
            {
                clsBitacora eBitaObj = new clsBitacora();
                if ((equipo.Equals(info.equipo)) && 
                    (usuario.Equals(info.usuario)) && 
                    (tabla.Equals(info.tabla)) && 
                    (Fecha.Equals(info.fechaMov.ToShortDateString())) && 
                    (tipo.Equals(info.tipoProceso)))//AGREGA A LA LISTA SOLO LOS REGISTROS QUE COINCIDEN CON TODOS LOS FILTROS
                {
                    eBitaObj.idTransaccion = info.idTransaccion;
                    eBitaObj.tipoProceso = info.tipoProceso;
                    eBitaObj.servidor = info.servidor;
                    eBitaObj.baseDatos = info.baseDatos;
                    eBitaObj.tabla = info.tabla;
                    eBitaObj.usuario = info.usuario;
                    eBitaObj.equipo = info.equipo;
                    eBitaObj.fechaMov = info.fechaMov.ToString();
                    Bitacora.Add(eBitaObj);
                }
            }
            return Bitacora;
        }


    }
}
