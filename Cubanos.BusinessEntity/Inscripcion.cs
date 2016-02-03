using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cubanos.BusinessEntity
{
    public class Inscripcion
    {
        public Inscripcion() 
        {
            this.Paquetes = new List<Paquete>();
            this.Cursos = new List<Curso>();
            this.FechaRegistro = DateTime.Now;
            this.Estado = true;
        }

        public Int32 Id { get; set; }
        public Int32 ClienteId { get; set; }
        public Cliente Cliente { get; set; }
        //public Int32 CursoId { get; set; }
        //public Curso Curso { get; set; }
        //public Int32 PaqueteId { get; set; }
        //public Paquete Paquete { get; set; }
        public DateTime FechaRegistro { get; set; }
        public DateTime? FechaInicio { get; set; }
        public DateTime? FechaFin { get; set; }
        public Decimal Total { get; set; }
        //public Int32 NroCuotas { get; set; }
        public Boolean Estado { get; set; }
        public List<Curso> Cursos{ get; set; }
        public List<Paquete> Paquetes { get; set; }
    }
}
