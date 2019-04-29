<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="Hotel2.RegistrarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-3">
            &nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">        
            <asp:Label ID="lblPrincipal" runat="server" Text="Registro de Usuarios"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            &nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Label ID="Label1" runat="server" Text="NOMBRE DE USUARIO:"></asp:Label>
        </div>
        <div class="col-md-3">
            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" Text=""></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
           <asp:Label ID="lblClave" runat="server" Text="CONTRASEÑA:"></asp:Label>
        </div>
        <div class="col-md-3">
           <asp:TextBox ID="txtClave" TextMode="Password" runat="server" CssClass="form-control" Text=""></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
           <asp:Label ID="Label2" runat="server" Text="CONFIRMAR CONTRASEÑA:"></asp:Label>
        </div>
        <div class="col-md-3">
           <asp:TextBox ID="Txtconfir" TextMode="Password" runat="server" CssClass="form-control" Text=""></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
           <asp:Button ID="btnAceptar" CssClass="btn btn-success" runat="server" Text="Registrar" OnClick="btnAceptar_Click"></asp:Button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 alert-danger">
            <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 alert-success">
            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
