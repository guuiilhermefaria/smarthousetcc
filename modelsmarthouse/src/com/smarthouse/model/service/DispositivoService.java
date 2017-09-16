package com.smarthouse.model.service;

import com.smarthouse.model.ConnectionManager;
import com.smarthouse.model.base.BaseCRUDService;
import com.smarthouse.model.dao.DispositivoDAO;
import com.smarthouse.model.entity.Dispositivo;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DispositivoService implements BaseCRUDService<Dispositivo> {

    @Override
    public void create(Dispositivo entity) {
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                DispositivoDAO dao = new DispositivoDAO();
                dao.create(conn, entity);
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
    public void update(Dispositivo entity) {
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                DispositivoDAO dao = new DispositivoDAO();
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
                DispositivoDAO dao = new DispositivoDAO();
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
    public Dispositivo readById(Long id) {
        Dispositivo pojo = null;
        Connection conn;
        try {
            conn = ConnectionManager.getInstance().getConnection();
            try {
                DispositivoDAO dao = new DispositivoDAO();
                pojo = dao.readById(conn, id);
                conn.commit();
            } catch (Exception e) {
                conn.rollback();
            } finally {
                conn.close();
            }
        } catch (Exception e) {
        }
        return pojo;
    }

    @Override
    public List<Dispositivo> readByCriteria(Map<Long, Object> criteria) {
        List<Dispositivo> list = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                DispositivoDAO dao = new DispositivoDAO();
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
