$(document).ready(function () {


    $.ajax({
        url: 'ListarTiendasServlet',
        type: 'get',
        dataType: 'json',
        success: function (data) {

            for (var i = 0; i < data.tiendas.length; i++) {
                console.log(data.tiendas[i].id);
                console.log(data.tiendas[i].idfondo);
                console.log(data.tiendas[i].nombre);
                console.log(data.tiendas[i].vendedor);
                console.log(data.tiendas[i].puntuacion);

                $('#div').append(
                        //"<div style='cursor:pointer' onclick='sendName(" + data.tiendas[i].id + ")'><a href ='seleccionProducto.jsp'><img id='perfil' src=Pictures/" + data.tiendas[i].idfondo + "><p id='titulo_uno'>" + data.tiendas[i].nombre + "</p><p id='descripcion'>Vendedor: " + data.tiendas[i].vendedor + "</p><p id='descripcion2'>Puntuación: " + data.tiendas[i].puntuacion + "</p></a></div>",
                        "<div class='column nature' style='cursor:pointer' onclick='sendName(" + data.tiendas[i].id + ")' id='res'><a href ='seleccionProducto2.jsp'> <div class='content'> <img src=Pictures/" + data.tiendas[i].idfondo + " alt='Lights' style='width:100%'> <div class='content2'> <center><div class='empresa'>" + data.tiendas[i].nombre + "</div>        <div class='puntuacion'>Puntuacion: " + data.tiendas[i].puntuacion + "</div> <p class='vendedor'>" + data.tiendas[i].vendedor + "</p> </center>  </div> </div></a> </div>",
                        );
            }
        },
        error: function () {
        }
    });
});
function sendName(idTienda) {

    console.log("Entreeee a la funcioooooon con id:  " + idTienda);
    $.ajax({
        url: 'SeleccionTiendaServlet',
        type: 'get',
        data: {nombre: idTienda},
        dataType: 'json',
        success: function (data) {
            console.log("Nombresito de tienda enviado");
            window.location.href = "seleccionProducto.jsp";
        },
        error: function () {
            console.log("Error en el ajax");
        }
    });
}
function cerrarSesion() {
    $.ajax({
        url: 'CerrarSesionServlet',
        type: 'get',
        dataType: 'json',
        success: function (data) {
            console.log("holaaa");
            window.location.href = "index.jsp";
        },
        error: function () {
        }
    });


}
;
