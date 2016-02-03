using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;

namespace Cubanos.Service
{
    public interface IInscripcionService
    {
        void AddInscripcionCursos(Inscripcion inscripcion);
        IEnumerable<Inscripcion> GetAllInscripciones(String criterio);
    }
}
