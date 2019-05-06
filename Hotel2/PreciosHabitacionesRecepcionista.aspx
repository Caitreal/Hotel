<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PreciosHabitacionesRecepcionista.aspx.cs" Inherits="Hotel2.PreciosHabitacionesRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br/>
    <h1>Precios segun Tipo de Habitacion</h1>
    <br/>
    <div class="row">
        <div class="col-md-4">
            <label for="tipohabitacion">Tipo Habitacion</label>
        </div>
        <div class="col-md-6">
            <asp:DropDownList ID="DropListTipoHabitacion" runat="server">
                
            </asp:DropDownList>
        </div>
    </div>    

    <br />

    <div class="row">

        <asp:DataGrid id="Lista"
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
