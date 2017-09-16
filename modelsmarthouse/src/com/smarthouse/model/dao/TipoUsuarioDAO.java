package com.smarthouse.model.dao;

import com.smarthouse.model.base.BaseDAO;
import com.smarthouse.model.entity.TipoUsuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TipoUsuarioDAO implements BaseDAO<TipoUsuario>{
    
    @Override
    public String applyCriteria(Map<Long, Object> criteria) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }  

    @Override
    public void create(Connection conn, TipoUsuario entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Connection conn, TipoUsuario entity) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Connection conn, Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TipoUsuario readById(Connection conn, Long id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TipoUsuario> readByCriteria(Connection conn, Map<Long, Object> criteria) throws Exception {
        List<TipoUsuario> list = new ArrayList<>();
        String query = "SELECT * FROM tipo_usuario WHERE 1=1";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        while (rs.next()) {
            TipoUsuario pojo = new TipoUsuario();
            pojo.setId(rs.getLong("t_usu_id"));
            pojo.setNome(rs.getString("t_usu_nome"));
            list.add(pojo);
        }
        rs.close();
        s.close();
        return list;
    }

}
