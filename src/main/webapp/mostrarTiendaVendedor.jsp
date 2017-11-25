<%@page import="vo.VendedorVO"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title id="titulo"></title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>-->
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script type="text/javascript" src="mostrarTiendaVendedorAjax.js"></script>
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">

	<script>
            function donotification(access){
                if (access==="1"){
			Push.create("AppuNoti",
                {
			body: "Tienes pedidos pendientes!",
			icon: "Pictures/checkout.png",
			timeout: 9000,
			onClick: function () {
                                setBooleanFalse();
				window.location="https://mail.google.com/mail/u/1/#inbox";
				this.close();
			}
		});
		}else{
			console.log("no hay permiso para la notificacion");
		}
            }
	</script>
	    
        <style>
            @font-face
            {
                font-family: 'carrito.ttf';
                src: url('Pictures/carrito.ttf');
            }
            body{
                background-color: #B4B4B4;
                /*background-color: #f1f1f1;*/
                /*font-family: 'carrito.ttf';*/
            }
            .avatar{
                width:150px;
                height:150px;
                border-radius:100%;
                border:#fff 3px solid;
                box-shadow:rgba(0,0,0,0.4) 0px 2px 4px, inset rgba(0,0,0,0.4) 0px 3px 2px;
                overflow:hidden;
                background-image:-webkit-linear-gradient(top left, rgba(255,255,255,0.9) 0%, rgba(255,255,255,0.3) 50%, rgba(255,255,255,0) 50%), url("Pictures/AppuMartLogo.png");
                background-image:-moz-linear-gradient(top left, rgba(255,255,255,0.9) 0%, rgba(255,255,255,0.3) 50%, rgba(255,255,255,0) 50%), url("Pictures/AppuMartLogo.png");
                background-image:linear-gradient(top left, rgba(255,255,255,0.9) 0%, rgba(255,255,255,0.3) 50%, rgba(255,255,255,0) 50%), url("Pictures/AppuMartLogo.png");
                background-size: auto, 100%;
                z-index: 2000;
                margin-bottom: 20px;
                position: absolute;
                margin: auto;
                margin-left: -33px;
                margin-top: -30px;
            }
            .div-img .img {
                -webkit-border-radius: 10px;
                -moz-border-radius: 10px;
                border-radius: 10px;
                transform: scale(1);
                -ms-transform: scale(1);
                -moz-transform: scale(1);
                -webkit-transform: scale(1);
                -o-transform: scale(1);
                -webkit-transition: all 500ms ease-in-out;
                -moz-transition: all 500ms ease-in-out;
                -ms-transition: all 500ms ease-in-out;
                -o-transition: all 500ms ease-in-out;
            }
            #nombre2{
                font-family: 'carrito.ttf';
            }
            .sin{
                border-radius: 3px;
            }
            .sin:hover{
                /*box-shadow: 2px 2px 5px #000000;*/
                color: #000000;
            }
            #menu{
                color: #999;
            }
        </style>
        <script>
            function cerrarSesion() {
                $.ajax({
                    url: 'CerrarSesionServlet',
                    type: 'get',
                    dataType: 'json',
                    success: function (data) {
                        console.log("Cerrando Sesion");
                        window.location.href = "index.jsp";
                    },
                    error: function () {
                    }
                });
            }
            ;
        </script>
    </head>
    <body>

        <%HttpSession mySession = request.getSession();
            VendedorVO vo = (VendedorVO) mySession.getAttribute("vendedor");
        %>


        <%if (vo == null) {%>
        <META HTTP-EQUIV="REFRESH" CONTENT="0;URL=index.jsp">
        <%}%>

        <!-- Wrapper -->
        <div id="wrapper" style="padding-bottom: 0px">

            <!-- Header -->
            <header id="header">
                <div class="logo" id="div"></div>
                <div class="content">
                    <div class="inner" style="padding-bottom: 20px;">
                        <div id="nombre"></div>
                        <div id="punt"></div>
                    </div>
                </div>
                <nav>
                    <ul>
                        <li style="background-color: #087eac;" class="sin"><a href="mostrarProductosBodega.jsp">Ver Mis Productos</a></li>
                        <li style="background-color: #087eac;" class="sin"><a href="ListarPedidos.jsp">Ver Mis Pedidos</a></li>
                        <li style="background-color: #fff" class="sin"><a href="editarTienda.jsp" id="menu">Editar Mi Tienda</a></li>
                        <li style="background-color: #e30020" class="sin"><div onclick='cerrarSesion()' style="cursor: pointer" id="out"><a>Cerrar Sesion</a></div></li>
                    </ul>
                </nav>
            </header>

            <!-- Footer -->
            <footer id="footer" style="margin-top: 0px;">
                <!--<p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>-->
                <img id='my' src="Pictures/AppuMartLogo.png" style=" width: 100px; height: 100px;">
            </footer>
        </div>

        <!-- BG -->
        <!--<div id="bg"></div>-->

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>
