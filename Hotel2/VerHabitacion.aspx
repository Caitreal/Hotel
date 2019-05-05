<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerHabitacion.aspx.cs" Inherits="Hotel.VerHabitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <div class="row">
        <div class="col-md-3">
            <asp:Label ID="txtNombre" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10">
            <asp:Image ID="imgHabitacion" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Label ID="Label2" runat="server" Text="Precio: "></asp:Label>
        </div>
        <div class="col-md-3">
            <asp:Label ID="txtPrecio" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Label ID="Label1" runat="server" Text="Tipo de Habitación:"></asp:Label>
        </div>
        <div class="col-md-7">
            <asp:Label ID="txtTipo" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
