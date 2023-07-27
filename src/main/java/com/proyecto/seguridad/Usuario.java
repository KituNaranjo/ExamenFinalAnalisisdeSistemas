package com.proyecto.seguridad;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.proyecto.datos.Conexion;

public class Usuario {
    private String nombre;
    private String direccion;
    private String login;
    private String clave;
    private Date fechanacimiento;
    private Integer numerocontacto;
    private Integer perfil;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public Integer getPerfil() {
        return perfil;
    }

    public void setPerfil(Integer perfil) {
        this.perfil = perfil;
    }

    public boolean cambiarClave(String nlogin, String nclave, String nuevaContrasena) {
        boolean respuesta = false;
        String sentencia = "SELECT * FROM tb_usuario WHERE login_us='" + nlogin + "' AND clave_us='" + nclave + "';";
        try {
            ResultSet rs;
            Conexion clsCon = new Conexion();
            rs = clsCon.Consulta(sentencia);
            if (rs.next()) {
                String actualizacion = "UPDATE tb_usuario SET clave_us = '" + nuevaContrasena + "' WHERE login_us = '" + nlogin + "';";
                clsCon.Ejecutar(actualizacion);
                respuesta = true;
            } else {
                respuesta = false;
                rs.close();
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return respuesta;
    }

    public boolean verificarUsuario(String nlogin, String nclave) {
        boolean respuesta = false;
        String sentencia = "SELECT * FROM tb_usuario WHERE login_us='" + nlogin + "' AND clave_us='" + nclave + "';";
        try {
            ResultSet rs;
            Conexion clsCon = new Conexion();
            rs = clsCon.Consulta(sentencia);
            if (rs.next()) {
                respuesta = true;
                this.setLogin(nlogin);
                this.setClave(nclave);
                this.setPerfil(rs.getInt(2));
                this.setNombre(rs.getString(3));
            } else {
                respuesta = false;
                rs.close();
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return respuesta;
    }
    
    public boolean registrarUsuario() {
        boolean respuesta = false;
        String sentencia = "INSERT INTO tb_usuario (id_us, id_per, nombre_us, direccion_us, login_us, clave_us, fechanacimiento_us, numerocontacto_us) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            Conexion clsCon = new Conexion();
            PreparedStatement pstmt = clsCon.getConexion().prepareStatement(sentencia);

            // Obtener el siguiente valor para id_us
            int siguienteId = obtenerSiguienteIdUsuario();

            // Establecer los valores para los parámetros de la sentencia preparada
            pstmt.setInt(1, siguienteId);
            pstmt.setInt(2, this.getPerfil());
            pstmt.setString(3, this.getNombre());
            pstmt.setString(4, this.getDireccion());
            pstmt.setString(5, this.getLogin());
            pstmt.setString(6, this.getClave());
            pstmt.setDate(7, this.getFechanacimiento());
            pstmt.setInt(8, this.getNumerocontacto());

            // Ejecutar la inserción
            int filasAfectadas = pstmt.executeUpdate();

            // Si se insertó al menos una fila, la respuesta es verdadera
            respuesta = (filasAfectadas > 0);

            pstmt.close();
        } catch (SQLException ex) {
            System.out.println("Error al registrar usuario: " + ex.getMessage());
        }

        return respuesta;
    }

    public Date getFechanacimiento() {
        return fechanacimiento;
    }

    public void setFechanacimiento(Date fechanacimiento) {
        this.fechanacimiento = fechanacimiento;
    }

    public Integer getNumerocontacto() {
        return numerocontacto;
    }

    public void setNumerocontacto(Integer numerocontacto) {
        this.numerocontacto = numerocontacto;
    }
    
    private int obtenerSiguienteIdUsuario() {
        int siguienteId = 1;
        try {
            Conexion clsCon = new Conexion();
            String sql = "SELECT MAX(id_us) AS max_id FROM tb_usuario;";
            ResultSet rs = clsCon.Consulta(sql);
            if (rs.next()) {
                int maxId = rs.getInt("max_id");
                siguienteId = maxId + 1;
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return siguienteId;
    }
}

