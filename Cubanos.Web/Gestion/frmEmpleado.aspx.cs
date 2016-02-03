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

namespace Cubanos.Web.Gestion
{
    public partial class frmEmpleado : System.Web.UI.Page
    {
        [Dependency]
        public IEmpleadoService _EmpleadoService { get; set; }
        [Dependency]
        public ICargoService _CargoService { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var acc = Request.QueryString["acc"];
            var id = Request.QueryString["id"];            

            if (acc!=null && acc=="editar")
            {
                fvEmpleado.DefaultMode = FormViewMode.Edit;
                var empleado = _EmpleadoService.GetEmpleado(Int32.Parse(id));
                var masculino = fvEmpleado.FindControl("rbtnMasculino") as RadioButton;
                var femenino = fvEmpleado.FindControl("rbtnFemenino") as RadioButton;

                var activo = fvEmpleado.FindControl("rbtnActivo") as RadioButton;
                var inactivo = fvEmpleado.FindControl("rbtnInactivo") as RadioButton;

                if (empleado.Sexo == true)
                {
                    masculino.Checked = true;
                    femenino.Checked = false;
                }else
                {
                    masculino.Checked = false;
                    femenino.Checked = true;
                }

                if (empleado.Estado == true)
                {
                    activo.Checked = true;
                    inactivo.Checked = false;
                }
                else 
                {
                    activo.Checked = false;
                    inactivo.Checked = true;
                }
            }            
        }

        public void AddEmpleado(Empleado empleado) 
        {
            if (ModelState.IsValid)
            {
                var masculino = fvEmpleado.FindControl("rbtnMasculino") as RadioButton;
                var femenino = fvEmpleado.FindControl("rbtnFemenino") as RadioButton;

                if (masculino.Checked)
                {
                    empleado.Sexo = true;
                }
                else
                {
                    empleado.Sexo = false;
                }

                empleado.Estado = true;
                _EmpleadoService.AddEmpleado(empleado);
                Response.Redirect("Empleados.aspx");
            }            
        }

        public IEnumerable<Cargo> GetCargos() 
        {
            return _CargoService.GetCargos("");
        }

        public void UpdateEmpleado(Empleado empleado) 
        {
            if (ModelState.IsValid)
            {
                _EmpleadoService.UpdateEmpleado(empleado);
                Response.Redirect("Empleados.aspx");
            }
        }

        public Empleado GetEmpleado([QueryString("id")] Int32 id) 
        {
            var empleado = _EmpleadoService.GetEmpleado(id);
            var masculino = fvEmpleado.FindControl("rbtnMasculino") as RadioButton;
            var femenino = fvEmpleado.FindControl("rbtnFemenino") as RadioButton;

            return empleado;
        }
    }
}