package com.smarthouse.model.dao;

import com.smarthouse.model.base.BaseDAO;
import com.smarthouse.model.entity.Dispositivo;
import com.smarthouse.model.entity.Rele;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ReleDAO implements BaseDAO<Rele> {

    @Override
    public void create(Connection conn, Rele entity) throws Exception {
        String query = "INSERT INTO rele(rel_nome, rel_porta, rel_dispositivo_fk) VALUES(?, ?, ?) RETURNING rel_id;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setLong(++i, entity.getPorta());
        if (entity.getDispositivo() != null && entity.getDispositivo().getId() != null) {
            ps.setLong(++i, entity.getDispositivo().getId());
        } else {
            ps.setNull(++i, Types.INTEGER);
        }
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            entity.setId(rs.getLong("rel_id"));
        }
        rs.close();
        ps.close();
    }

    @Override
    public void update(Connection conn, Rele entity) throws Exception {
        String query = "UPDATE rele SET rel_nome=?, rel_porta=?, rel_dispositivo_fk=? WHERE rel_id=?;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setString(++i, entity.getNome());
        ps.setLong(++i, entity.getPorta());
        if (entity.getDispositivo() != null && entity.getDispositivo().getId() != null) {
            ps.setLong(++i, entity.getDispositivo().getId());
        } else {
            ps.setNull(++i, Types.INTEGER);
        }
        ps.setLong(++i, entity.getId());
        ps.execute();
        ps.close();
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String query = "DELETE FROM rele WHERE rel_id=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public Rele readById(Connection conn, Long id) throws Exception {
        Rele pojo = null;
        String query = "SELECT rel_id, rel_nome, rel_porta, dis_id, dis_nome FROM rele ";
        query += "LEFT JOIN dispositivo ON dis_id = rel_dispositivo_fk WHERE rel_id=?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            pojo = new Rele();
            pojo.setId(rs.getLong("rel_id"));
            pojo.setNome(rs.getString("rel_nome"));
            pojo.setPorta(rs.getLong("rel_porta"));
            Dispositivo dispositivo = new Dispositivo();
            dispositivo.setId(rs.getLong("dis_id"));
            dispositivo.setNome(rs.getString("dis_nome"));
            pojo.setDispositivo(dispositivo);
        }
        rs.close();
        ps.close();
        return pojo;
    }

    public Rele readByIdDispositivo(Connection conn, Long id) throws Exception {
        Rele pojo = null;
        String query = "SELECT * FROM rele WHERE rel_dispositivo_fk = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            pojo = new Rele();
            pojo.setId(rs.getLong("rel_id"));
            pojo.setNome(rs.getString("rel_nome"));
            pojo.setPorta(rs.getLong("rel_porta"));
        }
        rs.close();
        ps.close();
        return pojo;
    }

    @Override
    public List<Rele> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        List<Rele> list = new ArrayList<>();
        String query = "SELECT rel_id, rel_nome, rel_porta, dis_id, dis_nome FROM rele ";
        query += "LEFT JOIN dispositivo ON dis_id = rel_dispositivo_fk ORDER BY rel_nome";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        while (rs.next()) {
            Rele pojo = new Rele();
            pojo.setId(rs.getLong("rel_id"));
            pojo.setNome(rs.getString("rel_nome"));
            pojo.setPorta(rs.getLong("rel_porta"));
            Dispositivo dispositivo = new Dispositivo();
            dispositivo.setId(rs.getLong("dis_id"));
            dispositivo.setNome(rs.getString("dis_nome"));
            pojo.setDispositivo(dispositivo);
            list.add(pojo);
        }
        rs.close();
        s.close();
        return list;
    }

    public List<Dispositivo> readDispositivosToCombobox(Connection conn, Map<Long, Object> criteria) throws SQLException {
        List<Dispositivo> list = new ArrayList<>();
        Dispositivo pojo = null;
        String query = "SELECT * FROM dispositivo WHERE dis_id NOT IN ";
        query += "(SELECT rel_dispositivo_fk FROM rele WHERE rel_dispositivo_fk > 0)";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        while (rs.next()) {
            pojo = new Dispositivo();
            pojo.setId(rs.getLong("dis_id"));
            pojo.setNome(rs.getString("dis_nome"));
            list.add(pojo);
        }
        return list;
    }

    @Override
    public String applyCriteria(Map<Long, Object> criteria) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
