using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;

namespace Cubanos.Repository
{
    public interface IPaqueteRepository
    {
        IEnumerable<Paquete> GetPaquetes(String criterio);
        Paquete GetPaquete(Int32 id);
    }
}
