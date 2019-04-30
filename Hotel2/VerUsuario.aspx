<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerUsuario.aspx.cs" Inherits="Hotel2.VerUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lbl1" runat="server" Text="Nombre: "></asp:Label>
            
        </div>
        <div class="col-md-4">
            <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="lbl2" runat="server" Text="Tipo de Usuario: "></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlUsuarioTipo" CssClass="form-control" enabled="false" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <asp:Button ID="btnEditarUsuario" CssClass="btn btn-success" runat="server" Text="Editar Datos"/>
        </div>
    </div>
</asp:Content>
