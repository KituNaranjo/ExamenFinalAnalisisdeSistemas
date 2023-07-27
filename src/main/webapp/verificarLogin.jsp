<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.proyecto.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>PAPELERIA VANESSA</title>
<script type="text/javascript">
	function mostrarMensaje(mensaje) {
		alert(mensaje);
	}
</script>
</head>
<body>
<main>
	<header class="banner">
		<h2 class="destacado">
		<img src="imagenes/LogoPapeleria.png" alt="Papeleria" width="600" height="350">
		</h2>
		<h1>"¡Papelería Vanessa, tu aliado en el camino del aprendizaje y la creatividad!"</h1>
	</header>
	<nav>
		<a href="index.jsp">Inicio</a>
		<a href="catalogo_buscar.jsp">Catálogo</a>
		<a href="sobremi.jsp">Sobre mi</a>
		<a href="login.jsp">Iniciar Sesión</a>
	</nav>
	<div align="center" style="padding: 40px; background-color: #D6D6D6;">
	<%
	Usuario usuario = new Usuario();
	String login = request.getParameter("usuario");
	String clave = request.getParameter("clave");
	HttpSession sesion = request.getSession();
	boolean respuesta = usuario.verificarUsuario(login, clave);
	if (respuesta) {
		sesion.setAttribute("usuario", usuario.getNombre());
		sesion.setAttribute("perfil", usuario.getPerfil()); 
		%>
		<script type="text/javascript">
			mostrarMensaje("Inicio de sesión exitoso. Redireccionando a la página de menú.");
			window.location.href = "menu.jsp";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			mostrarMensaje("Datos incorrectos. Vuelva a intentarlo.");
			window.location.href = "login.jsp";
		</script>
		<%
	}
	%>
</main>
</body>
</html>