use radius_db;

create table COD_CLIENTE (
	COD_cli bigint(20),
    inserted_at int unsigned,
    primary key(COD_cli)
);

drop table COD_CLIENTE;

select cod_cli, 
		from_unixtime(inserted_at) as insertedAt
        from COD_CLIENTE;

SET SQL_SAFE_UPDATES = 0;
delete from COD_CLIENTE;

INSERT INTO COD_CLIENTE(cod_cli, inserted_at) 
		VALUES(
			4000420326, unix_timestamp(now())
		);

select from_unixtime(unix_timestamp(now()));


CREATE TABLE `TB_PARQUE_MOVEL_ATUAL` (
  `ID_MES` int(11) DEFAULT NULL,
  `COD_CLI` bigint(20) DEFAULT NULL,
  `CNPJ` varchar(60) DEFAULT NULL,
  `CONTA` bigint(20) DEFAULT NULL,
  `ID_LINHA` bigint(20) DEFAULT NULL,
  `NUMERO_TELEFONE` bigint(20) DEFAULT NULL,
  `CLIENTE` varchar(120) DEFAULT NULL,
  `SEGMENTO` varchar(50) NOT NULL,
  `DIRETORIA` varchar(30) NOT NULL,
  `UF` char(2) DEFAULT NULL,
  `ID_ESTD_LNHA_RGNL` int(11) DEFAULT NULL,
  `DATA_ATIVACAO_LINHA` varchar(12) DEFAULT NULL,
  `ESTADO` varchar(8) DEFAULT NULL,
  `PRODUTO` varchar(8) DEFAULT NULL,
  `PLANO` varchar(100) DEFAULT NULL,
  `SERVICO` varchar(70) DEFAULT NULL,
  `DATA_ATIVACAO_SERVICO` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

select COD_CLI from TB_PARQUE_MOVEL_ATUAL group by COD_CLI;

#4002593823
#4008341872

select * from TB_PARQUE_MOVEL_ATUAL tbpa
inner join COD_CLIENTE cc ON cc.COD_CLI = tbpa.COD_CLI;

delete from COD_CLIENTE where COD_CLI = 4008341872;

INSERT INTO COD_CLIENTE(cod_cli, inserted_at) 
		VALUES(
			4008341872, unix_timestamp(now())
		);


select * from TB_PARQUE_MOVEL_ATUAL where COD_cli = 4002593823;

select * from TB_PARQUE_MOVEL_ATUAL where COD_cli = 4002593823;

select * from TB_PARQUE_MOVEL_ATUAL where COD_cli = 4002593823;