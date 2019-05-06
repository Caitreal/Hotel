<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PreciosHabitacionesRecepcionista.aspx.cs" Inherits="Hotel2.PreciosHabitacionesRecepcionista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br/>
    <h1>Precios segun Tipo de Habitacion</h1>
    <br/>
    <div class="row">
        <div class="col-md-4">
            <label for="tipohabitacion">Tipo Habitacion</label>
        </div>
        <div class="col-md-6">
            <asp:DropDownList ID="DropListTipoHabitacion" runat="server">
                
            </asp:DropDownList>
        </div>
    </div>    


    <br />

    <div>

        <table class="table table-stripped">
            <thead>
                <tr>
                    <th>
                        ID
                    </th>
                    <th>
                        Precio
                    </th>
                    <th>
                        Descipcion
                    </th>
                    <th>
                        Tipo
                    </th>
                    <th>
                        Cantidad Personas
                    </th>
                    <th>
                        Ver
                    </th>
                </tr>
            </thead>
            <tbody>

                <%
                    foreach (var h in ListaHab)
                    {

                    %>

                <tr>
                    <td>
                        <%= h.Id %>
                    </td>
                    <td>
                        <%= h.Precio %>
                    </td>
                    <td>
                        <%= h.Descripcion %>
                    </td>
                    <td>
                        <%= h.TipoHabitacion.Nombre %>
                    </td>
                    <td>
                        <%= h.TipoHabitacion.CantidadPersonas %>
                    </td>
                    <td>
                       <a class="btn btn-success" href="VerHabitacionRecepcionista.aspx?Id=<%=h.Id%>">Ver</a>
                    </td>
                </tr>

                <%
                    }
                    %>

            </tbody>
            

        </table>

    </div>

</asp:Content>
