<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReservarHabitacionCliente.aspx.cs" Inherits="Hotel2.Reservar_" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <strong>
        <asp:Label ID="Label1" runat="server" Text="Reservar Habitación"></asp:Label>
    </strong>
    <div class="row">
        <div class="col-md-3">
            <asp:Label ID="Label2" runat="server" Text="Nombre:"></asp:Label>
        </div>
        <div class="col-md-3">
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Label ID="Label3" runat="server" Text="RUT:"></asp:Label>
        </div>
        <div class="col-md-3">
            <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Label ID="Label4" runat="server" Text="Numero de noches:"></asp:Label>
        </div>
        <div class="col-md-3">
            <asp:TextBox ID="txtNumNoches" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Label ID="Label5" runat="server" Text="Cantidad de personas"></asp:Label>
        </div>
        <div class="col-md-3">
            <asp:TextBox ID="txtPersonas" runat="server"></asp:TextBox>
        </div>
    </div>
</asp:Content>
