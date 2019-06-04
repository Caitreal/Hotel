<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verGananciasMesAdministrador.aspx.cs" Inherits="Hotel2.verGananciasMesAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h1>Calcular Ganancias de un Mes</h1>
    <br />

    <div class="row">
        <div class="col-md-4">
            <label>anio</label>
        </div>
        <div class="col-md-4">
            <label>Mes</label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-4">
            <asp:DropDownList ID="ListYear" runat="server"></asp:DropDownList>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ListMonth" runat="server"></asp:DropDownList>
        </div>
    </div>
    <br />
    <asp:Label ID="txtIngreso" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="calcular" runat="server" Text="Calcular" OnClick="calcular_Click" />
</asp:Content>
