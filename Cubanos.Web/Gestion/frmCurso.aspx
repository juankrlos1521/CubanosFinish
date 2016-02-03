<%@ Page Title="" Language="C#" MasterPageFile="~/Cubanos.Master" AutoEventWireup="true" CodeBehind="frmCurso.aspx.cs" Inherits="Cubanos.Web.Gestion.frmCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>        
        $(function () {
            $('#cbLimite').change(function () {
                var $check = $(this);
                if ($check.prop('checked')) {                    
                    document.getElementById("txtFechaIni").disabled = true;                    
                    document.getElementById("txtFechaFin").disabled = true;
                    document.getElementById("txtNroSesiones").disabled = true;
                    document.getElementById("txtFechaIni").value = null;
                    document.getElementById("txtFechaFin").value = null;
                    document.getElementById("txtNroSesiones").value = "0";
                    document.getElementById("txtStock").disabled = true;
                    document.getElementById("txtStock").value = "0";
                } else {
                    document.getElementById("txtFechaIni").disabled = false;
                    document.getElementById("txtFechaFin").disabled = false;
                    document.getElementById("txtNroSesiones").disabled = false;
                }
            });

            $("#myModal").click(function () {
                $('#myModal').modal('hide');
            });
        });
    </script>
    <div class="row">
        <div class="col-lg-12">
            <!--breadcrumbs start -->
            <ul class="breadcrumb">
                <li><a href="#"><i class="icon_house_alt"></i> Inicio</a></li>
                <li><a href="#"> Gestión</a></li>
                <li class="active"> Curso</li>
            </ul>
            <!--breadcrumbs end -->
        </div>

        <!--contenido-->
        <div class="col-lg-12">
            <section class="panel">
                <header class="panel-heading">
                    Curso
                </header>
                <div class="panel-body">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:FormView runat="server" ID="fvCurso"
                        ItemType="Cubanos.BusinessEntity.Curso"
                        DefaultMode="Insert"
                        InsertMethod="AddCurso"
                        UpdateMethod="UpdateCurso"
                        SelectMethod="GetCurso"
                        CssClass="form-horizontal col-lg-10">
                        <InsertItemTemplate>                            
                            
                            <asp:UpdatePanel runat="server" ID="upInsert">
                                <ContentTemplate>
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Nombre</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox runat="server" ID="txtNombre" Text="<%# BindItem.Nombre %>" CssClass="form-control"/>
                                            </div>                          
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Sin Limite</label>
                                            <div class="col-lg-9">
                                                <asp:CheckBox runat="server" ID="cbLimite" Text=" Si activa esta casilla el curso estara disponible siempre" CssClass="form-control cb" Checked="<%# BindItem.LimiteTiempo %>" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Nro de Sesiones</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txtNroSesiones" runat="server" Text="<%# BindItem.Sesiones %>" CssClass="form-control" ClientIDMode="Static" TextMode="Number" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Fecha Inicio</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox CssClass="form-control" ID="txtFechaIni" runat="server" TextMode="Date" Text="<%# BindItem.FechaInicio %>" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <!--<p>Date: <input type="text" id="datepicker"></p>-->
                                            <label class="col-lg-3 control-label">Fecha Fin</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox CssClass="form-control" ID="txtFechaFin" runat="server" TextMode="Date" Text="<%# BindItem.FechaFin %>" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Precio</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox runat="server" ID="txtPrecio" Text="<%# BindItem.Precio %>" placeholder="20.00" CssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Cupos</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox runat="server" ID="txtStock" Text="<%# BindItem.Stock %>" CssClass="form-control" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Instructor</label>
                                            <div class="col-lg-9">
                                                <!-- Con boostrap-->
                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                                    Seleccionar Instructor
                                                </button>
                                                
                                                <!-- con ajaxcontroltoolkit-->
                                                <%--<asp:Button runat="server" ID="btnModal" Text="Seleccionar Instructor" />
                                                
                                                <ajaxToolkit:ModalPopupExtender ID="btnModal_ModalPopupExtender" runat="server"
                                                    BehaviorID="btnModal_ModalPopupExtender" DynamicServicePath=""
                                                    TargetControlID="btnModal"
                                                    CancelControlID="btnCancelar"
                                                    PopupControlID="myModal"
                                                    BackgroundCssClass="modalPopupBg">
                                                </ajaxToolkit:ModalPopupExtender>--%>
                                                
                                                

                                                <div class="col-lg-9">
                                                    <asp:HiddenField runat="server" ID="hfIdInstructor" Value="<%# BindItem.EmpleadoId %>" />
                                                    <asp:TextBox ID="txtInstructor" runat="server" Enabled="false" CssClass="form-control" />
                                                </div>
                                            </div>                                    
                                        </div>
                                        <asp:Button runat="server" ID="btnGuardar" Text="Guardar" CommandName="insert" CssClass="btn btn-default" />
                                    </fieldset>
                                </ContentTemplate>
                                <Triggers>
                                    <%--<asp:AsyncPostBackTrigger ControlID="lvActivos" EventName="ItemCommand" />--%>
                                    <asp:AsyncPostBackTrigger ControlID="lvInstructores" EventName="ItemCommand" />
                                </Triggers>                             
                            </asp:UpdatePanel>                            
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <asp:UpdatePanel runat="server" ID="upEdit">
                                <ContentTemplate>
                                    <fieldset>
                                        <asp:HiddenField ID="hfId" runat="server" Value="<%# BindItem.Id %>" />
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Nombre</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox runat="server" ID="txtNombre1" Text="<%# BindItem.Nombre %>" CssClass="form-control"/>
                                            </div>                          
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Sin Limite</label>
                                            <div class="col-lg-9">
                                                <asp:CheckBox runat="server" ID="cbLimite1" Text=" Si activa esta casilla el curso estara disponible siempre" CssClass="form-control cb" Checked="<%# BindItem.LimiteTiempo %>" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Nro de Sesiones</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="txtNroSesiones1" runat="server" Text="<%# BindItem.Sesiones %>" CssClass="form-control" ClientIDMode="Static" TextMode="Number" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Fecha Inicio</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox CssClass="form-control" ID="txtFechaIni1" runat="server" TextMode="Date" Text="<%# BindItem.FechaInicio %>" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <!--<p>Date: <input type="text" id="datepicker"></p>-->
                                            <label class="col-lg-3 control-label">Fecha Fin</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox CssClass="form-control" ID="txtFechaFin1" runat="server" TextMode="Date" Text="<%# BindItem.FechaFin %>" ClientIDMode="Static" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Precio</label>
                                            <div class="col-lg-9">
                                                <asp:TextBox runat="server" ID="txtPrecio1" Text="<%# BindItem.Precio %>" placeholder="20.00" CssClass="form-control" />
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Seleccionar Instructor</label>
                                            <div class="col-lg-9">
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                                    Seleccionar Instructor
                                                </button>
                                                
                                                <div class="col-lg-9">
                                                    <asp:HiddenField runat="server" ID="hfIdInstructor1" Value="<%# BindItem.EmpleadoId %>" />
                                                    <asp:TextBox ID="txtInstructor1" runat="server" Enabled="false" CssClass="form-control" />
                                                </div>
                                            </div>                                    
                                        </div>
                                        <asp:Button runat="server" ID="btnGuardar1" Text="Guardar" CommandName="update" CssClass="btn btn-default" />
                                    </fieldset>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="lvInstructores" EventName="ItemCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                                </Triggers>                             
                            </asp:UpdatePanel>  
                        </EditItemTemplate>
                    </asp:FormView>
                </div>
            </section>
        </div>
        <!-- fin de contenido -->

        <!-- inicio modalpopup -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                        aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Empleados Activos</h4>
                    </div>
                    <div class="modal-body">
                        <asp:ListView runat="server" ID="lvInstructores"
                            ItemType="Cubanos.BusinessEntity.Empleado"
                            SelectMethod="GetEmpleadosActivos" OnItemCommand="lvInstructores_ItemCommand">
                            <LayoutTemplate>
                                <table class="table table-responsive col-lg-12">
                                    <thead>
                                        <tr>   
                                            <th hidden="hidden"></th>                                                     
                                            <th>Nombre</th>
                                            <th>Cargo</th>
                                            <th>Especialidad</th>                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr runat="server" id="itemPlaceholder" />
                                    </tbody>                      
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>                                    
                                    <td><%# Item.ApellidoPaterno + " " + Item.ApellidoMaterno + " " + Item.Nombres %></td>
                                    <td><%# Item.Cargo.Nombre %></td>
                                    <td><%# Item.Especialidad %></td>
                                    <td>
                                        <asp:Button runat="server" Text="Seleccionar" ID="btnInstructor" AutoPostBack="true" CommandArgument="<%# Item.Id %>" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- fin modal -->


        <!-- para ajax toolkit-->

        <%--<asp:Panel runat="server" ID="myModal" CssClass="popup">
            <fieldset>
            <legend>Caracteristicas Adicionales</legend>
        </fieldset> 
            <asp:ListView runat="server" ID="lvActivos"
                ItemType="Cubanos.BusinessEntity.Empleado"
                SelectMethod="GetEmpleadosActivos" OnItemCommand="lvActivos_ItemCommand">
                <LayoutTemplate>
                    <table class="table table-responsive col-lg-12">
                        <thead>
                            <tr>   
                                <th hidden="hidden"></th>                                                     
                                <th>Nombre</th>
                                <th>Cargo</th>
                                <th>Especialidad</th>                           
                            </tr>
                        </thead>
                        <tbody>
                            <tr runat="server" id="itemPlaceholder" />
                        </tbody>                      
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>                        
                        <td><%# Item.ApellidoPaterno + " " + Item.ApellidoMaterno + " " + Item.Nombres %></td>
                        <td><%# Item.Cargo.Nombre %></td>
                        <td><%# Item.Especialidad %></td>
                        <td>
                            <asp:Button runat="server" Text="Seleccionar" ID="btnInstructor" AutoPostBack="true" CommandArgument="<%# Item.Id %>" />
                        </td>
                    </tr>
                </ItemTemplate>                
            </asp:ListView>
        <asp:Button runat="server" ID="btnCancelar" Text="Cancelar"/>
        </asp:Panel>        --%>

        <!-- fin ajax toolkit -->
    </div>
</asp:Content>
