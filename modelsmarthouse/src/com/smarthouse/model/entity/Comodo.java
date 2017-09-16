package com.smarthouse.model.entity;

import com.smarthouse.model.base.BaseEntity;
import java.util.List;

public class Comodo extends BaseEntity {

    private String nome;
    
    private List<Dispositivo> dispositivos;

    public List<Dispositivo> getDispositivos() {
        return dispositivos;
    }

    public void setDispositivos(List<Dispositivo> dispositivos) {
        this.dispositivos = dispositivos;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
