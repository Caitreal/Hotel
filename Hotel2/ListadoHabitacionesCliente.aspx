<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoHabitacionesCliente.aspx.cs" Inherits="Hotel2.ListadoHabitacionesCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
     <table class="table table-stripped table-hover">

        <thead>
            <tr>
                <th>FOTO</th>
                <th>PRECIO</th>
                <th>DESCRIPCIÓN</th>
                <th>TIPO HABITACION</th>
                <th>CANTIDAD DE PERSONAS</th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var habitacion in Habitaciones)
                {

            %>
            <tr>
                <td><%= habitacion.Precio%></td>
            </tr>
            <%
            }
                %>
        </tbody>        

         </table>

</asp:Content>
