<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.proyecto.negocio.*"%>
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
	<div align="center" style="padding: 40px;">
	<%String usuario;
	HttpSession sesion = request.getSession();
 	if (sesion.getAttribute("usuario") == null) {
 	%>
 		<jsp:forward page="login.jsp">
 		<jsp:param name="error" value="Debe registrarse"/>
 		</jsp:forward>
 	<%
 	} else {
 		usuario=(String)sesion.getAttribute("usuario");
 		int perfil=(Integer)sesion.getAttribute("perfil");
 	%>
 		<h3 class="title">Ingresar un producto</h3>
	<%
	out.println(usuario);
 	}
	%>
		<%
		Producto prod=new Producto();
		String str_id = request.getParameter("id");
		int id = Integer.parseInt(str_id);
		String str_categoria=request.getParameter("cmbCategoria");
		int cat=Integer.parseInt(str_categoria);
		String nombre=request.getParameter("nombre");
		String str_cant=request.getParameter("cantidad");
		int cantidad=Integer.parseInt(str_cant);
		String str_precio=request.getParameter("precio");
		double precio=Double.parseDouble(str_precio);
		out.print(prod.ingresarProducto(id, cat, nombre, cantidad, precio, ""));
		%>
  	</div>
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