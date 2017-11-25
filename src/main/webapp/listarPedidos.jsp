<%-- 
    Document   : listarPedidos
    Created on : 24-nov-2017, 21:52:51
    Author     : Carlos Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript" src="listarPedidosAjax.js"></script>
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" href="Botones.css" />
        <title>Tus Pedidos</title>
    </head>
    <body>
        <% HttpSession mySession = request.getSession();
            String correo = (String) mySession.getAttribute("correo");
        %>
        
        <% if(correo==null){%>
            <META HTTP-EQUIV="REFRESH" CONTENT="0;URL=index.jsp">
        <%}%>
        <!-- MAIN (Center website) -->
        <div class="main">
            <center><div id="logo"><img src="Pictures/AppuMartLogo.png" style="width: 30%; height: 30%; margin-top: -45px; margin-bottom: -40px;"></div></center>

            <center><div id="ped"></div></center>

            <center><button style="margin-top: 20px; background-color: #e30020; cursor: alias;" onclick="cerrarSesion()"><i class="fa fa-power-off"></i> Cerrar Sesion</button></center>
            <!-- END MAIN -->
        </div>
    </body>
</html>
