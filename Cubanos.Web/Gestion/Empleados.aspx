<%@ Page Title="" Language="C#" MasterPageFile="~/Cubanos.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="Cubanos.Web.Gestion.Empleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Lista de Empleados
            </header>
            <div class="panel-body">
                <!-- Caja de busqueda  -->
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="txtCriterio" CssClass="form-control" placeholder="Dni/Nombre" />
                            <span class="input-group-btn">
                            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-default" />
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
                
                <!-- fin busqueda-->
                <br />
                
                <!--tabla-->
                <div class="row">
                    <div class="col-lg-4"></div>
                    <asp:ListView ID="lvEmpleados" runat="server" SelectMethod="GetEmpleados" ItemType="Cubanos.BusinessEntity.Empleado">
                        <LayoutTemplate>
                            <table class="table table-responsive col-lg-12" style="padding-right: 5px; padding-left: 5px;">
                                <thead>
                                    <tr>
                                    	<th>Dni</th>
                                    	<th>Nombre</th>
                                        <th>Cargo</th>
                                    	<th>Fecha Nacimiento</th>
                                    	<th>Dirección</th>
                                    	<th>Teléfono</th>
                                    	<th>Email</th>
                                    	<th>Sexo</th>
                                    	<th>Estado</th>
                                    	<th>Fecha Ingreso</th>
                                    	<th>Salario</th>
                                    	<th>Especialidad</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server" />
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                            	<td><%# Item.Dni %></td>
                            	<td><%# Item.ApellidoPaterno + " " +Item.ApellidoMaterno + " " + Item.Nombres %></td>
                            	<td><%# Item.Cargo.Nombre %></td>
                            	<td><%# Item.FechaNacimiento.ToShortDateString() %></td>
                            	<td><%# Item.Direccion %></td>
                            	<td><%# Item.Telefono %></td>
                            	<td><%# Item.Email %></td>
                            	<td><%# Item.Sexo ? "Masculino" : "Femenino" %></td>
                            	<td><%# Item.Estado ? "Activo" : "Inactivo" %></td>
                            	<td><%# Item.FechaIngreso.ToShortDateString() %></td>
                            	<td><%# Item.Salario.ToString() %></td>
                            	<td><%# Item.Especialidad %></td>
                                <td>
                                    <div class="btn-group">
                                        <a href="frmEmpleado.aspx?acc=editar&id=<%# Item.Id %>" class="btn-primary"><i class="icon_pencil-edit_alt"></i></a>
                                        <a href="#" class="btn-danger"><i class="icon_close_alt2" onclick="return confirm('Seguro que desea eliminar este empleado')"></i></a>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="col-lg-4"></div>
                </div>                
                <!--fin tabla-->

                <div class="row">
                    <div class="col-sm-4"></div>
                    <a href="frmEmpleado.aspx" class="btn btn-default col-sm-1"><i class="icon_plus_alt2"></i> Nuevo</a>
                    <div class="col-sm-7"></div>
                </div>
            </div>
        </section>
    </div>   
</asp:Content>
