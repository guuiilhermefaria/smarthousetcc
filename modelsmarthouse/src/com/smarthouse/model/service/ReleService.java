package com.smarthouse.model.service;

import com.smarthouse.model.ConnectionManager;
import com.smarthouse.model.base.BaseCRUDService;
import com.smarthouse.model.dao.ReleDAO;
import com.smarthouse.model.entity.Dispositivo;
import com.smarthouse.model.entity.Rele;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Brothers
 */
public class ReleService implements BaseCRUDService<Rele> {

    @Override
    public void create(Rele entity) {
        Connection conn;
        try {
            conn = ConnectionManager.getInstance().getConnection();
            try {
                ReleDAO dao = new ReleDAO();
                dao.create(conn, entity);
                conn.commit();
            } catch (Exception e) {
                e.printStackTrace();
                conn.rollback();
            } finally {
                conn.close();
            }
        } catch (Exception ex) {
            Logger.getLogger(ReleService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Rele entity) {
        Connection conn;
        try {
            conn = ConnectionManager.getInstance().getConnection();
            try {
                ReleDAO dao = new ReleDAO();
                dao.update(conn, entity);
                conn.commit();
            } catch (Exception e) {
                conn.rollback();
            } finally {
                conn.close();
            }
        } catch (Exception e) {
        }
    }

    @Override
    public void delete(Long id) {
        Connection conn;
        try {
            conn = ConnectionManager.getInstance().getConnection();
            try {
                ReleDAO dao = new ReleDAO();
                dao.delete(conn, id);
                conn.commit();
            } catch (Exception e) {
                conn.rollback();
            } finally {
                conn.close();
            }
        } catch (Exception e) {
        }
    }

    @Override
    public Rele readById(Long id) {
        Rele entity = null;
        Connection conn;
        try {
            conn = ConnectionManager.getInstance().getConnection();
            try {
                ReleDAO dao = new ReleDAO();
                entity = dao.readById(conn, id);
                conn.commit();
            } catch (Exception e) {
                conn.rollback();
            } finally {
                conn.close();
            }
        } catch (Exception e) {
        }
        return entity;
    }

    @Override
    public List<Rele> readByCriteria(Map<Long, Object> criteria) {
        List<Rele> list = new ArrayList<>();
        Connection conn;
        try {
            conn = ConnectionManager.getInstance().getConnection();
            try {
                ReleDAO dao = new ReleDAO();
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
    public List<Dispositivo> readDispositivosToCombobox(Map<Long, Object> criteria) {
        List<Dispositivo> list = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                ReleDAO dao = new ReleDAO();
                list = dao.readDispositivosToCombobox(conn, criteria);
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
