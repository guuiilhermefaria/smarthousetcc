package com.smarthouse.model.dao;

import com.smarthouse.model.base.BaseDAO;
import com.smarthouse.model.entity.Recado;
import com.smarthouse.model.entity.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class RecadoDAO implements BaseDAO<Recado> {

    @Override
    public void create(Connection conn, Recado entity) throws Exception {
        String query = "INSERT INTO recado(rec_recado, rec_data_hora_recado, rec_usuario_fk) VALUES(?, ?, ?) RETURNING rec_id;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setString(++i, entity.getRecado());
        ps.setTimestamp(++i, entity.getData_hora_recado());
        ps.setLong(++i, entity.getUsuario().getId());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            entity.setId(rs.getLong("rec_id"));
        }
        rs.close();
        ps.close();
    }

    @Override
    public void update(Connection conn, Recado entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String query = "DELETE FROM recado WHERE rec_id=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public Recado readById(Connection conn, Long id) throws Exception {
        Recado pojo = null;
        String query = "SELECT * FROM recado WHERE rec_id = ?;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setLong(++i, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            pojo = new Recado();
            pojo.setId(id);
            pojo.setRecado(rs.getString("rec_recado"));
        }
        rs.close();
        ps.close();

        return pojo;
    }

    @Override
    public List<Recado> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        String query = "SELECT rec_id, rec_recado, rec_data_hora_recado, usu_id, usu_nome FROM recado ";
        query += "LEFT JOIN usuario ON usu_id = rec_usuario_fk";
        List<Recado> list = new ArrayList<>();
        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery(query);
        while (rs.next()) {
            Recado pojo = new Recado();
            pojo.setId(rs.getLong("rec_id"));
            pojo.setRecado(rs.getString("rec_recado"));
            pojo.setData_hora_recado(rs.getTimestamp("rec_data_hora_recado"));
            Usuario usuario = new Usuario();
            usuario.setId(rs.getLong("usu_id"));
            usuario.setNome(rs.getString("usu_nome"));
            pojo.setUsuario(usuario);
            list.add(pojo);
        }
        rs.close();
        statement.close();
        return list;
    }

    @Override
    public String applyCriteria(Map<Long, Object> criteria) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
