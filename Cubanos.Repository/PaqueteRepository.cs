using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;
using System.Data.Entity;

namespace Cubanos.Repository
{
    public class PaqueteRepository:MasterRepository, IPaqueteRepository
    {
        public IEnumerable<Paquete> GetPaquetes(String criterio)
        {
            //dc.Students.Where(s => s.Courses.Any(c => c.CourseID == courseID))
            var query = from q in Context.Paquetes
                        //where fecha.CompareTo(q.FechaVencimiento) >= 0
                        select q;

            if (!String.IsNullOrEmpty(criterio))
            {
                query = from c in query
                        where c.Nombre.Contains(criterio)
                        select c;
            }
            return query;
        }

        public Paquete GetPaquete(Int32 id) 
        {
            return Context.Paquetes.SingleOrDefault(p => p.Id.Equals(id));
        }
    }
}
