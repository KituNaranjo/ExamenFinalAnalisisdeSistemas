<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registro Exitoso</title>
</head>
<body>
    <h1>Registro exitoso</h1>
    <p>¡El usuario se ha registrado correctamente en la base de datos!</p>
    <p>¡Bienvenido/a, <%= request.getParameter("nombre") %>!</p>
    <p><a href="index.jsp">Ir al Inicio</a></p>
</body>
</html>
