<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calificar.aspx.cs" Inherits="Hotel.Calificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6">
            <asp:DropDownList ID="ddlValoracion" runat="server"></asp:DropDownList>
        </div>
        <div class="col-md-6">
            <asp:Button ID="btnAceptar" runat="server" Text="CALIFICAR" OnClick="btnAceptar_Click" />
        </div>
    </div>
    <div class="row">
        <asp:Label CssClass="alert-danger" ID="lblMensaje" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
