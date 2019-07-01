<%@ Page Title="Habitaciones Disponibles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoHabitacionesAdministrador.aspx.cs" Inherits="Hotel2.AJAX.ListadoHabitacionesCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table class="table table-stripped">
        <thead >
            <tr>
                <th>Id</th>
                <th>Precio</th>
                <th>Descripcion</th>
                <th>Tipo de Habitación</th>
                <th>Cantidad de Personas</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody id="habitacion">
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
                url: "AjaxAPI?f=listado_habitaciones",
                data: {}
            }).done(function (respuesta) {
                Swal.close();
                var jsonObj = JSON.parse(respuesta);
                var habitaciones = jsonObj.habitaciones;
                var tipo = jsonObj.tipo;
                                
                $.each(habitaciones, function (i, habitacion) {
                    for (var i = 0; i < tipo.length; i++) {
                        if (tipo[i].Id == habitacion.TipoHabitacionId) {
                            nombreTipo = tipo[i].Nombre;
                            capacidad = tipo[i].CantidadPersonas;
                        }
                    }
                    console.log(habitacion.TipoHabitacionId);

                    var fila =
                        "<tr>" +
                        "   <td>" + habitacion.Id + "</td>" +
                        "   <td>" + habitacion.Precio + "</td>" +
                        "   <td>" + habitacion.Descripcion + "</td>" +
                        "   <td>" + nombreTipo + "</td>" +
                        "   <td>" + capacidad + "</td>" +
                        "   <td><div class='btn btn-danger eliminar' habitacion_id='" + habitacion.Id + "'>Eliminar</div></td>" +
                        "</tr>";

                    $("#habitacion").append(fila);
                });



                $('.eliminar').click(function (e) {
                    var boton = $(this);
                    var habitacion_id = boton.attr('habitacion_id');
                    $.ajax({
                        method: "POST",
                        url: "AjaxAPI?f=eliminar_habitacion",
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
