using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cubanos.BusinessEntity
{
    public class Cuota
    {
        public Int32 Id { get; set; }
        public Decimal Monto { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public String Concepto { get; set; }
        public Boolean Estado { get; set; }
    }
}
