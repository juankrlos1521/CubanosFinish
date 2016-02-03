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
    public class CuotaMap:EntityTypeConfiguration<Cuota>
    {
        public CuotaMap() 
        {
            this.HasKey(c => c.Id);
            this.Property(c => c.Id).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            this.Property(c => c.Monto).HasPrecision(8, 2).IsRequired();
            this.Property(c => c.FechaVencimiento).IsRequired();
            this.Property(c => c.Concepto).HasMaxLength(200).IsOptional();
            this.Property(c => c.Estado).HasColumnType("bit").IsRequired();
            this.ToTable("Cuota");
        }
    }
}
