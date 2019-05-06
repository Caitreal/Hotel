<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarReservaRecepcionista.aspx.cs" Inherits="Hotel2.EliminarReservaRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Eliminar Reservacion</h1>
    <br />

    <asp:DropDownList runat="server" ID="DropListHabitacion">

    </asp:DropDownList>
    <br />
    <asp:Button runat="server" ID="Eliminar" OnClick="Eliminar_Click" Text="Eliminar" CssClass="btn btn-info"/>
</asp:Content>
