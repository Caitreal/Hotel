<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarReservaRecepcionista.aspx.cs" Inherits="Hotel2.EliminarReservaRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Eliminar Reservacion</h1>
    <br />

     <table class="table table-stripped table-hover">

        <thead>
            <tr>
                <th>Habitacion</th>
                <th>Fecha Tomada</th>
                <th>Fecha Inicio</th>
                <th>Numero de Noches</th>
                <th>Cliente</th>
                <th>Accion</th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var reserva in Reservas)
                {

            %>
            <tr>
                <td><%= reserva.Habitacion.Descripcion %></td>
                <td><%= reserva.Fecha %></td>
                <td><%= reserva.FechaInicio %></td>
                <td><%= reserva.NumeroNoches%></td>
                <td><%= reserva.Usuario.NombreUsuario %></td>
                <td>
                    <a href="Eliminando.aspx?id=<%= reserva.Id%>" class="btn btn-danger" >Eliminar Reserva</a>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <br />
</asp:Content>
