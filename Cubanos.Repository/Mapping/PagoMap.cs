using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace Cubanos.Repository.Mapping
{
    public class PagoMap:EntityTypeConfiguration<Pago>
    {
        public PagoMap() 
        {
            this.HasKey(p => new {p.InscripcionId,p.CuotaId });
            //this.Property(p=>p.Id).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity)
            this.Property(p => p.Monto).HasPrecision(8,2).IsRequired();
            this.Property(p => p.FechaPago).IsRequired();
            this.ToTable("Pago");
        }
    }
}
