package com.smarthouse.model.service;

import com.smarthouse.model.ConnectionManager;
import com.smarthouse.model.base.service.BaseUsuarioService;
import com.smarthouse.model.criteria.UsuarioCriteria;
import com.smarthouse.model.dao.UsuarioDAO;
import com.smarthouse.model.entity.Usuario;
import com.smarthouse.model.util.Md5Util;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UsuarioService implements BaseUsuarioService {

    @Override
    public void create(Usuario entity) {
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                UsuarioDAO dao = new UsuarioDAO();
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
    public void update(Usuario entity) {
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                UsuarioDAO dao = new UsuarioDAO();
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
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                UsuarioDAO dao = new UsuarioDAO();
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
    public Usuario readById(Long id) {
        Usuario pojo = null;
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                UsuarioDAO dao = new UsuarioDAO();
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
    public List<Usuario> readByCriteria(Map<Long, Object> criteria) {
        List<Usuario> list = new ArrayList<>();
        try {
            Connection conn = ConnectionManager.getInstance().getConnection();
            try {
                UsuarioDAO dao = new UsuarioDAO();
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

    @Override
    public Usuario login(String email, String senha) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Usuario usuario = null;
        Map<Long, Object> criteria = new HashMap<>();
        criteria.put(UsuarioCriteria.EMAIL_EQ, email);
        UsuarioDAO dao = new UsuarioDAO();
        List<Usuario> usuarioList = dao.readByCriteria(conn, criteria);
        if (usuarioList.size() != 0) {
            Usuario aux = usuarioList.get(0);
            String senhaCrip = Md5Util.toMd5(senha);
            if (aux.getSenha().equals(senhaCrip)) {
                usuario = aux;
            }
        }
        conn.commit();
        conn.close();
        return usuario;
    }

}
