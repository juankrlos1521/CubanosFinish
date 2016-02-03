using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cubanos.BusinessEntity;

namespace Cubanos.Service
{
    public interface ICursoService
    {
        IEnumerable<Curso> GetCursos(String criterio);
        Curso GetCurso(Int32 idCurso);
        IEnumerable<Curso> GetCursosInscripcion(String criterio);
        IEnumerable<Curso> GetLibreInscripcion(String criterio, Boolean limite);
        void AddCurso(Curso curso);
        void UpdateCurso(Curso curso);
        void RemoveCurso(Int32 idCurso);
    }
}
