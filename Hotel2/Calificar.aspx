<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calificar.aspx.cs" Inherits="Hotel.Calificar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
             .sinEstrellas { 
                 background-image: url(Estrellas/estrellaOff.png);
                 background-size: contain;
                 width: 32px; 
                 height: 32px;
             }
             .Calificado { 
                 background-image: url(Estrellas/estrellaOn.png); 
                 background-size: contain;
                 width: 32px; 
                 height: 32px;
             }
             .Enviando { 
                 background-image: url(Estrellas/estrellaWait.png); 
                 background-size: contain;
                 width: 32px; 
                 height: 32px;
             }
            </style>
    </br>
    <div class="row">
       <div class="col-md-6">
            <ajaxtoolkit:Rating ID="califica" runat="server"
                    CurrentRating="0" MaxRating="5"
                    EmptyStarCssClass="sinEstrellas" FilledStarCssClass="Calificado"
                    StarCssClass="Calificado" WaitingStarCssClass="Enviando"/>
       </div>
        </br>
        <div class="col-md-6">
            <asp:Button ID="btnAceptar" runat="server" Text="CALIFICAR" OnClick="btnAceptar_Click" />
        </div>
    </div>
    <div class="row">
        <asp:Label CssClass="alert-danger" ID="lblMensaje" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
