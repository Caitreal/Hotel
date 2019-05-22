<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calificar.aspx.cs" Inherits="Hotel.Calificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    </br>
    <div class="row">
        <div class="col-md-6">
            <div class="ec-stars-wrapper">
	            <a href="#" data-value="1" title="1">&#9733;</a>
	            <a href="#" data-value="2" title="2">&#9733;</a>
	            <a href="#" data-value="3" title="3">&#9733;</a>
	            <a href="#" data-value="4" title="4">&#9733;</a>
	            <a href="#" data-value="5" title="5">&#9733;</a>
            </div>
        </div>
        <div class="col-md-6">
            <asp:Button ID="btnAceptar" runat="server" Text="CALIFICAR" OnClick="btnAceptar_Click" />
        </div>
    </div>
    <div class="row">
        <asp:Label CssClass="alert-danger" ID="lblMensaje" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
