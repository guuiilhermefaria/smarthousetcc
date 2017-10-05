package com.smarthouse.model.entity;

import com.smarthouse.model.base.BaseEntity;
import java.sql.Timestamp;
import java.util.Date;

public class Recado extends BaseEntity {

    private String recado;
    private Usuario usuario;
    private Timestamp data_hora_recado;

    public String getRecado() {
        return recado;
    }

    public void setRecado(String recado) {
        this.recado = recado;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Timestamp getData_hora_recado() {
        return data_hora_recado;
    }

    public void setData_hora_recado(Timestamp data_hora_recado) {
        this.data_hora_recado = data_hora_recado;
    }

}
