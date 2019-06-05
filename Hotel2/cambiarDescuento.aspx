<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cambiarDescuento.aspx.cs" Inherits="Hotel2.cambiarDescuento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Cambiar Descuento</h1>
    <br />
    <table class="table table-stripped table-hover">
        <thead>
            <tr>
            <th>Nombre</th>
            <th>Descuento</th>
            <th>Accion</th>
        </tr>
        </thead>
        <tbody>
            <% foreach (var i in Lista)
                {

            %>
            <tr>
                <td><%= i.Nombre %></td>
                <td><%= i.Descuento %></td>
                <td><a href="cambiar.aspx?id=<%=i.Id%>" class="btn btn-info">Cambiar</a></td>
            </tr>
            <%
                }
            %>
        </tbody>
        

        

    </table>
    
</asp:Content>
