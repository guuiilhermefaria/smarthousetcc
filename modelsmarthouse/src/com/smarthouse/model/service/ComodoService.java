package com.smarthouse.model.service;

import com.smarthouse.model.ConnectionManager;
import com.smarthouse.model.base.BaseCRUDService;
import com.smarthouse.model.dao.ComodoDAO;
import com.smarthouse.model.entity.Comodo;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ComodoService implements BaseCRUDService<Comodo> {

    @Override
    public void create(Comodo entity) {
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                ComodoDAO dao = new ComodoDAO();
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
    public void update(Comodo entity) {
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                ComodoDAO dao = new ComodoDAO();
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
                ComodoDAO dao = new ComodoDAO();
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
    public Comodo readById(Long id) {
        Comodo pojo = null;
        Connection conn;
        try {
            conn = ConnectionManager.getInstance().getConnection();
            try {
                ComodoDAO dao = new ComodoDAO();
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
    public List<Comodo> readByCriteria(Map<Long, Object> criteria) {
        List<Comodo> list = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                ComodoDAO dao = new ComodoDAO();
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
    public List<Comodo> readAll() {
        List<Comodo> list = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                ComodoDAO dao = new ComodoDAO();
                list = dao.readAll(conn);
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
