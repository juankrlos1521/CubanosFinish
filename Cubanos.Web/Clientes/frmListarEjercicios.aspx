<%@ Page Title="" Language="C#" MasterPageFile="~/Cubanos.Master" AutoEventWireup="true" CodeBehind="frmListarEjercicios.aspx.cs" Inherits="Cubanos.Web.Clientes.frmListarEjercicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       
     <br/>
    <h1 style="font-family: 'Montserrat', sans-serif;">
        Lista de Ejercicios
    </h1>
    <hr/>

    <div class="row">
        <b>Cliente:</b>&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCliente" runat="server" Text=""></asp:Label>
    </div>                
        <div class="col-md-2 navbar-form navbar-input-group"> 
            <%--FrmHabitacion.aspx es a donde se linkea--%>
            <button type="button" class="btn btn-primary" aria-label="Left Align" onclick="location.href='frmCrearPersona.aspx'">
                <strong>Registrar Nuevo Ejercicio</strong>
            </button>
        </div>
        
    
        
    
<br/>
    <%--<div> <asp:Label runat="server" ID="lbNombre" AssociatedControlID="" ></asp:Label> </div>--%>
<asp:ListView runat="server"
    ID="lvejercicios"
    DataKeyNames="Id"
    ItemType="Cubanos.BusinessEntity.DetalleEjercicioToRutina"
    SelectMethod="ListarEjercicios">

    <LayoutTemplate>
        
        <table class="table table-striped table-condensed table-hover">
            <thead>            
                <tr>                   
                    <th>Nombre </th>                    
                    <th>Orden </th>
                    <th>Series </th>
                    <th>Repeticiones  </th>
                    <th>Acciones </th>
                </tr>
            </thead>
            <tbody>
                <tr id="itemPlaceholder" runat="server"/>
            </tbody>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
            <tr>
                <td><%# Item.Ejercicio.Nombre %></td>
                <td><%# Item.NroOrden %> </td>
                <td><%# Item.NroSeries %></td>
                <td><%# Item.NroRepeticiones %></td>                      
                <td>
                    <a href="frmCrearPersona.aspx?acc=editar&id=<%# Item.EjercicioId %>">Editar</a>
                    <a href="frmCrearPersona.aspx?acc=eliminar&id=<%# Item.EjercicioId %>"
                            onclick="return confirm('Desea Eliminar la Habitación Nro: ' + <%# Item.EjercicioId %>)">
                            Eliminar
                        </a>
                      
                </td>
            </tr>
        
    </ItemTemplate>
</asp:ListView>


</asp:Content>
