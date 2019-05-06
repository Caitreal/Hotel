<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReservarHabitacionRecepcionista.aspx.cs" Inherits="Hotel2.ReservarHabitacionRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h1>Reservar Habitacion</h1>
    <br />

    <div class="row">
        <div class="col-md-4">
            <label>Numero de Habitacion: </label>
        </div>
        <div class="col-md-6">
            <asp:DropDownList ID="DropListHabitacion" runat="server">

            </asp:DropDownList>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-md-4">
            <label>Nombre Cliente: </label>
        </div>
        <div class="col-md-6">
            <asp:DropDownList ID="DropListCliente" runat="server">

            </asp:DropDownList>
        </div>
    </div>

    <br />

    <div class="row">
        <asp:Button ID="btnReservar" CssClass="btn btn-info" runat="server" Text="RESERVAR" OnClick="btnReservar_Click"></asp:Button>
    </div>
    


</asp:Content>
