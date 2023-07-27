<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Productos</title>
</head>
<body>
    <h1>Lista de Productos</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Producto</th>
            <th>Cantidad</th>
            <th>Precio</th>
            <th>Acción</th>
        </tr>
        <c:forEach items="${productos}" var="producto">
            <tr>
                <td>${producto.id}</td>
                <td>${producto.nombre}</td>
                <td>${producto.cantidad}</td>
                <td>${producto.precio}</td>
                <td><a href="AgregarAlCarrito.jsp?id=${producto.id}&nombre=${producto.nombre}&precio=${producto.precio}">Agregar al carrito</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="carrito.jsp">Ver carrito de compras</a>
</body>
</html>
