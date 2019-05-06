<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaDescuentosRecepcionista.aspx.cs" Inherits="Hotel2.ListaDescuentosRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h1>Descuentos Ofrecidos</h1>
    <br />

    <div class="row">

        <asp:DataGrid id="ListaDescuentos"
           BorderColor="black"
           BorderWidth="1"
           CellPadding="3"
           AutoGenerateColumns="true"
           runat="server">

         <HeaderStyle BackColor="Black" ForeColor="White">
         </HeaderStyle> 

            
 
      </asp:DataGrid>

    </div>

</asp:Content>
