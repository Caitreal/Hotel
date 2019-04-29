<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Hotel._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="row">
            <div class="col-md-3">
                <asp:Label ID="lblUsuario" runat="server" Text="USUARIO:"></asp:Label>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" Text=""></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <asp:Label ID="lblClave" runat="server" Text="CLAVE:"></asp:Label>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtClave" TextMode="Password" runat="server" CssClass="form-control" Text=""></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
      
            </div>
            <div class="col-md-3">
                <div class="row">
                    <asp:Button ID="btnAceptar" CssClass="btn btn-info" runat="server" Text="ENTRAR" OnClick="btnAceptar_Click"></asp:Button>
                    
                    &nbsp;&nbsp;&nbsp;
                    
                    <asp:Button ID="btnAdd" CssClass="btn btn-info" runat="server" Text="REGISTRAR" OnClick="btnRegistrar"></asp:Button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col alert-danger">
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
