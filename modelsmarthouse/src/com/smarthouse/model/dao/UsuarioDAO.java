package com.smarthouse.model.dao;

import com.smarthouse.model.base.BaseDAO;
import com.smarthouse.model.criteria.UsuarioCriteria;
import com.smarthouse.model.entity.TipoUsuario;
import com.smarthouse.model.entity.Usuario;
import com.smarthouse.model.util.Md5Util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UsuarioDAO implements BaseDAO<Usuario> {

    @Override
    public void create(Connection conn, Usuario entity) throws Exception {
        String query = "INSERT INTO usuario (usu_nome, usu_email, usu_senha, usu_tipo_usuario_fk) VALUES (?, ?, ?, ?) RETURNING usu_id;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setString(++i, entity.getEmail());
        ps.setString(++i, Md5Util.toMd5(entity.getSenha()));
        ps.setLong(++i, entity.getTipo_usuario().getId());

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            entity.setId(rs.getLong("usu_id"));
        }
        rs.close();
        ps.close();
    }

    @Override
    public void update(Connection conn, Usuario entity) throws Exception {
        String query = "UPDATE usuario SET usu_nome=?, usu_email=?, usu_senha=?, usu_tipo_usuario_fk=? WHERE usu_id=?;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setString(++i, entity.getEmail());
        ps.setString(++i, Md5Util.toMd5(entity.getSenha()));
        ps.setLong(++i, entity.getTipo_usuario().getId());
        ps.setLong(++i, entity.getId());
        ps.execute();
        ps.close();

    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String query = "DELETE FROM usuario WHERE usu_id=?;";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public Usuario readById(Connection conn, Long id) throws Exception {
        Usuario pojo = null;
        String query = "SELECT usu_id, usu_nome, usu_email, usu_senha, t_usu_id, t_usu_nome FROM usuario ";
        query += "LEFT JOIN tipo_usuario ON usu_tipo_usuario_fk = t_usu_id WHERE usu_id=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            pojo = new Usuario();
            pojo.setId(rs.getLong("usu_id"));
            pojo.setNome(rs.getString("usu_nome"));
            pojo.setEmail(rs.getString("usu_email"));
            pojo.setSenha(rs.getString("usu_senha"));
            TipoUsuario tipoUSuario = new TipoUsuario();
            tipoUSuario.setId(rs.getLong("t_usu_id"));
            tipoUSuario.setNome(rs.getString("t_usu_nome"));
            pojo.setTipo_usuario(tipoUSuario);
        }
        rs.close();
        ps.close();
        return pojo;

    }

    @Override
    public List<Usuario> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        List<Usuario> list = new ArrayList<>();
        String query = "SELECT usu_id, usu_nome, usu_email, usu_senha, t_usu_id, t_usu_nome FROM usuario ";
        query += "LEFT JOIN tipo_usuario ON usu_tipo_usuario_fk = t_usu_id";

        if (criteria != null) {
            query += applyCriteria(criteria);
        }

        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        while (rs.next()) {
            Usuario pojo = new Usuario();
            pojo.setId(rs.getLong("usu_id"));
            pojo.setNome(rs.getString("usu_nome"));
            pojo.setEmail(rs.getString("usu_email"));
            pojo.setSenha(rs.getString("usu_senha"));
            TipoUsuario tipoUsuario = new TipoUsuario();
            tipoUsuario.setId(rs.getLong("t_usu_id"));
            tipoUsuario.setNome(rs.getString("t_usu_nome"));
            pojo.setTipo_usuario(tipoUsuario);
            list.add(pojo);
        }
        rs.close();
        s.close();
        return list;
    }

    @Override
    public String applyCriteria(Map<Long, Object> criteria) throws Exception {
        String query = "";

        String email = (String) criteria.get(UsuarioCriteria.EMAIL_EQ);
        if (email != null) {
            query += " AND usu_email ='" + email + "'";
        }

        String senha = (String) criteria.get(UsuarioCriteria.SENHA_EQ);
        if (senha != null) {
            query += " AND usu_senha ='" + senha + "'";
        }

        return query;
    }

}
