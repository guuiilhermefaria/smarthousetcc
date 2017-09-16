package com.smarthouse.model.entity;

import com.smarthouse.model.base.BaseEntity;

public class Rele extends BaseEntity {

    private String nome;
    private Long porta;
    private Dispositivo dispositivo;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Long getPorta() {
        return porta;
    }

    public void setPorta(Long porta) {
        this.porta = porta;
    }

    public Dispositivo getDispositivo() {
        return dispositivo;
    }

    public void setDispositivo(Dispositivo dispositivo) {
        this.dispositivo = dispositivo;
    }

}
