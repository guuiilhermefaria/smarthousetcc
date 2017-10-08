----------------------------------------------------------------------Tabelas----------------------------------------------------------------------
CREATE TABLE comodo
(
    com_id BIGSERIAL NOT NULL,
    com_nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(com_id)
);
CREATE TABLE dispositivo
(
    dis_id BIGSERIAL NOT NULL,
    dis_nome VARCHAR(100) NOT NULL,
    dis_comodo_fk BIGINT,
    dis_tipo_de_ligacao_fk BIGINT,    
    PRIMARY KEY(dis_id)
);
CREATE TABLE rele
(
  rel_id BIGSERIAL NOT NULL,
  rel_nome VARCHAR (100) NOT NULL,
  rel_porta INTEGER NOT NULL,
  rel_dispositivo_fk BIGINT,
   PRIMARY KEY (rel_id)
);
CREATE TABLE usuario
(
  usu_id BIGSERIAL NOT NULL,
  usu_nome VARCHAR (100) NOT NULL,
  usu_email VARCHAR (250) NOT NULL,
  usu_senha VARCHAR (100) NOT NULL,
  usu_tipo_usuario_fk BIGINT NOT NULL,
  PRIMARY KEY (usu_id)
);
CREATE TABLE recado
(
    rec_id BIGSERIAL NOT NULL,
    rec_recado VARCHAR(500) NOT NULL,
    rec_data_hora_recado TIMESTAMP NOT NULL,
    rec_usuario_fk BIGINT NOT NULL,
    PRIMARY KEY(rec_id)
);
CREATE TABLE tipo_usuario
(  
  t_usu_id BIGSERIAL NOT NULL,
  t_usu_nome VARCHAR (100) NOT NULL,
  PRIMARY KEY (t_usu_id)
);
CREATE TABLE tipo_de_ligacao
(  
  t_lig_id BIGSERIAL NOT NULL,
  t_lig_nome VARCHAR (100) NOT NULL,
  PRIMARY KEY (t_lig_id)
);
----------------------------------------------------------------------Restricao----------------------------------------------------------------------
ALTER TABLE dispositivo ADD CONSTRAINT dispositivo_comodo_fk FOREIGN KEY (dis_comodo_fk) REFERENCES comodo(com_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE dispositivo ADD CONSTRAINT dispositivo_tipo_de_ligacao_fk FOREIGN KEY (dis_tipo_de_ligacao_fk) REFERENCES tipo_de_ligacao(t_lig_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE rele ADD CONSTRAINT rele_dispositivo_fk FOREIGN KEY (rel_dispositivo_fk) REFERENCES dispositivo(dis_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE usuario ADD CONSTRAINT usuario_tipo_usuario_fk FOREIGN KEY (usu_tipo_usuario_fk) REFERENCES tipo_usuario(t_usu_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE recado ADD CONSTRAINT recado_usuario_fk FOREIGN KEY (rec_usuario_fk) REFERENCES usuario(usu_id) ON UPDATE CASCADE ON DELETE CASCADE;

-----------------------------------------------------------------------Povoamento usuário-----------------------------------------------------------------------
INSERT INTO tipo_usuario(t_usu_nome) VALUES('Administrador');
INSERT INTO tipo_usuario(t_usu_nome) VALUES('Morador');

INSERT INTO tipo_de_ligacao(t_lig_nome) VALUES('Ligar/Desligar');
INSERT INTO tipo_de_ligacao(t_lig_nome) VALUES('Injetar');

INSERT INTO usuario (usu_nome, usu_email, usu_senha, usu_tipo_usuario_fk) VALUES('Admin','admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 1);

-----------------------------------------------------------------------Povoamento cômodo-----------------------------------------------------------------------
INSERT INTO comodo(com_nome) VALUES('Área');
INSERT INTO comodo(com_nome) VALUES('Banheiro');
INSERT INTO comodo(com_nome) VALUES('Cozinha');
INSERT INTO comodo(com_nome) VALUES('Sala');
INSERT INTO comodo(com_nome) VALUES('Varanda');
INSERT INTO comodo(com_nome) VALUES('Garagem');
INSERT INTO comodo(com_nome) VALUES('Escritório');
INSERT INTO comodo(com_nome) VALUES('Quarto');
-----------------------------------------------------------------------Povoamento dispositivo-----------------------------------------------------------------------
INSERT INTO dispositivo(dis_nome, dis_comodo_fk, dis_tipo_de_ligacao_fk) VALUES('Lâmpada da Área', 1, 1);
INSERT INTO dispositivo(dis_nome, dis_comodo_fk, dis_tipo_de_ligacao_fk) VALUES('Lâmpada do Banheiro', 2, 1);
INSERT INTO dispositivo(dis_nome, dis_comodo_fk, dis_tipo_de_ligacao_fk) VALUES('Microondas', 3, 1);
INSERT INTO dispositivo(dis_nome, dis_comodo_fk, dis_tipo_de_ligacao_fk) VALUES('Luz da Varanda', 4, 1);
INSERT INTO dispositivo(dis_nome, dis_comodo_fk, dis_tipo_de_ligacao_fk) VALUES('Luminária', 5, 1);
INSERT INTO dispositivo(dis_nome, dis_comodo_fk, dis_tipo_de_ligacao_fk) VALUES('Portão', 6, 2);
INSERT INTO dispositivo(dis_nome, dis_comodo_fk, dis_tipo_de_ligacao_fk) VALUES('Luminária', 7, 1);
INSERT INTO dispositivo(dis_nome, dis_comodo_fk, dis_tipo_de_ligacao_fk) VALUES('Ventilador', 8, 1);
-----------------------------------------------------------------------Povoamento relé-----------------------------------------------------------------------
INSERT INTO rele(rel_nome, rel_porta, rel_dispositivo_fk) VALUES('Rele 1', 1, 1);
INSERT INTO rele(rel_nome, rel_porta, rel_dispositivo_fk) VALUES('Rele 2', 2, 2);
INSERT INTO rele(rel_nome, rel_porta, rel_dispositivo_fk) VALUES('Rele 3', 3, 3);
INSERT INTO rele(rel_nome, rel_porta, rel_dispositivo_fk) VALUES('Rele 4', 4, 4);
INSERT INTO rele(rel_nome, rel_porta, rel_dispositivo_fk) VALUES('Rele 5', 5, 5);
INSERT INTO rele(rel_nome, rel_porta, rel_dispositivo_fk) VALUES('Rele 6', 6, 6);
INSERT INTO rele(rel_nome, rel_porta, rel_dispositivo_fk) VALUES('Rele 7', 7, 7);
INSERT INTO rele(rel_nome, rel_porta, rel_dispositivo_fk) VALUES('Rele 8', 8, 8);

-- 
-- portao = 6
-- ventilador 7