<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuAdministrador.aspx.cs" Inherits="Hotel2.MenuAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    </br>
    <div class="row">
        <div class="col-md-3">
            <asp:Button ID="btnLista" runat="server" CssClass="btn btn-info" Text="Listado de Habitaciones" OnClick="btnLista_Click" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnCambiar" runat="server" CssClass="btn btn-info" Text="Cambiar valor de descuentos" OnClick="btnCambiar_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Button ID="btnGananciaMes" runat="server" CssClass="btn btn-info" Text="Ver Ganancias Mes" OnClick="btnGananciaMes_Click" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnGananciaRango" runat="server" CssClass="btn btn-info" Text="Ver Ganancia Rango" OnClick="btnGananciaRango_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Button ID="btnGananciaMesAjax" runat="server" CssClass="btn btn-info" Text="Ver Ganancias Mes Ajax" OnClick="btnGananciaMesAjax_Click"/>
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnGananciaRangoAjax" runat="server" CssClass="btn btn-info" Text="Ver Ganancia Rango Ajax" OnClick="btnGananciaRangoAjax_Click"/>
        </div>
    </div>

</asp:Content>
