<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListadoHabitacionesRecepcionista.aspx.cs" Inherits="Hotel2.AJAX.ListadoHabitacionesRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <table class="table table-stripped">
        <thead>
            <tr>
                <th>Id</th>
                <th>Precio</th>
                <th>Descripcion</th>
                <th>Tipo de Habitacion</th>
                <th>Capacidad</th>
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
                url: "http://localhost:52853/AjaxAPI?f=listado_habitaciones_recepcionista",
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
            });
        });
    </script>
</asp:Content>
