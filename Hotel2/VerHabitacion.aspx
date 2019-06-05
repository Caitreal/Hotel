<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerHabitacion.aspx.cs" Inherits="Hotel.VerHabitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <div class="row">
        <div class="col-md-3">
            <strong>
                <asp:Label ID="txtNombre" runat="server" Text=""></asp:Label>
            </strong>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10">
            <asp:Image ID="imgHabitacion" runat="server" style="width:650px; height:330px;" />
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
    </br>
    <div class="row">
        <div class="col-md-4">
            <a href="ListadoHabitaciones.aspx" class="btn btn-primary">Volver</a>
        </div>
        <div class="col-md-4">
            <a href="ReservarHabitacionCliente.aspx?id=<%= Id%>" class="btn btn-success">Reservar</a>           
        </div>
    </div>
</asp:Content>
