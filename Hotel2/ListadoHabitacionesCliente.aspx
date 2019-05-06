<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoHabitacionesCliente.aspx.cs" Inherits="Hotel2.ListadoHabitacionesCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <table class="table table-stripped table-hover">

        <thead>
            <tr>
                <th>DESCRIPCIÓN</th>
                <th>PRECIO</th>
                <th>TIPO HABITACION</th>
                <th>CANTIDAD DE PERSONAS</th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var habitacion in Habitaciones)
                {

            %>
            <tr>
                <td><%= habitacion.Descripcion %></td>
                <td><%= habitacion.Precio %></td>
                <td><%= habitacion.TipoHabitacion.Nombre %></td>
                <td><%= habitacion.TipoHabitacion.CantidadPersonas%></td>
                <td>
                    <a href="VerHabitacion.aspx?id=<%= habitacion.Id%>" class="btn btn-warning" >Ver Habitacion</a>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

</asp:Content>
