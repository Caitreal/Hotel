<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuAdministrador.aspx.cs" Inherits="Hotel2.MenuAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    </br>
    <div class="row">
        <div class="col-md-3">
            <asp:Button ID="btnLista" runat="server" CssClass="btn btn-success" Text="Listado de Habitaciones" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnCambiar" runat="server" CssClass="btn btn-success" Text="Cambiar valor de descuentos" />
        </div>
    </div>

</asp:Content>
