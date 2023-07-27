<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.proyecto.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>PAPELERIA VANESSA</title>
</head>
<body>
<main>
	<header class="banner">
		<h2 class="destacado">
		<img src="imagenes/LogoPapeleria.png" alt="Papeleria" width="600" height="350">
		</h2>
		<h1>"�Papeler�a Vanessa, tu aliado en el camino del aprendizaje y la creatividad!"</h1>
	</header>
	<nav>
		<a href="index.jsp">Inicio</a>
		<a href="catalogo_buscar.jsp">Cat�logo</a>
		<a href="sobremi.jsp">Sobre mi</a>
		<a href="login.jsp">Iniciar Sesi�n</a>
	</nav>
	<h3 class="title">Cambio de clave</h3>
    <form method="post" action="cambioClave.jsp" onsubmit="return confirmarCambioClave()">
        <table>
            <tr>
                <td>Usuario:</td>
                <td><input type="text" name="login" required style="width: 200px; height: 12px; border-radius: 20px; padding: 10px; font-size: 16px;"></td>
            </tr>
            <tr>
                <td>Contrase�a actual:</td>
                <td><input type="password" name="claveActual" required style="width: 200px; height: 12px; border-radius: 20px; padding: 10px; font-size: 16px;"></td>
            </tr>
            <tr>
                <td>Nueva contrase�a:</td>
                <td><input type="password" name="nuevaContrasena" required style="width: 200px; height: 12px; border-radius: 20px; padding: 10px; font-size: 16px;"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Cambiar contrase�a" class="boton-enlace"></td>
            </tr>
        </table>
    </form>
    <%    
    Usuario user = new Usuario();
    String login = request.getParameter("login");
    String claveActual = request.getParameter("claveActual");
    String nuevaContrasena = request.getParameter("nuevaContrasena");
    if (login != null && claveActual != null && nuevaContrasena != null) {
        boolean cambio = user.cambiarClave(login, claveActual, nuevaContrasena);
        if (cambio) {
    %>
    <script>
        alert("Contrase�a cambiada exitosamente");
        window.location.href = "login.jsp"; // Redirigir a login.jsp despu�s del cambio exitoso
    </script>
    <%
        } else {
    %>
    <script>
        alert("No se pudo cambiar la contrase�a. Por favor, int�ntalo nuevamente.");
    </script>
    <%
        }
    }
    %>
	<br>
	<footer>
		<h3>Informaci�n de contacto</h3>
		<h3>Nos encontramos ubicados:</h3>
		<h3>Centro Hist�rico: El Tejar, Calle Ba�os N5-253 y Francisco Suarez atr�s del cementerio el Tejar Casa Esquinera Color Amarillo Dos pisos</h3>
		<a href="https://www.google.com.ec/maps/place/N5-257,+Ba%C3%B1os,+Quito+170407/@-0.2127765,-78.5183516,19z/data=!3m1!4b1!4m6!3m5!1s0x91d59a2daa250a15:0xd8a99da29fea7245!8m2!3d-0.2127778!4d-78.5177079!16s%2Fg%2F11h5tt4jx6?entry=ttu" class="boton-enlace">Ubicacion</a>
		<h3>Todos los derechos reservados Christian Naranjo � 2023 Papeler�a Vanessa</h3>
    </footer>
</main>
</body>
</html>
