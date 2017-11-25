<%-- 
    Document   : InfoPedido
    Created on : 25-nov-2017, 0:09:23
    Author     : Carlos Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script type="text/javascript" src="InfoPedidoAjax.js"></script>
        <link href="StyleLogin.css" rel='stylesheet' type='text/css'>
        <link href="https://fonts.googleapis.com/css?family=Leckerli+One" rel="stylesheet">
        <title>Tus Pedidos</title>
    </head>
    <body>
         <% HttpSession mySession = request.getSession();
                String correo = (String) mySession.getAttribute("correo");
            %>

            <%if (correo == null) {%>
            <META HTTP-EQUIV="REFRESH" CONTENT="0;URL=index.jsp">
            <%}%>
            
            
        <center><div id="pedido"></div></center>
    </body>
</html>
