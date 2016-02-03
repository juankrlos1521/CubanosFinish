﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Cubanos.Repository;
using Microsoft.Practices.Unity;
using System.Web.ModelBinding;
using Cubanos.BusinessEntity;
using Cubanos.Service;

namespace Cubanos.Web.Clientes
{
    public partial class frmRegistrarCliente : System.Web.UI.Page
    {
        [Dependency]
        public ICubanosGymService _cubanosGymService { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var acc = Request.QueryString["acc"];
            var id = Request.QueryString["id"];

            var masculino = fvCliente.FindControl("RaBtnMasculino") as RadioButton;
            var femenino = fvCliente.FindControl("RaBtnFemenino") as RadioButton;

            var cliente = _cubanosGymService.GetCliente(Int32.Parse(id));

            if (acc != null && acc=="editar")
            {
                fvCliente.DefaultMode = FormViewMode.Edit;
                if (cliente.Sexo == true)
                {
                    masculino.Checked = true;
                    femenino.Checked = false;
                }
                else
                {
                    masculino.Checked = false;
                    femenino.Checked = true;
                }
            }
            else if (acc != null && acc == "eliminar" && id != null)
            {
                var idCliente = Int32.Parse(id.ToString());
                _cubanosGymService.EliminarCliente(idCliente);
                Response.Redirect("frmListarCliente.aspx");
            }
        }

        public void InsertarCliente(Cliente _cliente)
        {
            if (ModelState.IsValid)
            {
                using (var context = new DbCubanosContext())
                {
                    Cliente dni = context.Clientes.FirstOrDefault(c => c.Dni.ToUpper() == _cliente.Dni.ToUpper());
                    if (dni == null)
                    {
                        _cubanosGymService.InsertarCliente(_cliente);
                        Response.Redirect("frmListarCliente.aspx");
                    }
                    else
                    {
                        ModelState.AddModelError("Dni", "Dni Duplicado");
                    }
                }
            }
        }

        public Cliente GetCliente([QueryString("id")] Int32 id) 
        {
            var cliente = _cubanosGymService.GetCliente(id);            
            return cliente;
        }

        public void ActualizarCliente(Cliente cliente)
        {
            if (ModelState.IsValid)
            {
                _cubanosGymService.Actualizar(cliente);
                Response.Redirect("frmListarCliente.aspx");
            }
            
        }
    }
}