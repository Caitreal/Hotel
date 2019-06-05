<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuCliente.aspx.cs" Inherits="Hotel2.MenuCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <div class="row">
        <div class="col-md-3">
            <asp:Button ID="btnListado" runat="server" CssClass="btn btn-primary" Text="Listar Habitaciones" OnClick="btnListado_Click" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnReservas" runat="server" CssClass="btn btn-success" Text="Reservas Realizadas" OnClick="btnReservas_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Button ID="btnValorar" runat="server" Text="Valorar" CssClass="btn btn-warning" OnClick="btnCerrar_Click" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnCerrar" runat="server" Text="Cerrar Sesión" CssClass="btn btn-danger" OnClick="btnCerrar_Click" />
        </div>
    </div>
</asp:Content>
