using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using Microsoft.Practices.Unity;
using Cubanos.BusinessEntity;
using Cubanos.Service;

namespace Cubanos.Web.Clientes
{
    public partial class Inscripciones : System.Web.UI.Page
    {
        [Dependency]
        public IInscripcionService _InscripcionService { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public IEnumerable<Inscripcion> GetInscripciones([Control("txtCriterio")] String criterio)
        {
            return _InscripcionService.GetAllInscripciones(criterio);
        }
    }
}