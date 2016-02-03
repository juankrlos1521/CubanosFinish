﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using Cubanos.BusinessEntity;
using Cubanos.Service;
using Microsoft.Practices.Unity;
using System.Web.ModelBinding;

namespace Cubanos.Web.Clientes
{
    public partial class frmListarEjercicios : System.Web.UI.Page
    {
        [Dependency]
        public ICubanosGymService _cubanosGymService { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string name = (Convert.ToString(Request["name"])).ToUpper();
                lblCliente.Text = name;
            }
            catch (Exception)
            {

                lblCliente.Text = "Default";
            }

        }
        public IEnumerable<DetalleEjercicioToRutina> ListarEjercicios()
        {
            int x = Convert.ToInt32(Request["listEjercicios"]);
            return _cubanosGymService.ListarEjercicios(x);
        }
    }
}