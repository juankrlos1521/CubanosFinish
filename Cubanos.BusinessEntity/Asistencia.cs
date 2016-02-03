using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cubanos.BusinessEntity
{
    public class Asistencia
    {
        //public Int32 Id { get; set; }
        public Int32 ClienteId { get; set; }
        public Cliente Cliente { get; set; }
        public Int32 CursoId { get; set; }
        public Curso Curso { get; set; }
        public DateTime Fecha { get; set; }
        public Boolean Estado { get; set; }
    }
}
