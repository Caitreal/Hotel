<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="Hotel2.EditarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<br />
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre de Usuario:"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtNombreU" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lblClave" runat="server" Text="Clave:"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtClave" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lblTipoUsuario" runat="server" Text="TIPO"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlTipoUsuario" CssClass="form-control" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Button ID="btnAceptar" CssClass="btn btn-info" runat="server" Text="ACEPTAR" OnClick="btnAceptar_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 alert-danger">
            <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
