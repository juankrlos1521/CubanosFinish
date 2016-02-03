using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Unity;
using Cubanos.BusinessEntity;
using Cubanos.Repository;

namespace Cubanos.Service
{
    public class PaqueteService:IPaqueteService
    {
        [Dependency]
        public IPaqueteRepository _PaqueteRepository { get; set; }
        public IEnumerable<Paquete> GetPaquetes(String criterio) 
        {
            return _PaqueteRepository.GetPaquetes(criterio);
        }
        public Paquete GetPaquete(Int32 id) 
        {
            return _PaqueteRepository.GetPaquete(id);
        }
    }
}
