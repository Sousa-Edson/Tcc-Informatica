-- adocao2023.dbo.pet_cor definition

-- Drop table

-- DROP TABLE adocao2023.dbo.pet_cor;

CREATE TABLE adocao2023.dbo.pet_cor (
	id bigint IDENTITY(1,1) NOT NULL,
	ativo bit NOT NULL,
	cor varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__pet_cor__3213E83F348CBBC5 PRIMARY KEY (id)
);


-- adocao2023.dbo.pet_raca definition

-- Drop table

-- DROP TABLE adocao2023.dbo.pet_raca;

CREATE TABLE adocao2023.dbo.pet_raca (
	id bigint IDENTITY(1,1) NOT NULL,
	ativo bit NOT NULL,
	especie varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	raca varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__pet_raca__3213E83FD1DF829D PRIMARY KEY (id)
);


-- adocao2023.dbo.[role] definition

-- Drop table

-- DROP TABLE adocao2023.dbo.[role];

CREATE TABLE adocao2023.dbo.[role] (
	id bigint IDENTITY(1,1) NOT NULL,
	[role] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__role__3213E83F6177F438 PRIMARY KEY (id),
	CONSTRAINT UK_bjxn5ii7v7ygwx39et0wawu0q UNIQUE ([role])
);


-- adocao2023.dbo.usuario definition

-- Drop table

-- DROP TABLE adocao2023.dbo.usuario;

CREATE TABLE adocao2023.dbo.usuario (
	id bigint IDENTITY(1,1) NOT NULL,
	ativo bit NOT NULL,
	bairro varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	caminho_imagem varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cep varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cidade varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cpf varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	email varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	estado varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nascimento varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nome varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	numero varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	permissao varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	rua varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	senha varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sexo varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sobrenome varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	telefone varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	telefone2 varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__usuario__3213E83FFAC405CF PRIMARY KEY (id)
);


-- adocao2023.dbo.animal definition

-- Drop table

-- DROP TABLE adocao2023.dbo.animal;

CREATE TABLE adocao2023.dbo.animal (
	id bigint IDENTITY(1,1) NOT NULL,
	disponivel bit NOT NULL,
	especie varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nascimento date NULL,
	nome varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	observacao varchar(512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	porte varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	resumo varchar(512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sexo int NOT NULL,
	vacina int NOT NULL,
	cor_id bigint NULL,
	raca_id bigint NULL,
	usuario_id bigint NULL,
	CONSTRAINT PK__animal__3213E83FBF0AFB2A PRIMARY KEY (id),
	CONSTRAINT FK60g597desaaj6pqrfuv57mkjl FOREIGN KEY (raca_id) REFERENCES adocao2023.dbo.pet_raca(id),
	CONSTRAINT FKgsmdg0fb7a70kuahxl2tccb00 FOREIGN KEY (usuario_id) REFERENCES adocao2023.dbo.usuario(id),
	CONSTRAINT FKqqltxbu3hdf5tt1vv7rw85k93 FOREIGN KEY (cor_id) REFERENCES adocao2023.dbo.pet_cor(id)
);


-- adocao2023.dbo.pet_imagem definition

-- Drop table

-- DROP TABLE adocao2023.dbo.pet_imagem;

CREATE TABLE adocao2023.dbo.pet_imagem (
	id bigint IDENTITY(1,1) NOT NULL,
	caminho_imagem varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	nome_imagem varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tamanho_imagem bigint NULL,
	tipo_imagem varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	url_imagem varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	animal_id bigint NULL,
	CONSTRAINT PK__pet_imag__3213E83FD246D4D6 PRIMARY KEY (id),
	CONSTRAINT FKd239cyuh9nfg5fmf63umlpcyy FOREIGN KEY (animal_id) REFERENCES adocao2023.dbo.animal(id)
);


-- adocao2023.dbo.postagem definition

-- Drop table

-- DROP TABLE adocao2023.dbo.postagem;

CREATE TABLE adocao2023.dbo.postagem (
	id bigint IDENTITY(1,1) NOT NULL,
	ativo bit NOT NULL,
	caminho_imagem varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	conteudo varchar(1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	data_publicacao varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	link_evento varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	titulo varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	usuario_id bigint NULL,
	CONSTRAINT PK__postagem__3213E83FEA2B4867 PRIMARY KEY (id),
	CONSTRAINT FKpja26t3vck8aga5ckfeea4cuw FOREIGN KEY (usuario_id) REFERENCES adocao2023.dbo.usuario(id)
);


-- adocao2023.dbo.usuario_roles definition

-- Drop table

-- DROP TABLE adocao2023.dbo.usuario_roles;

CREATE TABLE adocao2023.dbo.usuario_roles (
	user_id bigint NOT NULL,
	role_id bigint NOT NULL,
	CONSTRAINT FK3t77lxrs76nthhni13ctc7dlj FOREIGN KEY (role_id) REFERENCES adocao2023.dbo.[role](id),
	CONSTRAINT FKvfid90smx2pshpvqc3r88xqt FOREIGN KEY (user_id) REFERENCES adocao2023.dbo.usuario(id)
);


-- adocao2023.dbo.adotar definition

-- Drop table

-- DROP TABLE adocao2023.dbo.adotar;

CREATE TABLE adocao2023.dbo.adotar (
	id bigint IDENTITY(1,1) NOT NULL,
	acordo varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	animal_casa varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ativo bit NOT NULL,
	ausentar varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	casa varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	crianca varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	declaro bit NOT NULL,
	passeios varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	propriedade varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	quintal varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	user_id bigint NULL,
	animal_id bigint NULL,
	CONSTRAINT PK__adotar__3213E83F2834CFE8 PRIMARY KEY (id),
	CONSTRAINT FKacxm7jbl4mfrd8rcjp4q9097a FOREIGN KEY (animal_id) REFERENCES adocao2023.dbo.animal(id)
);
