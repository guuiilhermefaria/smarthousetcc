package com.smarthouse.model.entity;

import com.smarthouse.model.base.BaseEntity;

public class Dispositivo extends BaseEntity {

    private String nome;
    private Comodo comodo;
    private Rele rele;
    private TipoDeLigacao tipo_de_ligacao;

    public TipoDeLigacao getTipo_de_ligacao() {
        return tipo_de_ligacao;
    }

    public void setTipo_de_ligacao(TipoDeLigacao tipo_de_ligacao) {
        this.tipo_de_ligacao = tipo_de_ligacao;
    }

    public Rele getRele() {
        return rele;
    }

    public void setRele(Rele rele) {
        this.rele = rele;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Comodo getComodo() {
        return comodo;
    }

    public void setComodo(Comodo comodo) {
        this.comodo = comodo;
    }

}
