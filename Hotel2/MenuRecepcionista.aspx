<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuRecepcionista.aspx.cs" Inherits="Hotel2.MenuRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

        <div class="row">
            <div class="col-md-4">                
                <a href="ListadoHabitacionesRecepcionista.aspx" class="btn btn-info">Listado de Habitaciones</a>                           
                <a href="PreciosHabitacionesRecepcionista.aspx" class="btn btn-info">Precios de Habitaciones</a>                               
            </div>
            <div class="col-md-4">                
                <a href="ListaDescuentosRecepcionista.aspx" class="btn btn-info">Consultar Descuento</a>                
                <a href="ReservarHabitacionRecepcionista.aspx" class="btn btn-info">Reservar Habitacion</a>                
            </div>
        </div>

    <br />

    <div class="row">
            <div class="col-md-4">                
                <a href="EliminarReservaRecepcionista.aspx" class="btn btn-info">Eliminar Reservacion</a>                                                        
            </div>
            <div class="col-md-4">                
                <a href="#" class="btn btn-info">Mostrar Fotos</a>                
            </div>
        </div>

   

</asp:Content>
