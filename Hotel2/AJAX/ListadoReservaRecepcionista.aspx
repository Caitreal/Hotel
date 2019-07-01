<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoReservaRecepcionista.aspx.cs" Inherits="Hotel2.AJAX.EliminarReservaRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table class="table table-stripped">
        <thead>
            <tr>
                <th>Id</th>
                <th>Fecha</th>
                <th>Fecha Inicio</th>
                <th>Numero de Noches</th>
                <th>Cliente</th>
                <th>Usuario</th>
                <th>Habitacion</th>
                <th>Cantidad Personas</th>
            </tr>
        </thead>
        <tbody id="reservas">
        </tbody>
    </table>
    

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
                url: "AjaxAPI?f=listado_reserva_recepcionista",
                data: {}
            }).done(function (respuesta) {
                Swal.close();
                var jsonObj = JSON.parse(respuesta);
                var reserva = jsonObj.reservas;
                var client = jsonObj.cliente;
                var user = jsonObj.usuario;
                var habitaciones = jsonObj.habitacion;
                console.log(client[0].Rut);
                console.log(user[0].Nombre);
                console.log(habitaciones[0].Descripcion);

                $.each(reserva, function (i, reservas) {
                    console.log(reservas.ClienteId);
                    console.log(reservas.UsuarioId);
                    console.log(reservas.HabitacionId);

                    var descripcionHabi = "";
                    var nombreUsuario = "";
                    var rutCliente = "";

                    for (var i = 0; i < client.length; i++) {
                        if (client[i].Id == reservas.ClienteId) {
                            rutCliente = client[i].Rut;
                        }
                    }
                    for (var i = 0; i < user.length; i++) {
                        if (user[i].Id == reservas.UsuarioId) {
                            nombreUsuario = user[i].Nombre;
                        }
                    }
                    for (var i = 0; i < habitaciones.length; i++) {
                        if (habitaciones[i].Id == reservas.HabitacionId) {
                            descripcionHabi = habitaciones[i].Descripcion;
                        }
                    }

                    var fila =
                        "<tr>" +
                        "   <td>" + reservas.Id + "</td>" +
                        "   <td>" + reservas.Fecha + "</td>" +
                        "   <td>" + reservas.FechaInicio + "</td>" +
                        "   <td>" + reservas.NumeroNoches + "</td>" +
                        "   <td>" + rutCliente + "</td>" +
                        "   <td>" + nombreUsuario + "</td>" +
                        "   <td>" + descripcionHabi + "</td>" +
                        "   <td>" + reservas.CantidadPersonas + "</td>" +
                        "   <td><div class='btn btn-danger eliminar' reserva_id='" + reservas.Id + "'>Eliminar</div></td>" +
                        "</tr>";

                    $("#habitaciones").append(fila);
                });
                $.('.eliminar').click(function (e) {
                    var boton = $(this);
                    var reserva_id = boton.attr('reserva_id');
                    $.ajax({
                        method: "POST",
                        url: "AjaxAPI?f=eliminar_reserva_recepcionista",
                        data: { 'reserva_id': reserva_id, }
                    }).done(function (respuesta) {
                        var jsonObj = JSON.parse(respuesta);
                        var resultado = jsonObj.mensaje;
                        if (resultado == "OK") {
                            boton.parent().parent().remove();
                        }
                        else {
                            Swal.fire({
                                type: 'error',
                                title: 'Error: ' + resultado,
                            });
                        }
                    });
                });
            });
        });
    </script>
</asp:Content>
