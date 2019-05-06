<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoReservas.aspx.cs" Inherits="Hotel2.ListadoReservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <table class="table table-stripped table-hover">
        <thead>
            <tr>
                <th>Fecha en que se reservó</th>
                <th>Fecha de Reserva</th>
                <th>Usuario</th>
                <th>RUT</th>
                <th>Numero de Noches</th>
                <th>Habitacion</th>
            </tr>
        </thead>
        <tbody>
            <% foreach(var reservas in Reservas){
                %>
            <tr>
                <td><%=reservas.Fecha %></td>
                <td><%=reservas.FechaInicio %></td>
            </tr>
            
        </tbody>
        <%} %>
    </table>
    <div class="row">
        <div class="col-md-3">
            <asp:HyperLink href="EliminarReservaCliente.aspx?id=<%reservas.Id%>" runat="server">Cancelar Reserva</asp:HyperLink>
        </div>
    </div>
</asp:Content>
