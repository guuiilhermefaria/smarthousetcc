package com.smarthouse.model.base.service;

import com.smarthouse.model.base.BaseCRUDService;
import com.smarthouse.model.entity.Usuario;

public interface BaseUsuarioService extends BaseCRUDService<Usuario>{
    public Usuario login(String email, String senha) throws Exception;
}
