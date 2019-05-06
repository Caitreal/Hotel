<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerCliente.aspx.cs" Inherits="Hotel2.VerUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lbl1" runat="server" Text="Nombre: "></asp:Label>        
        </div>
        <div class="col-md-4">
            <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="Label1" runat="server" Text="Rut: "></asp:Label>        
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lbl2" runat="server" Text="Tipo de Usuario: "></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:Label ID="txtTipo" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Datos" class="btn btn-success" OnClick="btnGuardar_Click"/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
           <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
