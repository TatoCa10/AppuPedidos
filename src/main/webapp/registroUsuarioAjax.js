/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function (){
    
    $("#boton").click(function (){
        console.log("entrooooo");
        correo = $("#correo").val();
        pass = $("#pass").val();
        pass2 = $("#pass2").val();
        console.log(correo+pass+pass2)
        if(pass === pass2){
            $("#error").html("");
            $.ajax({
                url: 'RegistroUsuarioServlet',
                type: 'GET',
                data: {correo:correo},
                dataType: 'json',
                success: function(data){
                    console.log("hola?");
                    if (data.universidad === "si") {
                        if(data.confirmacion === "ok"){
                            console.log("Entró para mostrar");
                            document.getElementById("confirmacion").style.display = 'block';
                        }
                    }else{
                        alert("El correo debe ser de la universidad");
                    }
                },
                error: function(data){
                    alert("FALLÓ");
                }
            });
        }else{
            $("#error").html("");
            $("#error").append("<p>Las contraseñas no coinciden</p>");
        }
        
    });
    
    $("#confirmar").click(function () {
        console.log("Entroooo en confirmar");
        numero = $("#numero").val();
        correo = $("#correo").val();
        nombre = $("#nombre").val();
        pass = $("#pass").val();
        celular = $("#celular").val();

        $.ajax({
            url: 'RegistroUsuarioServlet',
            type: 'POST',
            data: {correo: correo, nombre: nombre, pass: pass, celular: celular, numero: numero},
            dataType: 'json',
            success: function (data) {

                if (data.coincidencia === "ok") {
                    $("#error").html("");
                    console.log("Entroooooo al 2 success");
                    if (data.confirmacion === "ok") {
                        alert("Se agregó correctamente :)");
                        window.location.href = "listarTiendas.jsp";
                    } else {
                        alert("No se pudo agregar");
                    }
                } else {
                    $("#error").html("");
                    $("#error").append("<p>número erróneo</p>");
                }
            }
        });
    });
});
