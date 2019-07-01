<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GananciasMesAjax.aspx.cs" Inherits="Hotel2.GananciasMesAjax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <br />

    <h1>Ganancias de un Mes</h1>

    <br />

    <label>Año: </label>
    <asp:DropDownList ID="ListAnios" runat="server"></asp:DropDownList>
    <br />
    <label>Mes: </label>
    <asp:DropDownList ID="ListMeses" runat="server"></asp:DropDownList>
    <br />
    <div class="btn btn-info" id="calcular">Calcular</div>
    <br />
    <label id="Mensaje"></label>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script>
        $("#calcular").click(function (e) {
            var anio = $("#MainContent_ListAnios").val();
            var mes = $("#MainContent_ListMeses").val();

            $ajax({
                method: "post",
                url: "../AjaxDannyAPI?f=calcularMes",
                data: { 'anio': anio, 'mes': mes }
            }).done(function (envio) {
                var json = JSON.parse(envio);
                $("#MainContent_Mensaje").text(json.respuesta);
            });
        });

    </script>


</asp:Content>
