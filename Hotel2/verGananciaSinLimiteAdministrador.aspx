<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verGananciaSinLimiteAdministrador.aspx.cs" Inherits="Hotel2.verGananciaSinLimiteAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Calcular Ganancias</h1>
    <br />

    <div class="row">
        <div class="col-md-4">
            <label>Inicio del Rango</label>
        </div>
        <div class="col-md-4">
            <label>Fin del Rango</label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </div>
        <div class="col-md-4">
            <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
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
