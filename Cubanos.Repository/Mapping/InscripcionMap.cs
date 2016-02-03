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
    public class InscripcionMap:EntityTypeConfiguration<Inscripcion>
    {
        public InscripcionMap() 
        {
            this.HasKey(i => i.Id);
            this.Property(i => i.Id).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            this.Property(i => i.FechaRegistro).IsRequired();
            this.Property(i => i.FechaInicio).IsOptional();
            this.Property(i => i.FechaFin).IsOptional();
            this.Property(i => i.Total).HasPrecision(8, 2).IsRequired();
            //this.Property(i => i.NroCuotas).IsRequired();
            this.Property(i => i.Estado).HasColumnType("bit").IsRequired();
            this.HasRequired(i => i.Cliente).WithMany(c=>c.Inscripciones).HasForeignKey(i=>i.ClienteId).WillCascadeOnDelete(false);
            //this.HasRequired(i => i.Curso).WithMany().HasForeignKey(i => i.CursoId).WillCascadeOnDelete(false);
            this.HasMany(i => i.Cursos).WithMany(c => c.Inscripciones).Map(t => t.ToTable("InscripcionCurso").MapLeftKey("InscripcionId").MapRightKey("CursoId"));
            this.HasMany(i => i.Paquetes).WithMany(p => p.Inscripciones).Map(t => t.ToTable("InscripcionPaquete").MapLeftKey("InscripcionId").MapRightKey("PaqueteId"));
            this.ToTable("Inscripcion");
        }
    }
}
