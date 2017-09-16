package com.smarthouse.model.service;

import com.smarthouse.model.ConnectionManager;
import com.smarthouse.model.base.BaseCRUDService;
import com.smarthouse.model.dao.TipoUsuarioDAO;
import com.smarthouse.model.entity.TipoUsuario;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TipoUsuarioService implements BaseCRUDService<TipoUsuario> {

    @Override
    public void create(TipoUsuario entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(TipoUsuario entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TipoUsuario readById(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TipoUsuario> readByCriteria(Map<Long, Object> criteria) {
        List<TipoUsuario> list = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                TipoUsuarioDAO dao = new TipoUsuarioDAO();
                list = dao.readByCriteria(conn, criteria);
                conn.commit();
            } catch (Exception e) {
                conn.rollback();
            } finally {
                conn.close();
            }
        } catch (Exception e) {
        }
        return list;
    }
}
