using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;
using Microsoft.Practices.Unity;
using Cubanos.Repository;
using Cubanos.BusinessEntity;

namespace Cubanos.Service
{
    public class EmpleadoService:IEmpleadoService
    {
        [Dependency]
        public IEmpleadoRepository _EmpleadoRepository { get; set; }
        public IEnumerable<Empleado> GetEmpleados(string criterio, Boolean estado)
        {
            return _EmpleadoRepository.GetEmpleados(criterio,estado);
        }

        public Empleado GetEmpleado(int idEmpleado)
        {
            return _EmpleadoRepository.GetEmpleado(idEmpleado);
        }

        public void AddEmpleado(Empleado Empleado)
        {
            _EmpleadoRepository.AddEmpleado(Empleado);
        }

        public void UpdateEmpleado(Empleado Empleado)
        {
            _EmpleadoRepository.UpdateEmpleado(Empleado);
        }

        public void RemoveEmpleado(int idEmpleado)
        {
            throw new NotImplementedException();
        }
    }
}
