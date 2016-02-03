using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;

namespace Cubanos.Service
{
    public interface IEmpleadoService
    {
        IEnumerable<Empleado> GetEmpleados(String criterio, Boolean estado);
        Empleado GetEmpleado(Int32 idEmpleado);
        void AddEmpleado(Empleado Empleado);
        void UpdateEmpleado(Empleado Empleado);
        void RemoveEmpleado(Int32 idEmpleado);        
    }
}
