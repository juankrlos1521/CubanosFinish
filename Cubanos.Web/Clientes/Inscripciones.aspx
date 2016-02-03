<%@ Page Title="" Language="C#" MasterPageFile="~/Cubanos.Master" AutoEventWireup="true" CodeBehind="Inscripciones.aspx.cs" Inherits="Cubanos.Web.Clientes.Inscripciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Lista de Inscripciones
            </header>
            <div class="panel-body">
                <!-- Caja de busqueda  -->
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="txtCriterio" CssClass="form-control" placeholder="Criterio de Busqueda" />
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
                    <asp:ListView runat="server" ID="lvInscripciones" SelectMethod="GetInscripciones" ItemType="Cubanos.BusinessEntity.Inscripcion">                    
                        <LayoutTemplate>
                            <table class="table-responsive col-lg-4">
                                <thead>
                                    <tr>                                    
                                        <th>Nro Inscripción</th>
                                        <th>DNI</th>
                                        <th>Cliente</th>
                                        <th>Fecha Inicio</th>
                                        <th>Fecha Fin</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder" />
                                </tbody>
                            </table>                        
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Item.Id %></td>
                                <td><%# Item.Cliente.Dni %></td>                            
                                <td><%# Item.Cliente.ApellidoPaterno+" "+Item.Cliente.ApellidoMaterno+" "+Item.Cliente.Nombres %></td>
                                <td><%# Item.FechaInicio.ToString() %></td>
                                <td><%# Item.FechaFin.ToString() %></td>             
                                <td>
                                    <div class="btn-group">
                                        <a href="#" class="btn btn-primary"><i class="icon_pencil-edit_alt"></i></a>
                                        <a href="#" class="btn btn-danger"><i class="icon_close_alt2" onclick="return confirm('Seguro que desea eliminar este cargo')"></i></a>
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
                    <a href="frmInscripcion.aspx" class="btn btn-default col-sm-1"><i class="icon_plus_alt2"></i> Nuevo</a>
                    <div class="col-sm-7"></div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
