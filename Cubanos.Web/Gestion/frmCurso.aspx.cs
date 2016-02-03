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

namespace Cubanos.Web.Gestion
{
    public partial class frmCurso : System.Web.UI.Page
    {
        [Dependency]
        public ICursoService _CursoService { get; set; }
        [Dependency]
        public IEmpleadoService _EmpleadoService { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var acc = Request.QueryString["acc"];
            var id = Request.QueryString["id"];

            if (acc!=null && acc=="editar")
            {
                fvCurso.DefaultMode = FormViewMode.Edit;
            }
            else if(acc!=null && acc=="eliminar" && id!=null)
            {
                var idCurso = Int32.Parse(id.ToString());
                _CursoService.RemoveCurso(idCurso);
                Response.Redirect("Cursos.aspx");
            }
        }

        public void AddCurso(Curso curso)
        {
            if (ModelState.IsValid)
            {
                _CursoService.AddCurso(curso);
                Response.Redirect("Cursos.aspx");
            }
            else 
            {
                curso.FechaInicio = DateTime.Now;
                curso.FechaFin = DateTime.Now;
                _CursoService.AddCurso(curso);
                Response.Redirect("Cursos.aspx");
            }
        }

        public void UpdateCurso(Curso curso)
        {
            if (ModelState.IsValid)
            {
                _CursoService.UpdateCurso(curso);
                Response.Redirect("Cursos.aspx");
            }
        }

        public Curso GetCurso([QueryString("id")] Int32 id)
        {
            var curso = _CursoService.GetCurso(id);
            return curso;
        }

        public IEnumerable<Empleado> GetEmpleadosActivos([Control("txtCriterio")] String criterio) 
        {
            return _EmpleadoService.GetEmpleados(criterio, true);
        }

        protected void lvInstructores_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var txtInstructor = fvCurso.FindControl("txtInstructor") as TextBox;
            var hfInstructor = fvCurso.FindControl("hfIdInstructor") as HiddenField;

            var idEmpleado = (String) e.CommandArgument;

            var empleado = _EmpleadoService.GetEmpleado(Int32.Parse(idEmpleado.ToString()));

            txtInstructor.Text = empleado.ApellidoPaterno + " " + empleado.ApellidoMaterno + " " + empleado.Nombres;
            hfInstructor.Value = empleado.Id.ToString();
        }

        protected void lvActivos_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var txtInstructor = fvCurso.FindControl("txtInstructor") as TextBox;
            var hfInstructor = fvCurso.FindControl("hfIdInstructor") as HiddenField;

            var idEmpleado = (String)e.CommandArgument;

            var empleado = _EmpleadoService.GetEmpleado(Int32.Parse(idEmpleado.ToString()));

            txtInstructor.Text = empleado.ApellidoPaterno + " " + empleado.ApellidoMaterno + " " + empleado.Nombres;
            hfInstructor.Value = empleado.Id.ToString();
        }
    }
}