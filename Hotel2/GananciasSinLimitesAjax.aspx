<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GananciasSinLimitesAjax.aspx.cs" Inherits="Hotel2.GananciasSinLimitesAjax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="http://code.jquery.com/jquery-1.9.1.js%22%3E</script>
    <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js%22%3E</script>
    <script>
        $(function () {
            $("#datepickerInicio").datepicker({ dateFormat: 'dd-mm-yy' });
            $("#datepickerFin").datepicker({ dateFormat: 'dd-mm-yy' });
        });
    </script>

    <br />
    <h1>Ganancias Entre Fechas</h1>
    <br />
    <div class="row">
        <div class="col-md-6">
            <label>Fecha Inicio: </label>
        </div>
        <div class="col-md-6">
            <label>Fecha Fin: </label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <input type="text" id="datepickerInicio">
        </div>
        <div class="col-md-6">
            <input type="text" id="datepickerFin">
        </div>
    </div>
    <br />
    <div class="btn btn-info" id="calcular">Calcular</div>
    <br />
    <label id="Mensaje"></label>

    <script>
        $("#calcular").click(function (e) {
            var Inicio = $("#datepickerInicio").val();
            var Fin = $("#datepickerFin").val();

            $ajax({
                method: "post",
                url: "../AjaxDannyAPI?f=calcularSinLimites",
                data: { 'inicio': Inicio, 'fin': Fin}
            }).done(function (envio) {
                var json = JSON.parse(envio);
                $("#MainContent_Mensaje").text(json.respuesta);
            });
        });
    </script>

</asp:Content>
