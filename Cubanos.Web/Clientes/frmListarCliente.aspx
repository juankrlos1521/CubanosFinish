﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Cubanos.Master" AutoEventWireup="true" CodeBehind="frmListarCliente.aspx.cs" Inherits="Cubanos.Web.frmListarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br/>
    <h1 style="font-family: 'Montserrat', sans-serif;">
        Lista de Cliente
    </h1>
    <hr/>

    <div class="row">
        <div class="col-md-10 navbar-form navbar-input-group">
            <b>Criterio:</b>&nbsp;
            <asp:TextBox runat="server" ID="txtCriterio" class="form-control" placeholder="Buscar cliente"/>
            &nbsp;<asp:Button runat="server" ID="btnBuscar" Text="Buscar" class="btn btn-primary"/> 
        </div>
        <div class="col-md-2 navbar-form navbar-right">
            <%--FrmHabitacion.aspx es a donde se linkea--%>
            <button type="button" class="btn btn-primary" aria-label="Left Align" onclick="location.href='frmRegistrarCliente.aspx'">
                <strong>Registrar Cliente</strong>
            </button>
        </div>
    </div>

<br/>

<asp:ListView runat="server"
    ID="lvCliente"
    DataKeyNames="Id"
    ItemType="Cubanos.BusinessEntity.Cliente"
    SelectMethod="ListarCliente">

    <LayoutTemplate>
        <table class="table table-striped table-condensed table-hover">
            <thead>            
                <tr>
                    <th>Dni</th>
                    <th>Nombre Completo</th>
                    <th>Dirección</th>
                    <th>Sexo</th>
                    <th>Email</th>                    
                    <th>Telefono</th>
                    <th>Edad</th>                    
                    <th>Estado</th>
                    <th>Plan de Ejercicios</th>                    
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr id="itemPlaceholder" runat="server"/>
            </tbody>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
            <tr>
                <td><%# Item.Dni %></td>
                <td><%# Item.ApellidoPaterno %> <%# Item.ApellidoMaterno %>, <%# Item.Nombres %> </td>
                <td><%# Item.Direccion %></td>
                <td><%# (Item.Sexo == true) ? "Masculino" : "Femenino" %></td>
                <td><%# Item.Email %></td>                
                <td><%# Item.Telefono %></td>
                <td><%# Convert.ToInt32(Convert.ToDecimal(DateTime.Now.ToString("yyyy.MMdd")) - Convert.ToDecimal(Item.FechaNacimiento.ToString("yyyy.MMdd"))) %></td>                
                <td><%# (Item.Estado == true) ? "Activo" : "Inactivo" %></td>                                
                <td>
                    <a href="frmListaPlan.aspx?listPlanes=<%# Item.Id %>&name=<%# Item.ApellidoPaterno.ToUpper() %> <%# Item.ApellidoMaterno.ToUpper() %>, <%# Item.Nombres.ToUpper() %>">Planes</span></a>
                </td>
                <td>
                    <a href="frmRegistrarCliente.aspx?acc=editar&id=<%# Item.Id %>">Editar</a>
                    <a href="frmRegistrarCliente.aspx?acc=eliminar&id=<%# Item.Id %>"
                            onclick="return confirm('Desea eliminar a <%# Item.ApellidoPaterno %> <%# Item.ApellidoMaterno %>, <%# Item.Nombres %>')">
                            Eliminar
                        </a>
                </td>
                
            </tr>
    </ItemTemplate>
</asp:ListView>

</asp:Content>
