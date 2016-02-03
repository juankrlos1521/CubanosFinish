<%@ Page Title="" Language="C#" MasterPageFile="~/Cubanos.Master" AutoEventWireup="true" CodeBehind="frmEmpleado.aspx.cs" Inherits="Cubanos.Web.Gestion.frmEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $("#txtFechaNacimiento").datepicker({
                dateFormat: "dd-mm-yy",
                changeYear: true,
                yearRange: "1950:2100",
                changeMonth: true,
            });

            $("#txtFechaIngreso").datepicker({
                dateFormat: "dd-mm-yy",
                changeYear: true,
                yearRange: "1950:2100",
                changeMonth: true,
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row">
    <div class="col-lg-12">
        <!--breadcrumbs start -->
        <ul class="breadcrumb">
            <li><a href="#"><i class="icon_house_alt"></i> Inicio</a></li>
            <li><a href="#"> Gestión</a></li>
            <li class="active"> Empleado</li>
        </ul>
        <!--breadcrumbs end -->
    </div>
    <!--contenido-->
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Empleado
            </header>
            <div class="panel-body">
                <asp:FormView ID="fvEmpleado" runat="server"
                    ItemType="Cubanos.BusinessEntity.Empleado"
                    DefaultMode="Insert"
                    InsertMethod="AddEmpleado"
                    UpdateMethod="UpdateEmpleado"
                    SelectMethod="GetEmpleado"
                    CssClass="form-horizontal col-lg-10">
                    <InsertItemTemplate>
                        <fieldset>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Dni</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtDni" Text="<%# BindItem.Dni %>" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Apellido Paterno</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtApellidoPaterno" Text="<%# BindItem.ApellidoPaterno %>" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Apellido Materno</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtApellidoMaterno" Text="<%# BindItem.ApellidoMaterno %>" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Nombres</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtNomrbes" Text="<%# BindItem.Nombres %>" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Cargo</label>
                                <div class="col-lg-9">
                                    <asp:DropDownList runat="server" ID="ddlCargo"
                                        ItemType="Cubanos.BusinessEntity.Cargo"
                                        SelectMethod="GetCargos"
                                        DataTextField="Nombre"
                                        DataValueField="Id"
                                        SelectedValue="<%# BindItem.CargoId %>" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Fecha de Nacimiento</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtFechaNacimiento" Text="<%# BindItem.FechaNacimiento %>" ClientIDMode="Static" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Dirección</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtDireccion" Text="<%# BindItem.Direccion %>" ClientIDMode="Static" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Teléfono</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtTelefono" Text="<%# BindItem.Telefono %>" ClientIDMode="Static" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Email</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtEmail" Text="<%# BindItem.Email %>" ClientIDMode="Static" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Sexo</label>
                                <div class="col-lg-9" >
                                    <div class="form-control">
                                        <asp:RadioButton runat="server" ID="rbtnMasculino" GroupName="Sexo" Text="Masculino" />
                                        <asp:RadioButton runat="server" ID="rbtnFemenino" GroupName="Sexo" Text="Femenino" />
                                    </div>                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Fecha de Ingreso</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtFechaIngreso" Text="<%# BindItem.FechaIngreso %>" CssClass="form-control" ClientIDMode="Static" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Salario</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtSalario" Text="<%# BindItem.Salario %>" CssClass="form-control" ClientIDMode="Static" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Especialidad</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="TextBox1" Text="<%# BindItem.Especialidad %>" CssClass="form-control" ClientIDMode="Static" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-3"></div>
                                <div class="col-lg-9">
                                    <asp:Button runat="server" ID="btnGuardar" CommandName="insert" CssClass="col-lg-2 btn btn-default" Text="Guardar" />
                                </div>                               
                            </div>
                        </fieldset>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <fieldset>
                            <asp:HiddenField ID="hfId" runat="server" Value="<%# BindItem.Id %>" />
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Dni</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtDni" Text="<%# BindItem.Dni %>" CssClass="form-control" Enabled="false" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Apellido Paterno</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtApellidoPaterno" Text="<%# BindItem.ApellidoPaterno %>" CssClass="form-control" Enabled="false" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Apellido Materno</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtApellidoMaterno" Text="<%# BindItem.ApellidoMaterno %>" CssClass="form-control" Enabled="false" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Nombres</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtNomrbes" Text="<%# BindItem.Nombres %>" CssClass="form-control" Enabled="false" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Cargo</label>
                                <div class="col-lg-9">
                                    <asp:DropDownList runat="server" ID="ddlCargo"
                                        ItemType="Cubanos.BusinessEntity.Cargo"
                                        SelectMethod="GetCargos"
                                        DataTextField="Nombre"
                                        DataValueField="Id"
                                        SelectedValue="<%# BindItem.CargoId %>" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Fecha de Nacimiento</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtFechaNacimiento" Text="<%# BindItem.FechaNacimiento %>" ClientIDMode="Static" CssClass="form-control" Enabled="false" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Dirección</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtDireccion" Text="<%# BindItem.Direccion %>" ClientIDMode="Static" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Teléfono</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtTelefono" Text="<%# BindItem.Telefono %>" ClientIDMode="Static" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Email</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtEmail" Text="<%# BindItem.Email %>" ClientIDMode="Static" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Sexo</label>
                                <div class="col-lg-9" >
                                    <div class="form-control">                             
                                        <asp:RadioButton runat="server" ID="rbtnMasculino" GroupName="Sexo" Text="Masculino" Enabled="false" />
                                        <asp:RadioButton runat="server" ID="rbtnFemenino" GroupName="Sexo" Text="Femenino"  Enabled="false" />                                
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Estado</label>
                                <div class="col-lg-9" >
                                    <div class="form-control">
                                        <asp:RadioButton runat="server" ID="rbtnActivo" GroupName="Estado" Text="Activo" />
                                        <asp:RadioButton runat="server" ID="rbtnInactivo" GroupName="Estado" Text="Inactivo" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Fecha de Ingreso</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtFechaIngreso" Text="<%# BindItem.FechaIngreso %>" CssClass="form-control" ClientIDMode="Static" Enabled="false" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Salario</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="txtSalario" Text="<%# BindItem.Salario %>" CssClass="form-control" ClientIDMode="Static" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Especialidad</label>
                                <div class="col-lg-9">
                                    <asp:TextBox runat="server" ID="TextBox1" Text="<%# BindItem.Especialidad %>" CssClass="form-control" ClientIDMode="Static" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-3"></div>
                                <div class="col-lg-9">
                                    <asp:Button runat="server" ID="btnGuardar" CommandName="update" CssClass="col-lg-2 btn btn-default" Text="Guardar" />
                                </div>                               
                            </div>
                        </fieldset>
                    </EditItemTemplate>
                </asp:FormView>
            </div>
        </section>
    </div>
    <!-- fin de contenido -->
</div>
</asp:Content>
