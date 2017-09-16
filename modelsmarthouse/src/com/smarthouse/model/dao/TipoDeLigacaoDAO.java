package com.smarthouse.model.dao;

import com.smarthouse.model.base.BaseDAO;
import com.smarthouse.model.entity.TipoDeLigacao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TipoDeLigacaoDAO implements BaseDAO<TipoDeLigacao> {

    @Override
    public String applyCriteria(Map<Long, Object> criteria) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Connection conn, TipoDeLigacao entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Connection conn, TipoDeLigacao entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TipoDeLigacao readById(Connection conn, Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TipoDeLigacao> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        List<TipoDeLigacao> list = new ArrayList<>();
        String query = "SELECT * FROM tipo_de_ligacao WHERE 1=1";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        while (rs.next()) {
            TipoDeLigacao pojo = new TipoDeLigacao();
            pojo.setId(rs.getLong("t_lig_id"));
            pojo.setNome(rs.getString("t_lig_nome"));
            list.add(pojo);
        }
        rs.close();
        s.close();
        return list;
    }

    public TipoDeLigacao readByIdDispositivo(Connection conn, Long id) throws Exception {
        TipoDeLigacao pojo = null;
        String query = "SELECT t_lig_id, t_lig_nome FROM tipo_de_ligacao "
                + "RIGHT JOIN dispositivo ON t_lig_id = dis_tipo_de_ligacao_fk WHERE dis_id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setLong(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            pojo = new TipoDeLigacao();
            pojo.setId(rs.getLong("t_lig_id"));
            pojo.setNome(rs.getString("t_lig_nome"));
        }
        rs.close();
        ps.close();
        return pojo;
    }

}
