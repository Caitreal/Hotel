<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calificacion.aspx.cs" Inherits="Hotel2.AJAX.Calificacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
       <div class="col-md-6">
            <ajaxToolkit:Rating ID="rating" runat="server"
                    CurrentRating="0" MaxRating="5"
                    EmptyStarCssClass="sinEstrellas" FilledStarCssClass="Calificado"
                    StarCssClass="Calificado" WaitingStarCssClass="Calificado"/>
       </div>
        </br>
    </div>
    <br />
    <button id="btn-calificar" onclick="calificar()" class="btn btn-success">Calificar</button>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script>

        function calificar() {


            Swal.fire({
                type: 'success',
                title: 'Por favor espere',
                showConfirmButton: false,
            });

            var reserva_id = getUrlParameter("reserva_id");
            var valor = $("#rating").val();

            $.ajax({
                method: "POST",
                url: "AjaxAPI?f=evaluar_habitacion",
                data: {
                    "reserva_id": reserva_id,
                    "valor": valor
                }
            }).done(function (respuesta) {
                Swal.close();
                var jsonObj = JSON.parse(respuesta);
                var mensaje = jsonObj.mensaje;
                alert(mensaje);

            });


        }

        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
        };

        $(document).ready(function (e) {

            Swal.fire({
                type: 'success',
                title: 'Por favor espere',
                showConfirmButton: false,
            });

            $.ajax({
                method: "POST",
                url: "AjaxAPI?f=evaluar_habitacion",
                data: {
                    "reserva_id": reserva_id
                }
            }).done(function (respuesta) {
                Swal.close();
                var jsonObj = JSON.parse(respuesta);
                var mensaje = jsonObj.mensaje;
                alert(mensaje);

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
