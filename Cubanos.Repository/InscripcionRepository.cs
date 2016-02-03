using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;
using System.Data.Entity;

namespace Cubanos.Repository
{
    public class InscripcionRepository:MasterRepository,IInscripcionRepository
    {
        public void AddInscripcionCursos(Inscripcion inscripcion)
        {
            if (inscripcion.ClienteId == 0)
            {
                Context.Entry(inscripcion.Cliente).State = EntityState.Added;
            }
            else
            {
                Context.Entry(inscripcion.Cliente).State = EntityState.Unchanged;
            }

            inscripcion.Cursos.ForEach(i => 
            {
                i.Stock = i.Stock - 1;
                Context.Entry(i).State = EntityState.Modified;
                Context.Entry(i.Empleado).State = EntityState.Unchanged;
            });
            Context.Inscripciones.Add(inscripcion);
            Context.SaveChanges();
        }

        public IEnumerable<Inscripcion> GetAllInscripciones(String criterio) 
        {
            var query = from q in Context.Inscripciones.Include(c => c.Cliente)
                        select q;

            if (!String.IsNullOrEmpty(criterio))
            {
                query = from c in query
                        where c.Cliente.Dni.Contains(criterio)
                        select c;
            }
            return query;
        }
    }
}
