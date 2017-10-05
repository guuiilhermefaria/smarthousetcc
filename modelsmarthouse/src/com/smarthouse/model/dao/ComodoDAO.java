package com.smarthouse.model.dao;

import com.smarthouse.model.base.BaseDAO;
import com.smarthouse.model.entity.Comodo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ComodoDAO implements BaseDAO<Comodo> {

    @Override
    public void create(Connection conn, Comodo entity) throws Exception {
        String query = "INSERT INTO comodo(com_nome) VALUES (?)";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.execute();
        ps.close();
    }

    @Override
    public void update(Connection conn, Comodo entity) throws Exception {
        String query = "UPDATE comodo SET com_nome=? WHERE com_id=?;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setLong(++i, entity.getId());
        ps.execute();
        ps.close();
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String query = "DELETE FROM comodo WHERE com_id=?;";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public Comodo readById(Connection conn, Long id) throws Exception {
        Comodo pojo = null;
        String query = "SELECT com_id, com_nome FROM comodo WHERE com_id=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            pojo = new Comodo();
            pojo.setId(rs.getLong("com_id"));
            pojo.setNome(rs.getString("com_nome"));
        }
        rs.close();
        ps.close();
        return pojo;
    }

    @Override
    public List<Comodo> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        List<Comodo> list = new ArrayList<>();
        Comodo pojo = null;
        String query = "SELECT com_id, com_nome FROM comodo ORDER BY com_nome";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        while (rs.next()) {
            pojo = new Comodo();
            pojo.setId(rs.getLong("com_id"));
            pojo.setNome(rs.getString("com_nome"));
            list.add(pojo);
        }
        rs.close();
        s.close();
        return list;
    }

    public List<Comodo> readAll(Connection conn) throws Exception {
        List<Comodo> list = new ArrayList<>();
        Comodo pojo = null;
        String query = "SELECT * FROM comodo";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        while (rs.next()) {
            pojo = new Comodo();
            pojo.setId(rs.getLong("com_id"));
            pojo.setNome(rs.getString("com_nome"));
            pojo.setDispositivos(new DispositivoDAO().readByIdComodo(conn, pojo.getId()));
            list.add(pojo);
        }
        rs.close();
        s.close();
        return list;
    }

    @Override
    public String applyCriteria(Map<Long, Object> criteria) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
