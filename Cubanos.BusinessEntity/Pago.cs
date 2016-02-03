﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cubanos.BusinessEntity
{
    public class Pago
    {
        public Int32 Id { get; set; }
        public Int32 InscripcionId { get; set; }
        public Inscripcion Inscripcion { get; set; }
        public Int32 CuotaId { get; set; }
        public Cuota Cuota { get; set; }
        public Decimal Monto { get; set; }
        public Decimal FechaPago { get; set; }
    }
}
