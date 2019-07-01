<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoHabitacionesCliente.aspx.cs" Inherits="Hotel2.AJAX.ListadoHabitacionesCliente1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table class="table table-stripped">
        <thead>
            <tr>
                <th>Descripcion</th>
                <th>Precio</th>
                <th>Tipo de Habitacion</th>
                <th>Capacidad</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody id="habitaciones">
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

            
            //ahora haremos la llamada ajax segun el tipo de habitacion
            $.ajax({
                method: "POST",
                url: "AJAX/AjaxAPI?f=listado_habitaciones_cliente",
                data: {}
            }).done(function (respuesta) {
                Swal.close();
                var jsonObj = JSON.parse(respuesta);
                var habitaciones = jsonObj.habitaciones;
                var tipo = jsonObj.tipos_habitaciones;
                console.log(tipo[0].Nombre);

                $.each(habitaciones, function (i, habitacion) {
                    console.log(habitacion.TipoHabitacionId);
                    var nombreTipo = "";
                    var capacidad = 0;
                    for (var i = 0; i < tipo.length; i++) {
                        if (tipo[i].Id == habitacion.TipoHabitacionId) {
                            nombreTipo = tipo[i].Nombre;
                            capacidad = tipo[i].CantidadPersonas;
                        }
                    }
                    var fila =
                        "<tr>" +
                        "   <td>" + habitacion.Descripcion + "</td>" +
                        "   <td>" + habitacion.Precio + "</td>" +
                        "   <td>" + nombreTipo + "</td>" +
                        "   <td>" + capacidad + "</td>" +
                        "   <td><div class='btn btn-danger eliminar' habitacion_id='" + habitacion.Id + "'>Eliminar</div></td>" +
                        "</tr>";

                    $("#habitaciones").append(fila);
                });

                $('.eliminar').click(function (e) {
                    var boton = $(this);
                    var habitacion_id = boton.attr('habitacion_id');
                    $.ajax({
                        method: "POST",
                        url: "http://localhost:52853/AjaxAPI?f=eliminar_habitacion",
                        data: { 'habitacion_id': habitacion_id, }
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
