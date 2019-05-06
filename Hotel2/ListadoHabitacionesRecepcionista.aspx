<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoHabitacionesRecepcionista.aspx.cs" Inherits="Hotel2.ListadoHabitacionesRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Habitaciones Disponibles</h1>

    <div class="row">
        <div class="col-md-4">
            <label for="DropListTipoHabitacion">Tipo Habitacion</label>
        </div>
        <div class="col-md-6">
            <asp:DropDownList ID="DropListTipoHabitacion" runat="server" OnSelectedIndexChanged="DropListTipoHabitacion_SelectedIndexChanged" >
                
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
