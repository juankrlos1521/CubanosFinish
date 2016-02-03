using System;
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
    public partial class frmInscripcion : System.Web.UI.Page
    {
        [Dependency]
        public ICubanosGymService _ClienteService { get; set; }
        [Dependency]
        public ICursoService _CursoService { get; set; }
        [Dependency]
        public IEmpleadoService _EmpleadoService { get; set; }
        [Dependency]
        public IInscripcionService _InscripcionService { get; set; }
        [Dependency]
        public IPaqueteService _PaqueteService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var inscripcion = new Inscripcion();

                lvDetallesCursos.DataSource = inscripcion.Cursos;
                lvDetallesCursos.DataBind();

                Cache.Insert("inscripcion", inscripcion);
            }
        }

        protected void btnBuscarDni_Click(object sender, EventArgs e)
        {
            var dni = txtDniCliente.Text.ToString();

            var cliente = _ClienteService.GetClientePorDni(dni);

            if (!String.IsNullOrEmpty(txtDniCliente.Text))
            {
                if (cliente != null)
                {
                    txtMensajeDni.Text = "";
                    txtMensajeDni.Visible = false;
                    hfIdCLiente.Value = cliente.Id.ToString();
                    txtNombreCliente.Text = cliente.ApellidoPaterno.ToString() + " " + cliente.ApellidoMaterno.ToString() + " " + cliente.Nombres.ToString();
                    txtDireccionCliente.Text = cliente.Direccion.ToString();
                    txtTelefonoCliente.Text = cliente.Telefono.ToString();

                    var inscripcion = Cache.Get("inscripcion") as Inscripcion;
                    inscripcion.ClienteId = cliente.Id;
                    inscripcion.Cliente = cliente;

                    Cache.Insert("inscripcion", inscripcion);
                }
                else
                {
                    txtMensajeDni.Text = "Este cliente no se encuentra registrado";
                    txtMensajeDni.Visible = true;
                    hfIdCLiente.Value = "";
                    txtNombreCliente.Text = "";
                    txtDireccionCliente.Text = "";
                    txtTelefonoCliente.Text = "";
                }
            }
            else
            {
                txtMensajeDni.Text = "Debe ingresar un Dni";
                txtMensajeDni.Visible = true;
            }
        }

        public IEnumerable<Curso> GetCursosInscripcion()
        {
            return _CursoService.GetCursosInscripcion("");
        }

        protected void lvCursos_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var idCurso = Int32.Parse((String)e.CommandArgument);
            var curso = _CursoService.GetCurso(idCurso);
            var empleado = _EmpleadoService.GetEmpleado(curso.EmpleadoId);
            var inscripcion = Cache.Get("inscripcion") as Inscripcion;
            var existe = inscripcion.Cursos.Any(d => d.Id.Equals(idCurso));

            if (!existe)
            {
                lblMensajeCurso.Text = "";
                lblMensajeCurso.Visible = false;
                lblDetalles.Text = "Detalles";
                lblDetalles.Visible = true;

                curso.Empleado = empleado;

                inscripcion.Cursos.Add(curso);

                /*recalculo los totales despues de agregar*/
                CalcularTotales(inscripcion);

                lvDetallesCursos.DataSource = inscripcion.Cursos;
                lvDetallesCursos.DataBind();

                Cache.Insert("inscripcion", inscripcion);
            }
            else
            {
                lblMensajeCurso.Text = "Ese curso ya ha sido agregado";
                lblMensajeCurso.Visible = true;
            }
        }

        protected void lvDetallesCursos_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "quitarcurso")
            {
                var idCurso = Int32.Parse(e.CommandArgument.ToString());

                var inscripcion = Cache.Get("inscripcion") as Inscripcion;
                var curso = inscripcion.Cursos.SingleOrDefault(d => d.Id.Equals(idCurso));

                if (curso != null)
                {
                    inscripcion.Cursos.Remove(curso);
                    /*recalculo los totales despues de quitar*/
                    CalcularTotales(inscripcion);

                    lvDetallesCursos.DataSource = inscripcion.Cursos;
                    lvDetallesCursos.DataBind();

                    Cache.Insert("inscripcion", inscripcion);
                }
            }
        }

        public void CalcularTotales(Inscripcion inscripcion)
        {
            inscripcion.Total = inscripcion.Cursos.Sum(c => c.Precio) * Decimal.Parse("1.18");

            txtSubTotal.Text = String.Format("{0:0.00}", inscripcion.Cursos.Sum(c => c.Precio));
            txtTotal.Text = String.Format("{0:0.00}", inscripcion.Total);
            txtIgv.Text = String.Format("{0:0.00}", (inscripcion.Cursos.Sum(c => c.Precio) * Decimal.Parse("0.18")));
        }

        public void btnGuardarInscripcion_Click(object sender, EventArgs e)
        {
            var inscripcion = Cache.Get("inscripcion") as Inscripcion;

            /* fechas para cursos */
            //inscripcion.FechaInicio = null;
            //inscripcion.FechaFin = null;
            //Cache.Insert("inscripcion", inscripcion);
            /* fin fechas para cursos*/

            _InscripcionService.AddInscripcionCursos(inscripcion);
            Response.Redirect("Inscripciones");
        }

        ///limite curso
        public IEnumerable<Curso> GetLibreInscripcion()
        {
            return _CursoService.GetLibreInscripcion("", true);
        }

        protected void lvLibre_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var idCurso = Int32.Parse((String)e.CommandArgument);
            var curso = _CursoService.GetCurso(idCurso);
            var empleado = _EmpleadoService.GetEmpleado(curso.EmpleadoId);
            var inscripcion = Cache.Get("inscripcion") as Inscripcion;
            var existe = inscripcion.Cursos.Any(d => d.Id.Equals(idCurso));

            if (!existe)
            {
                lblDetalles.Text = "Detalles";
                lblDetalles.Visible = true;

                curso.Empleado = empleado;

                inscripcion.Cursos.Add(curso);

                /*recalculo los totales despues de agregar*/
                CalcularLibres(inscripcion);

                lvDetallesLibres.DataSource = inscripcion.Cursos;
                lvDetallesLibres.DataBind();

                Cache.Insert("inscripcion", inscripcion);
            }
            else
            {
                //lblMensajeCurso.Text = "Ese curso ya ha sido agregado";
                //lblMensajeCurso.Visible = true;
            }
        }

        public void CalcularLibres(Inscripcion inscripcion)
        {
            inscripcion.Total = inscripcion.Cursos.Sum(c => c.Precio);

            //txtSubLibre.Text = String.Format("{0:0.00}", inscripcion.Cursos.Sum(c => c.Precio));
            //txtLibreIgv.Text = String.Format("{0:0.00}", inscripcion.Total);
            //txtLibreTotal.Text = String.Format("{0:0.00}", (inscripcion.Cursos.Sum(c => c.Precio) * Decimal.Parse("0.18")));
            txtLibreTotal.Text = String.Format("{0:0.00}", inscripcion.Cursos.Sum(c => c.Precio));
        }

        protected void lvDetallesLibres_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "quitarlibre")
            {
                var idCurso = Int32.Parse(e.CommandArgument.ToString());

                var inscripcion = Cache.Get("inscripcion") as Inscripcion;
                var curso = inscripcion.Cursos.SingleOrDefault(d => d.Id.Equals(idCurso));

                if (curso != null)
                {
                    inscripcion.Cursos.Remove(curso);
                    /*recalculo los totales despues de quitar*/
                    CalcularLibres(inscripcion);

                    lvDetallesLibres.DataSource = inscripcion.Cursos;
                    lvDetallesLibres.DataBind();

                    Cache.Insert("inscripcion", inscripcion);
                }
            }
        }

        public IEnumerable<Paquete> GetPaquetes()
        {
            return _PaqueteService.GetPaquetes("");
        }

        protected void lvPaquetes_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var idPaquete = Int32.Parse(e.CommandArgument.ToString());
            var paquete = _PaqueteService.GetPaquete(idPaquete);

            if (e.CommandName == "agregarpaquete")
            {
                var inscripcion = Cache.Get("inscripcion") as Inscripcion;
                var existe = inscripcion.Paquetes.Any(d => d.Id.Equals(idPaquete));

                if (!existe)
                {
                    inscripcion.Paquetes.Add(paquete);
                    lvDetallePaquete.DataSource = inscripcion.Paquetes;
                    lvDetallePaquete.DataBind();
                    CalcularPaquetes(inscripcion);
                    Cache.Insert("inscripcion", inscripcion);
                }
                else
                {
                    //aviso de que no se encuentra
                }
            }

            if (e.CommandName == "detallepaquete")
            {
                //codigo para ver el detalle de cada paquete
            }
        }

        protected void lvDetallePaquete_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "quitarpaquete")
            {
                var idpaquete = Int32.Parse(e.CommandArgument.ToString());
                var inscripcion = Cache.Get("inscripcion") as Inscripcion;

                var paquete = inscripcion.Paquetes.SingleOrDefault(p=>p.Id.Equals(idpaquete));

                if(paquete != null)
                {
                    inscripcion.Paquetes.Remove(paquete);
                    lvDetallePaquete.DataSource = inscripcion.Paquetes;
                    lvDetallePaquete.DataBind();
                    CalcularPaquetes(inscripcion);
                    Cache.Insert("inscripcion", inscripcion);
                }
            }
        }

        public void CalcularPaquetes(Inscripcion inscripcion)
        {
            inscripcion.Total = inscripcion.Paquetes.Sum(p => p.Precio);

            //txtSubLibre.Text = String.Format("{0:0.00}", inscripcion.Cursos.Sum(c => c.Precio));
            //txtLibreIgv.Text = String.Format("{0:0.00}", inscripcion.Total);
            //txtLibreTotal.Text = String.Format("{0:0.00}", (inscripcion.Cursos.Sum(c => c.Precio) * Decimal.Parse("0.18")));
            txtTotalPaquete.Text = String.Format("{0:0.00}", inscripcion.Paquetes.Sum(c => c.Precio));
        }
    }
}