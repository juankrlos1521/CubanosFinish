using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.Repository;
using Cubanos.BusinessEntity;
using Microsoft.Practices.Unity;


namespace Cubanos.Service
{
    public class InscripcionService:IInscripcionService
    {
        [Dependency]
        public IInscripcionRepository _InscripcionRepository { get; set; }
        public void AddInscripcionCursos(Inscripcion inscripcion)
        {
            _InscripcionRepository.AddInscripcionCursos(inscripcion);
        }

        public IEnumerable<Inscripcion> GetAllInscripciones(String criterio) 
        {
            return _InscripcionRepository.GetAllInscripciones(criterio);
        }
    }
}
