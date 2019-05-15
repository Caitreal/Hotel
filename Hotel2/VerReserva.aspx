<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerReserva.aspx.cs" Inherits="Hotel2.VerReserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <table class="table table-stripped">
        <thead>
            <tr>
                <th>Id</th>
                <th>Numero de Noches</th>
                <th>Cliente</th>
                <th>Rut</th>
                <th>Habitacion</th>
                <th>Accion</th>
            </tr>
        </thead>
        <tbody>
            <%
                foreach (var re in reserva)
                {
                %>
                <tr>
                    <td><%= re.Id %></td>
                    <td><%= re.NumeroNoches %></td>
                    <td><%= re.Cliente.Usuario.NombreUsuario %></td>
                    <td><%= re.Cliente.Rut %></td>
                    <td><%= re.Habitacion.TipoHabitacion.Nombre %></td>
                    <td><a href="" class="btn btn-warning"></a></td>
                </tr>
            <%
                }
                %>
        </tbody>
    </table>
</asp:Content>
