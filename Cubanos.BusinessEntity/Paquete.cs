using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cubanos.BusinessEntity
{
    public class Paquete
    {
        public Paquete() 
        {
            this.Cursos = new List<Curso>();
            this.Inscripciones = new List<Inscripcion>();
        }

        public Int32 Id { get; set; }
        public String Nombre { get; set; }
        public Decimal Precio { get; set; }
        public DateTime FechaRegistro { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public Int32 Stock { get; set; }
        public List<Curso> Cursos { get; set; }
        public List<Inscripcion> Inscripciones { get; set; }
    }
}
