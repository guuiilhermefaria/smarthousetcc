package com.smarthouse.model.service;

import com.smarthouse.model.ConnectionManager;
import com.smarthouse.model.base.BaseCRUDService;
import com.smarthouse.model.dao.TipoDeLigacaoDAO;
import com.smarthouse.model.dao.TipoUsuarioDAO;
import com.smarthouse.model.entity.TipoDeLigacao;
import com.smarthouse.model.entity.TipoUsuario;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TipoDeLigacaoService implements BaseCRUDService<TipoDeLigacao> {

    @Override
    public void create(TipoDeLigacao entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(TipoDeLigacao entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TipoDeLigacao readById(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<TipoDeLigacao> readByCriteria(Map<Long, Object> criteria) {
        List<TipoDeLigacao> list = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                TipoDeLigacaoDAO dao = new TipoDeLigacaoDAO();
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
