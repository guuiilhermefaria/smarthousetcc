package com.smarthouse.model.entity;

import com.smarthouse.model.base.BaseEntity;
import java.sql.Timestamp;
import java.util.Date;

public class Recado extends BaseEntity {

    private String recado;
    private Usuario usuario;
    private Timestamp dataHoraRecado;

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

    public Timestamp getDataHoraRecado() {
        return dataHoraRecado;
    }

    public void setDataHoraRecado(Timestamp dataHoraRecado) {
        this.dataHoraRecado = dataHoraRecado;
    } 

}
