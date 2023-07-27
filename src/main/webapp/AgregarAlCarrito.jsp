<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.proyecto.negocio.CarritoItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    double precio = Double.parseDouble(request.getParameter("precio"));
    int cantidad = 1; // Puedes modificar esto para permitir que el usuario ingrese la cantidad
    
    // Obtener el carrito de compras de la sesión o crear uno nuevo
    List<CarritoItem> carrito = (List<CarritoItem>) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<>();
    }
    
    // Verificar si el producto ya está en el carrito
    boolean productoEnCarrito = false;
    for (CarritoItem item : carrito) {
        if (item.getId() == id) {
            item.setCantidad(item.getCantidad() + cantidad);
            productoEnCarrito = true;
            break;
        }
    }
    
    // Si el producto no está en el carrito, agregarlo
    if (!productoEnCarrito) {
        carrito.add(new CarritoItem(id, nombre, cantidad, precio));
    }
    
    // Actualizar el carrito de compras en la sesión
    session.setAttribute("carrito", carrito);
    
    // Redirigir a la página de productos
    response.sendRedirect("productos2.jsp");
%>
