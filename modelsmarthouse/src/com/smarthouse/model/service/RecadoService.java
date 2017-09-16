package com.smarthouse.model.service;

import com.smarthouse.model.ConnectionManager;
import com.smarthouse.model.base.BaseCRUDService;
import com.smarthouse.model.dao.RecadoDAO;
import com.smarthouse.model.entity.Recado;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class RecadoService implements BaseCRUDService<Recado> {

    @Override
    public void create(Recado entity) {
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                RecadoDAO dao = new RecadoDAO();
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
    public void update(Recado entity) {
    }

    @Override
    public void delete(Long id) {
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                RecadoDAO dao = new RecadoDAO();
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
    public Recado readById(Long id) {
        Recado pojo = null;
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                RecadoDAO dao = new RecadoDAO();
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
    public List<Recado> readByCriteria(Map<Long, Object> criteria) {
        List<Recado> list = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                RecadoDAO dao = new RecadoDAO();
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
