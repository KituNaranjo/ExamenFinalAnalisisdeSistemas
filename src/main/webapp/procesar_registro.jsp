<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.proyecto.seguridad.Usuario" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    String nombre = request.getParameter("nombre");
    String direccion = request.getParameter("direccion");
    String login = request.getParameter("login");
    String clave = request.getParameter("clave");
    String fechaNacimientoStr = request.getParameter("fechanacimiento");
    Date fechaNacimiento = null;
    try {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = sdf.parse(fechaNacimientoStr);
        fechaNacimiento = new Date(utilDate.getTime());
    } catch (Exception e) {
        e.printStackTrace();
    }
    Integer numeroContacto = Integer.parseInt(request.getParameter("numerocontacto"));

    Integer perfil = null;
    String perfilStr = request.getParameter("perfil");
    if (perfilStr != null && !perfilStr.isEmpty()) {
        perfil = Integer.parseInt(perfilStr);
    } else {
        perfil = 1;
    }

    Usuario nuevoUsuario = new Usuario();
    nuevoUsuario.setPerfil(perfil);
    nuevoUsuario.setNombre(nombre);
    nuevoUsuario.setDireccion(direccion);
    nuevoUsuario.setLogin(login);
    nuevoUsuario.setClave(clave);
    nuevoUsuario.setFechanacimiento(fechaNacimiento);
    nuevoUsuario.setNumerocontacto(numeroContacto);

    boolean registroExitoso = nuevoUsuario.registrarUsuario();

    if (registroExitoso) {
        response.sendRedirect("registro_exitoso.jsp");
    } else {
        response.sendRedirect("registro_error.jsp");
    }
%>
