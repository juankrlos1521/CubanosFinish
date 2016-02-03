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
    class AsistenciaMap:EntityTypeConfiguration<Asistencia>
    {
        public  AsistenciaMap()
        {
            this.HasKey(a => new { a.ClienteId, a.CursoId });
            this.Property(a => a.Fecha).IsRequired();
            this.Property(a => a.Estado).IsRequired();
        }
    }
}
