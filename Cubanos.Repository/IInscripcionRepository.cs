using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;

namespace Cubanos.Repository
{
    public interface IInscripcionRepository
    {
        void AddInscripcionCursos(Inscripcion inscripcion);
        IEnumerable<Inscripcion> GetAllInscripciones(String criterio);
    }
}
