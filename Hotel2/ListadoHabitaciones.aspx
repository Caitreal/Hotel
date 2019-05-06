<%@ Page Title="Lista de Habitaciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoHabitaciones.aspx.cs" Inherits="Hotel.ListadoHabitaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Button ID="btnCrear" CssClass="btn btn-success" runat="server" Text="Crear Habitacion" OnClick="btnCrear_Click" />

    <table class="table table-stripped table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>PRECIO</th>
                <th>DESCRIPCIÓN</th>
                <th>TIPO HABITACION</th>
                <th>CANTIDAD DE PERSONAS</th>
            </tr>
        </thead>
        <tbody>
            <%
                foreach (var habitacion in Habitaciones)
                {
            %>
            <tr>
                <td><%= habitacion.Id %></td>
                <td><%= habitacion.Precio %></td>
                <td><%= habitacion.Descripcion %></td>
                <td><%= habitacion.TipoHabitacion.Nombre %></td>
                <td><%= habitacion.TipoHabitacion.CantidadPersonas %></td>
                <td><a href="EditarHabitacion.aspx?id=<%= habitacion.Id %>" class="btn btn-success">Editar</a>
                    <a href="EliminarHabitacion.aspx?id=<%= habitacion.Id %>" class="btn btn-danger">Eliminar</a>
                    <a href="VerHabitacion.aspx?id=<%= habitacion.Id %>" class="btn btn-primary">Ver Habitacion</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

</asp:Content>
