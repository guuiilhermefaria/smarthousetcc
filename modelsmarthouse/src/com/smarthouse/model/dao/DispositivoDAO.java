package com.smarthouse.model.dao;

import com.smarthouse.model.base.BaseDAO;
import com.smarthouse.model.entity.Comodo;
import com.smarthouse.model.entity.Dispositivo;
import com.smarthouse.model.entity.TipoDeLigacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DispositivoDAO implements BaseDAO<Dispositivo> {

    @Override
    public void create(Connection conn, Dispositivo entity) throws Exception {
        String query = "INSERT INTO dispositivo(dis_nome, dis_comodo_fk, dis_tipo_de_ligacao_fk) VALUES (?, ?, ?) RETURNING dis_id;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setString(++i, entity.getNome());
        if (entity.getComodo() != null && entity.getComodo().getId() != null) {
            ps.setLong(++i, entity.getComodo().getId());
        } else {
            ps.setNull(++i, Types.INTEGER);
        }
        if (entity.getTipo_de_ligacao() != null && entity.getTipo_de_ligacao().getId() != null) {
            ps.setLong(++i, entity.getTipo_de_ligacao().getId());
        } else {
            ps.setNull(++i, Types.INTEGER);
        }
        ps.execute();
        ps.close();
    }

    @Override
    public void update(Connection conn, Dispositivo entity) throws Exception {
        String query = "UPDATE dispositivo SET dis_nome=?, dis_comodo_fk=?, dis_tipo_de_ligacao_fk=? WHERE dis_id=?;";
        PreparedStatement ps = conn.prepareStatement(query);
        int i = 0;
        ps.setString(++i, entity.getNome());
        if (entity.getComodo() != null && entity.getComodo().getId() != null) {
            ps.setLong(++i, entity.getComodo().getId());
        } else {
            ps.setNull(++i, Types.INTEGER);
        }
        if (entity.getTipo_de_ligacao() != null && entity.getTipo_de_ligacao().getId() != null) {
            ps.setLong(++i, entity.getTipo_de_ligacao().getId());
        } else {
            ps.setNull(++i, Types.INTEGER);
        }
        ps.setLong(++i, entity.getId());

        ps.execute();
        ps.close();
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        String query = "DELETE FROM dispositivo WHERE dis_id=?;";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ps.execute();
        ps.close();
    }

    @Override
    public Dispositivo readById(Connection conn, Long id) throws Exception {
        Dispositivo pojo = null;
        String query = "SELECT dis_id, dis_nome, com_id, com_nome, t_lig_id, t_lig_nome FROM dispositivo ";
        query += "LEFT JOIN comodo ON dis_comodo_fk = com_id ";
        query += "LEFT JOIN tipo_de_ligacao ON dis_tipo_de_ligacao_fk = t_lig_id where dis_id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            pojo = new Dispositivo();
            pojo.setId(rs.getLong("dis_id"));
            pojo.setNome(rs.getString("dis_nome"));
            Comodo comodo = new Comodo();
            comodo.setId(rs.getLong("com_id"));
            comodo.setNome(rs.getString("com_nome"));
            TipoDeLigacao tdl = new TipoDeLigacao();
            tdl.setId(rs.getLong("t_lig_id"));
            tdl.setNome(rs.getString("t_lig_nome"));
            pojo.setComodo(comodo);
            pojo.setTipo_de_ligacao(tdl);
        }
        rs.close();
        ps.close();
        return pojo;
    }

    public List<Dispositivo> readByIdComodo(Connection conn, Long id) throws Exception {
        List<Dispositivo> list = new ArrayList<>();
        String query = "SELECT * FROM dispositivo WHERE dis_comodo_fk = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Dispositivo pojo = new Dispositivo();
            pojo.setId(rs.getLong("dis_id"));
            pojo.setNome(rs.getString("dis_nome"));
            pojo.setTipo_de_ligacao(new TipoDeLigacaoDAO().readByIdDispositivo(conn, pojo.getId()));
            pojo.setRele(new ReleDAO().readByIdDispositivo(conn, pojo.getId()));
            list.add(pojo);
        }
        rs.close();
        ps.close();
        return list;
    }

    @Override
    public List<Dispositivo> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        List<Dispositivo> list = new ArrayList<>();
        Dispositivo pojo = null;
        String query = "SELECT dis_id, dis_nome, t_lig_id, t_lig_nome, com_id, com_nome FROM dispositivo ";
        query += "LEFT JOIN comodo ON dis_comodo_fk = com_id ";
        query += "LEFT JOIN tipo_de_ligacao ON dis_tipo_de_ligacao_fk = t_lig_id ORDER BY dis_nome";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        while (rs.next()) {
            pojo = new Dispositivo();
            pojo.setId(rs.getLong("dis_id"));
            pojo.setNome(rs.getString("dis_nome"));
            Comodo comodo = new Comodo();
            comodo.setId(rs.getLong("com_id"));
            comodo.setNome(rs.getString("com_nome"));
            TipoDeLigacao t_lig = new TipoDeLigacao();
            t_lig.setId(rs.getLong("t_lig_id"));
            t_lig.setNome(rs.getString("t_lig_nome"));
            pojo.setComodo(comodo);
            pojo.setTipo_de_ligacao(t_lig);
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
