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
    public class CursoMap:EntityTypeConfiguration<Curso>
    {
        public CursoMap()
        {
            this.HasKey(c => c.Id);
            this.Property(c => c.Id).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            this.Property(c => c.Nombre).HasMaxLength(200).IsRequired();
            this.Property(c => c.Sesiones).IsOptional();
            this.Property(c => c.LimiteTiempo).HasColumnType("bit").IsRequired();
            this.Property(c => c.FechaInicio).IsOptional();
            this.Property(c => c.FechaFin).IsOptional();
            this.Property(c => c.Precio).HasPrecision(8,2).IsRequired();
            this.Property(c => c.Stock).IsOptional();
            this.HasRequired(c => c.Empleado).WithMany(e => e.Cursos).HasForeignKey(c => c.EmpleadoId).WillCascadeOnDelete(false);                       
            this.ToTable("Curso");
        }
    }
}
