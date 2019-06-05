<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cambiar.aspx.cs" Inherits="Hotel2.cambiar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Cambiar Descuento</h1>
    <br />
    <div class="row">
        <div class="col-md-3">
        <label>Nombre: </label>
        </div>
        <div class="col-md-3">
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3">
        <label>Descuento: </label>
        </div>
        <div class="col-md-3">
        <asp:TextBox ID="txtDescuento" runat="server"></asp:TextBox>
        </div>
    </div>
    <br />
    <asp:Button ID="Guardar" class="btn btn-success" runat="server" Text="Guardar" OnClick="Guardar_Click" />
</asp:Content>
