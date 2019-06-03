<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoReservas.aspx.cs" Inherits="Hotel2.ListadoReservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <table class="table table-stripped table-hover">
        <thead>
            <tr>
                <th>Fecha en que se reservó</th>
                <th>Fecha de Reserva</th>
                <th>Usuario</th>
                <th>Numero de Noches</th>
                <th>Habitacion</th>
                <th>          </th>
            </tr>
        </thead>
        <tbody>
            <% foreach(var reservas in reservas){
                %>
            <tr>
                <td><%=reservas.Fecha %></td>
                <td><%=reservas.FechaInicio %></td>
                <td><%=reservas.Usuario.NombreUsuario %></td>
                <td><%=reservas.NumeroNoches %></td>
                <td><%=reservas.Habitacion.Descripcion %></td>
                <td><asp:HyperLink href="EliminarReservaCliente.aspx?id=<% reservas.Id %>" CssClass="btn btn-danger" runat="server">Cancelar Reserva</asp:HyperLink></td>
            </tr>
        </tbody>
        <%} %>
    </table>
</asp:Content>
