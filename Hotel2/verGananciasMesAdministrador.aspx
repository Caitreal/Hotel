<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verGananciasMesAdministrador.aspx.cs" Inherits="Hotel2.verGananciasMesAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Calcular Ganancias de un Mes</h1>
    <br />

    <div class="row">
        <div class="col-md-4">
            <label>Año</label>
        </div>
        <div class="col-md-4">
            <label>Mes</label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <asp:DropDownList ID="ListYears" runat="server"></asp:DropDownList>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ListMonths" runat="server"></asp:DropDownList>
        </div>
    </div>
    
    <br />
    <div class="row">
        <div class="col-md-4">
            <asp:Button ID="Calcular" class="btn btn-info" runat="server" Text="Calcular" OnClick="Calcular_Click" />
        </div>
        <div class="col-md-4">
            <asp:Label ID="textoCalculo" runat="server" Text=""></asp:Label>
        </div>
    </div>

</asp:Content>
