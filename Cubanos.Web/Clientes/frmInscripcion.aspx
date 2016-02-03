<%@ Page Title="" Language="C#" MasterPageFile="~/Cubanos.Master" AutoEventWireup="true" CodeBehind="frmInscripcion.aspx.cs" Inherits="Cubanos.Web.Clientes.frmInscripcion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        $(function () {
            $("#<%= radio_libre.ClientID %>").click(function () {                
                if (!$("#radio").is(':checked')) {
                    $("#libre").removeClass("hide");
                    $("#curso").addClass("hide");
                    $("#paquete").addClass("hide");
                } else {
                    //alert("No está activado");
                }
            });

            $("#<%= radio_curso.ClientID %>").click(function () {
                if (!$("#radio").is(':checked')) {
                    $("#libre").addClass("hide");
                    $("#curso").removeClass("hide");
                    $("#paquete").addClass("hide");
                } else {
                    //alert("No está activado");
                }
            });

            $("#<%= radio_paquete.ClientID %>").click(function () {
                if (!$("#radio").is(':checked')) {
                    $("#libre").addClass("hide");
                    $("#curso").addClass("hide");
                    $("#paquete").removeClass("hide");
                } else {
                    //alert("No está activado");
                }
            });

            $("#txtFechaInicio1").datepicker({
                dateFormat: "dd-mm-yy",
                changeYear: true,
                yearRange: "1950:2100",
                changeMonth: true,
            });

            $("#txtFechaFin1").datepicker({
                dateFormat: "dd-mm-yy",
                changeYear: true,
                yearRange: "1950:2100",
                changeMonth: true,
            });
        });
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <div class="row">
        <div class="col-lg-12">
            <!--breadcrumbs start -->
            <ul class="breadcrumb">
                <li><a href="#"><i class="icon_house_alt"></i> Inicio</a></li>
                <li><a href="#"> Gestión</a></li>
                <li class="active"> Inscripción</li>
            </ul>
            <!--breadcrumbs end -->
        </div>

        <div class="col-lg-12">
            <!-- Datos de cliente -->
            <asp:UpdatePanel runat="server" ID="upCliente">
                <ContentTemplate>
                    <div class="panel panel-default">
                        <div class="panel-heading">Datos del Cliente</div>
                        <div class="panel-body">
                            <div class="form-horizontal col-lg-10">
                                <fieldset>
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="col-lg-3"></div>
                                            <asp:Label runat="server" ID="txtMensajeDni" CssClass="col-lg-9" ForeColor="Red" />
                                        </div>
                                        <label class="control-label col-lg-3" >Dni</label>
                                        <div class="col-lg-5">
                                            <asp:TextBox runat="server" ID="txtDniCliente" CssClass="form-control" />
                                        </div>
                                        <div class="col-lg-2">
                                            <asp:Button runat="server" ID="btnBuscarDni" CssClass="form-control" Text="Buscar Cliente" OnClick="btnBuscarDni_Click" />
                                        </div>
                                        <div class="col-lg-2">
                                            <asp:Button runat="server" ID="btnAgregarCliente" CssClass="form-control" Text="Nuevo Cliente" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-3">Nombre</label>
                                        <asp:HiddenField runat="server" ID="hfIdCLiente" />
                                        <div class="col-lg-9">
                                            <asp:TextBox runat="server" ID="txtNombreCliente" CssClass="form-control" Enabled="false" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-3">Dirección</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox runat="server" ID="txtDireccionCliente" CssClass="form-control" Enabled="false" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-lg-3">Teléfono</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox runat="server" ID="txtTelefonoCliente" CssClass="form-control" Enabled="false" />
                                        </div>
                                    </div>
                                 </fieldset>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnBuscarDni" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <!-- fin cliente -->
        </div>
        
        <!-- panel de seleccion -->
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Seleccionar Tipo de Registro</div>
                <div class="panel-body">
                    <div class="form-horizontal col-lg-12">
                        <fieldset>
                            <div class="form-group">                                        
                                <label class="control-label col-lg-3">Seleccionar</label>    
                                <div class="col-lg-2">
                                    <asp:RadioButton runat="server" ID="radio_libre" Text=" Cursos Libres" Checked="true" GroupName="Seleccion" />
                                    <%--<input type="radio" name="seleccion" value="Libre" checked id="radio_libre" /> Libre--%>
                                </div>
                                <div class="col-lg-2">
                                    <asp:RadioButton runat="server" ID="radio_curso" Text=" Cursos" GroupName="Seleccion" />
                                    <%--<input type="radio" name="seleccion" value="Curso" id="radio_curso" /> Cursos--%>
                                </div>
                                <div class="col-lg-2">
                                    <asp:RadioButton runat="server" ID="radio_paquete" Text=" Paquetes" GroupName="Seleccion" />
                                    <%--<input type="radio" name="seleccion" value="Paquete" id="radio_paquete" /> Paquetes--%>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
        <!-- fin del panel de seleccion -->
        
        <!-- panel de cursos libres -->
        <div class="col-lg-12" id="libre">
            <!-- Datos de Inscripcion -->
            <asp:UpdatePanel runat="server" ID="upCursoLibre">
                <ContentTemplate>
                    <div class="panel panel-default">
                        <div class="panel-heading">Curso Libre</div>
                        <div class="panel-body">
                            <div class="form-horizontal col-lg-12">
                                <fieldset>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Fecha de Inicio Inscripción</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox runat="server" ID="txtFechaInicio1" CssClass="form-control" ClientIDMode="Static" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Fecha de Fin Inscripción</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox runat="server" ID="txtFechaFin1"  CssClass="form-control" ClientIDMode="Static" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblMensaje1" ForeColor="Red" />
                                        <asp:ListView runat="server" ID="lvLibre"
                                            ItemType="Cubanos.BusinessEntity.Curso"
                                            SelectMethod="GetLibreInscripcion"
                                            OnItemCommand="lvLibre_ItemCommand">
                                            <LayoutTemplate>
                                                <table class="table table-responsive col-lg-10 table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Fecha Inicio</th>
                                                            <th>Fecha Fin</th>
                                                            <th>Precio</th>
                                                            <th>Cupos</th>
                                                            <th>Instructor</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder" />
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Item.Nombre %></td>
                                                    <td><%# Item.FechaInicio!=null ? Item.FechaInicio.ToShortDateString() : "Sin limite" %></td>
                                                    <td><%# Item.FechaFin!=null ? Item.FechaFin.ToShortDateString() : "Sin limite" %></td>
                                                    <td><%# Item.Precio %></td>                                                    
                                                    <td><%# Item.Empleado.ApellidoPaterno + " " +Item.Empleado.ApellidoMaterno+" "+Item.Empleado.Nombres %></td>
                                                    <td><asp:Button runat="server" ID="btnAgregarCurso" CommandName="agregar" CommandArgument="<%# Item.Id %>" Text="Agregar" /></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>
                                    <div class="form-group">                          
                                        <asp:Label runat="server" ID="lblMensaje2"></asp:Label>
                                        <asp:ListView runat="server" ID="lvDetallesLibres" OnItemCommand="lvDetallesLibres_ItemCommand" >
                                            <LayoutTemplate>
                                                <table class="table table-responsive col-lg-10 table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Fecha Inicio</th>
                                                            <th>Fecha Fin</th>
                                                            <th>Precio</th>
                                                            <th>Cantidad</th>
                                                            <th>Instructor</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder" />
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("Nombre") %></td>
                                                    <td><%# DateTime.Parse(Eval("FechaInicio").ToString()).ToShortDateString() %></td>
                                                    <td><%# DateTime.Parse(Eval("FechaFin").ToString()).ToShortDateString() %></td>
                                                    <td><%# Eval("Precio") %></td>
                                                    <td>1</td>
                                                    <td><%# Eval("Empleado.ApellidoPaterno") + " " +Eval("Empleado.ApellidoMaterno")+" "+Eval("Empleado.Nombres") %></td>
                                                    <td><asp:Button runat="server" ID="btnQuitar1" Text="Quitar" CommandName="quitarlibre" CommandArgument='<%# Eval("Id") %>' /></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>
                                    <%--<div class="form-group">
                                        <label class="col-lg-3 control-label">SubTotal</label>
                                        <div class="col-lg-6">
                                            <asp:TextBox runat="server" ID="txtSubLibre" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">IGV</label>
                                        <div class="col-lg-6">
                                            <asp:TextBox runat="server" ID="txtLibreIgv" CssClass="form-control" />
                                        </div>
                                    </div>--%>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Total(inc.IGV)</label>
                                        <div class="col-lg-6">
                                            <asp:TextBox runat="server" ID="txtLibreTotal" CssClass="form-control" />
                                        </div>
                                    </div>
                                 </fieldset>
                            </div>
                            <!-- boton para guardar la inscripcion con su detalle -->
                            <div class="col-lg-12" style="padding-top: 10px;">
                                <div class="col-lg-3"></div>
                                <div class="col-lg-9" style="padding-left: 7px;">
                                    <asp:Button runat="server" ID="btnGuardarLibre" OnClick="btnGuardarInscripcion_Click" Text="Guardar Inscripción" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnBuscarDni" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lvCursos" EventName="ItemCommand" />
                    <asp:AsyncPostBackTrigger ControlID="lvDetallesCursos" EventName="ItemCommand" />
                </Triggers>
            </asp:UpdatePanel>
            <!-- fin Datos inscripcion -->
        </div>
        <!-- fin panel de curso libre -->        

        <!-- panel de cursos-->
        <div class="col-lg-12 hide" id="curso">
            <!-- Datos de Inscripcion -->
            <asp:UpdatePanel runat="server" ID="upCursos">
                <ContentTemplate>
                    <div class="panel panel-default">
                        <div class="panel-heading">Datos de Inscripción</div>
                        <div class="panel-body">
                            <div class="form-horizontal col-lg-12">
                                <fieldset>
                                    <div class="form-group hide">
                                        <label class="col-lg-3 control-label">Fecha de Inicio Inscripción</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox runat="server" ID="txtFecIniIns" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group hide">
                                        <label class="col-lg-3 control-label">Fecha de Fin Inscripción</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox runat="server" ID="txtFecFin"  CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="lblMensajeCurso" ForeColor="Red" />
                                        <asp:ListView runat="server" ID="lvCursos"
                                            ItemType="Cubanos.BusinessEntity.Curso"
                                            SelectMethod="GetCursosInscripcion"
                                            OnItemCommand="lvCursos_ItemCommand">
                                            <LayoutTemplate>
                                                <table class="table table-responsive col-lg-10 table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Fecha Inicio</th>
                                                            <th>Fecha Fin</th>
                                                            <th>Precio</th>
                                                            <th>Cupos</th>
                                                            <th>Instructor</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder" />
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Item.Nombre %></td>
                                                    <td><%# Item.FechaInicio!=null ? Item.FechaInicio.ToShortDateString() : "Sin limite" %></td>
                                                    <td><%# Item.FechaFin!=null ? Item.FechaFin.ToShortDateString() : "Sin limite" %></td>
                                                    <td><%# Item.Precio %></td>
                                                    <td><%# Item.Stock %></td>
                                                    <td><%# Item.Empleado.ApellidoPaterno + " " +Item.Empleado.ApellidoMaterno+" "+Item.Empleado.Nombres %></td>
                                                    <td><asp:Button runat="server" ID="btnAgregarCurso" CommandName="agregar" CommandArgument="<%# Item.Id %>" Text="Agregar" /></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>
                                    <div class="form-group">                                        
                                        <asp:Label runat="server" ID="lblDetalles"></asp:Label>
                                        <asp:ListView runat="server" ID="lvDetallesCursos" OnItemCommand="lvDetallesCursos_ItemCommand">
                                            <LayoutTemplate>
                                                <table class="table table-responsive col-lg-10 table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Fecha Inicio</th>
                                                            <th>Fecha Fin</th>
                                                            <th>Precio</th>
                                                            <th>Cantidad</th>
                                                            <th>Instructor</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder" />
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("Nombre") %></td>
                                                    <td><%# DateTime.Parse(Eval("FechaInicio").ToString()).ToShortDateString() %></td>
                                                    <td><%# DateTime.Parse(Eval("FechaFin").ToString()).ToShortDateString() %></td>
                                                    <td><%# Eval("Precio") %></td>
                                                    <td>1</td>
                                                    <td><%# Eval("Empleado.ApellidoPaterno") + " " +Eval("Empleado.ApellidoMaterno")+" "+Eval("Empleado.Nombres") %></td>
                                                    <td><asp:Button runat="server" ID="btnQuitar" Text="Quitar" CommandName="quitarcurso" CommandArgument='<%# Eval("Id") %>' /></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">SubTotal</label>
                                        <div class="col-lg-6">
                                            <asp:TextBox runat="server" ID="txtSubTotal" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">IGV</label>
                                        <div class="col-lg-6">
                                            <asp:TextBox runat="server" ID="txtIgv" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Total</label>
                                        <div class="col-lg-6">
                                            <asp:TextBox runat="server" ID="txtTotal" CssClass="form-control" />
                                        </div>
                                    </div>
                                 </fieldset>
                            </div>
                            <!-- boton para guardar la inscripcion con su detalle -->
                            <div class="col-lg-12" style="padding-top: 10px;">
                                <div class="col-lg-3"></div>
                                <div class="col-lg-9" style="padding-left: 7px;">
                                    <asp:Button runat="server" ID="btnGuardarInscripcion" OnClick="btnGuardarInscripcion_Click" Text="Guardar Inscripción" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnBuscarDni" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lvCursos" EventName="ItemCommand" />
                    <asp:AsyncPostBackTrigger ControlID="lvDetallesCursos" EventName="ItemCommand" />
                </Triggers>
            </asp:UpdatePanel>
            <!-- fin Datos inscripcion -->
        </div>
        <!-- fin del panel de cursos -->

        <!-- panel de paquetes -->
        <div class="col-lg-12 hide" id="paquete">
            <!-- Datos de Inscripcion -->
            <asp:UpdatePanel runat="server" ID="upPaquetes">
                <ContentTemplate>
                    <div class="panel panel-default">
                        <div class="panel-heading">Inscripción en paquetes</div>
                        <div class="panel-body">
                            <div class="form-horizontal col-lg-12">
                                <fieldset>
                                    <%--<div class="form-group hide">
                                        <label class="col-lg-3 control-label">Fecha de Inicio Inscripción</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox runat="server" ID="TextBox6" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group hide">
                                        <label class="col-lg-3 control-label">Fecha de Fin Inscripción</label>
                                        <div class="col-lg-9">
                                            <asp:TextBox runat="server" ID="TextBox7"  CssClass="form-control" />
                                        </div>
                                    </div>--%>
                                    <div class="form-group">
                                        <asp:Label runat="server" ID="Label3" ForeColor="Red" />
                                        <asp:ListView runat="server" ID="lvPaquetes"
                                            ItemType="Cubanos.BusinessEntity.Paquete"
                                            SelectMethod="GetPaquetes"
                                            OnItemCommand="lvPaquetes_ItemCommand">
                                            <LayoutTemplate>
                                                <table class="table table-responsive col-lg-10 table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Precio</th>
                                                            <th>Stock</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder" />
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Item.Nombre %></td>
                                                    <td><%# Item.Precio %></td>
                                                    <td><%# Item.Stock %></td>
                                                    <%--<td><%# Item.Nombre %></td>
                                                    <td><%# Item.FechaInicio!=null ? Item.FechaInicio.ToShortDateString() : "Sin limite" %></td>
                                                    <td><%# Item.FechaFin!=null ? Item.FechaFin.ToShortDateString() : "Sin limite" %></td>
                                                    <td><%# Item.Precio %></td>
                                                    <td><%# Item.Stock %></td>
                                                    <td><%# Item.Empleado.ApellidoPaterno + " " +Item.Empleado.ApellidoMaterno+" "+Item.Empleado.Nombres %></td>--%>
                                                    <td><asp:Button runat="server" ID="btnVerDetallePaquete" CommandName="detallepaquete" CommandArgument="<%# Item.Id %>" Text="Ver Cursos" /></td>
                                                    <td><asp:Button runat="server" ID="btnAgregarPaquete" CommandName="agregarpaquete" CommandArgument="<%# Item.Id %>" Text="Agregar" /></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>
                                    <div class="form-group">  
                                        <asp:Label runat="server" ID="Label4"></asp:Label>
                                        <asp:ListView runat="server" ID="lvDetallePaquete" OnItemCommand="lvDetallePaquete_ItemCommand">
                                            <LayoutTemplate>
                                                <table class="table table-responsive col-lg-10 table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <td>Nombre</td>
                                                            <td>Precio</td>
                                                            <td>Stock</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr runat="server" id="itemPlaceholder" />
                                                    </tbody>
                                                </table>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("Nombre") %></td>
                                                    <td><%# Eval("Precio") %></td>
                                                    <td><%# Eval("Stock") %></td>
                                                    <%--<td><%# Eval("Nombre") %></td>
                                                    <td><%# DateTime.Parse(Eval("FechaInicio").ToString()).ToShortDateString() %></td>
                                                    <td><%# DateTime.Parse(Eval("FechaFin").ToString()).ToShortDateString() %></td>
                                                    <td><%# Eval("Precio") %></td>
                                                    <td>1</td>
                                                    <td><%# Eval("Empleado.ApellidoPaterno") + " " +Eval("Empleado.ApellidoMaterno")+" "+Eval("Empleado.Nombres") %></td>--%>
                                                    <td><asp:Button runat="server" ID="btnQuitarPaquete" Text="Quitar" CommandName="quitarpaquete" CommandArgument='<%# Eval("Id") %>' /></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>
                                    <%--<div class="form-group">
                                        <label class="col-lg-3 control-label">SubTotal</label>
                                        <div class="col-lg-6">
                                            <asp:TextBox runat="server" ID="TextBox8" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">IGV</label>
                                        <div class="col-lg-6">
                                            <asp:TextBox runat="server" ID="TextBox9" CssClass="form-control" />
                                        </div>
                                    </div>--%>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Total</label>
                                        <div class="col-lg-6">
                                            <asp:TextBox runat="server" ID="txtTotalPaquete" CssClass="form-control" />
                                        </div>
                                    </div>
                                 </fieldset>
                            </div>
                            <!-- boton para guardar la inscripcion con su detalle -->
                            <div class="col-lg-12" style="padding-top: 10px;">
                                <div class="col-lg-3"></div>
                                <div class="col-lg-9" style="padding-left: 7px;">
                                    <!--<asp:Button runat="server" ID="Button2" OnClick="btnGuardarInscripcion_Click" Text="Guardar Inscripción" CssClass="btn btn-primary" />-->
                                    <asp:Button runat="server" ID="btnGuardarPaquete" Text ="Guardar Inscripción" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnBuscarDni" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="lvCursos" EventName="ItemCommand" />
                    <asp:AsyncPostBackTrigger ControlID="lvDetallesCursos" EventName="ItemCommand" />
                </Triggers>
            </asp:UpdatePanel>
            <!-- fin Datos inscripcion -->
        </div>
        <!-- fin de panel de paquetes -->
    </div>
</asp:Content>
