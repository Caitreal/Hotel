<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarHabitacion.aspx.cs" Inherits="Hotel.EditarHabitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lblDescripcion" runat="server" Text="DESCRIPCIÓN"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtDescripcion" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lblPrecio" runat="server" Text="PRECIO"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtPrecio" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lblTipoHabitacion" runat="server" Text="TIPO"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlTipoHabitacion" CssClass="form-control" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Button ID="btnAceptar" CssClass="btn btn-info" runat="server" Text="ACEPTAR" OnClick="btnAceptar_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 alert-danger">
            <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
