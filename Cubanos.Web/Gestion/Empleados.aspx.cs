using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cubanos.BusinessEntity;
using Microsoft.Practices.Unity;
using Cubanos.Service;
using System.Web.ModelBinding;

namespace Cubanos.Web.Gestion
{
    public partial class Empleados : System.Web.UI.Page
    {
        [Dependency]
        public IEmpleadoService _EmpleadoService { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Empleado> GetEmpleados([Control("txtCriterio")] String criterio)
        {
            return _EmpleadoService.GetEmpleados(criterio,false);
        }
    }
}