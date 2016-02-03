using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;
using System.Data.Entity;

namespace Cubanos.Repository
{
    public class EmpleadoRepository:MasterRepository, IEmpleadoRepository
    {
        public IEnumerable<Empleado> GetEmpleados(string criterio, Boolean estado)
        {
            //var query = from e in Context.Empleados.Include("Cargo")
            var query = from e in Context.Empleados.Include(c => c.Cargo)
                        select e;

            if (!String.IsNullOrEmpty(criterio))
	        {
                query = from q in query
                        where q.Dni.Contains(criterio) 
                        || (q.ApellidoPaterno +" "+q.ApellidoMaterno +" "+ q.Nombres).Contains(criterio)
                        select q;
	        }

            if(estado.Equals(true))
            {
                query = from e in query
                        where e.Estado.Equals(true)
                        select e;
            }

            return query;
        }

        public Empleado GetEmpleado(int idEmpleado)
        {
            var query = Context.Empleados.SingleOrDefault(e=>e.Id.Equals(idEmpleado));
            return query;
        }

        public void AddEmpleado(Empleado Empleado)
        {
            Context.Empleados.Add(Empleado);
            Context.SaveChanges();
        }

        public void UpdateEmpleado(Empleado Empleado)
        {
            Context.Entry(Empleado).State = EntityState.Modified;
            Context.SaveChanges();
        }

        public void RemoveEmpleado(int idEmpleado)
        {
            throw new NotImplementedException();
        }        
    }
}
