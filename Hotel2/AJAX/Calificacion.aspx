<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calificacion.aspx.cs" Inherits="Hotel2.AJAX.Calificacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
       <div class="col-md-6">
            <ajaxtoolkit:Rating ID="calificacion" runat="server"
                    CurrentRating="0" MaxRating="5"
                    EmptyStarCssClass="sinEstrellas" FilledStarCssClass="Calificado"
                    StarCssClass="Calificado" WaitingStarCssClass="Enviando"/>
       </div>
        </br>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script>
        $(document).ready(function (e) {


            Swal.fire({
                type: 'success',
                title: 'Por favor espere',
                showConfirmButton: false,
            });
            //ahora haremos la llamada ajax
            $.ajax({
                method: "POST",
                url: "http://localhost:52853/AjaxAPI?f=evaluar_habitacion",
                data: {}
            }).done(function (respuesta) {
                Swal.close();
                var jsonObj = JSON.parse(respuesta);
                var reserva = jsonObj.reservas;
                var habitaciones = jsonObj.habitacion;
                console.log(reserva[0].Descripcion);
                console.log(habitaciones[0].Descripcion);

            });
        });
        </script>

    <style type="text/css">
             .sinEstrellas { 
                 background-image: url(../Estrellas/estrellaOff.png);
                 background-size: contain;
                 width: 32px; 
                 height: 32px;
             }
             .Calificado { 
                 background-image: url(../Estrellas/estrellaOn.png); 
                 background-size: contain;
                 width: 32px; 
                 height: 32px;
             }
             .Enviando { 
                 background-image: url(../Estrellas/estrellaWait.png); 
                 background-size: contain;
                 width: 32px; 
                 height: 32px;
             }
            </style>
</asp:Content>
