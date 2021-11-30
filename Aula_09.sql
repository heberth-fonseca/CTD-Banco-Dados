CREATE DATABASE spotify;
USE spotify;

CREATE TABLE usuario(
	idUsuario INT NOT NULL AUTO_INCREMENT,
    nomeusuario VARCHAR(45),
    data_nac DATE,
    sexo VARCHAR(1),
    email VARCHAR(150),
    senha VARCHAR(45),
    PRIMARY KEY (idUsuario)
);

CREATE TABLE genero(
	idGenero INT NOT NULL AUTO_INCREMENT,
    genero VARCHAR(45),
    PRIMARY KEY (idGenero)
);

CREATE TABLE artista(
	idArtista INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    sobrenome VARCHAR(100),
    PRIMARY KEY (idArtista)
);

CREATE TABLE album(
	idAlbum INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(45),
    idArtista INT,
    PRIMARY KEY (idAlbum),
    CONSTRAINT FKartista
    FOREIGN KEY (idArtista)
    REFERENCES artista(idArtista)
);

CREATE TABLE playlist(
	idPlaylist INT NOT NULL AUTO_INCREMENT,
    idUsuario INT,
    titulo VARCHAR(45),
    qtdcancoes INT,
    datacriacao DATE,
    PRIMARY KEY (idPlaylist),
    CONSTRAINT FKusuario
    FOREIGN KEY (idUsuario)
    REFERENCES usuario(idUsuario)
);

CREATE TABLE cancoes(
	idCancao INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(45),
    duracao DOUBLE,
    qtdreproducao INT,
    qtdlikes INT,
    idAlbum INT,
    PRIMARY KEY (idCancao),
    CONSTRAINT FKalbum
    FOREIGN KEY (idAlbum)
    REFERENCES album(idAlbum)
);

CREATE TABLE playlist_cancao(
	idPlaylist_cancao INT NOT NULL AUTO_INCREMENT,
    idCancao INT,
    idPlaylist INT,
    PRIMARY KEY (idPlaylist_cancao),
    CONSTRAINT FKcancao
    FOREIGN KEY (idCancao)
    REFERENCES cancoes(idCancao),
    CONSTRAINT FKplaylist
    FOREIGN KEY (idPlaylist)
    REFERENCES playlist(idPlaylist)
);

CREATE TABLE genero_cancao(
	idGenero_cancao INT NOT NULL AUTO_INCREMENT,
    idCancao INT,
    idGenero INT,
    PRIMARY KEY (idGenero_cancao),
    CONSTRAINT FKcancao_genero
    FOREIGN KEY (idCancao)
    REFERENCES cancoes(idCancao),
    CONSTRAINT FKgenero
    FOREIGN KEY (idGenero)
    REFERENCES genero(idGenero)
);

/* INSERINDO USUARIOS */
INSERT INTO usuario(nomeusuario,data_nac,sexo,email,senha) VALUE("Bruno",'1987-12-24',"M","Bruno@email.com","lkasmd");
INSERT INTO usuario(nomeusuario,data_nac,sexo,email,senha) VALUE("Eduardo",'1990-05-20',"M","Eduardo@email.com","alksmd");
INSERT INTO usuario(nomeusuario,data_nac,sexo,email,senha) VALUE("Fernanda",'1992-06-05',"F","Fernanda@email.com","laksnmd");
INSERT INTO usuario(nomeusuario,data_nac,sexo,email,senha) VALUE("Flavia",'1982-05-15',"F","Flavia@email.com","alksmd");
INSERT INTO usuario(nomeusuario,data_nac,sexo,email,senha) VALUE("Joao",'1980-07-30',"M","Joao@email.com","la;skmd");

/* INSERINDO PLAYLISTS*/
INSERT INTO playlist(idusuario,titulo,qtdcancoes,datacriacao) VALUE(1,"playlist 1",50,'2021-05-15');
INSERT INTO playlist(idusuario,titulo,qtdcancoes,datacriacao) VALUE(2,"playlist 2",48,'2020-06-1');
INSERT INTO playlist(idusuario,titulo,qtdcancoes,datacriacao) VALUE(3,"playlist 3",62,'2019-06-26');
INSERT INTO playlist(idusuario,titulo,qtdcancoes,datacriacao) VALUE(4,"playlist 4",5,'2021-07-25');
INSERT INTO playlist(idusuario,titulo,qtdcancoes,datacriacao) VALUE(5,"playlist 5",10,'2021-07-15');
INSERT INTO playlist(idusuario,titulo,qtdcancoes,datacriacao) VALUE(1,"playlist 6",15,'2021-10-15');
INSERT INTO playlist(idusuario,titulo,qtdcancoes,datacriacao) VALUE(2,"playlist 7",26,'2021-11-5');
INSERT INTO playlist(idusuario,titulo,qtdcancoes,datacriacao) VALUE(3,"playlist 8",34,'2021-06-10');

/* INSERINDO MUSICOS*/
INSERT INTO artista(nome,sobrenome) VALUE("Ed","Sheeran");
INSERT INTO artista(nome,sobrenome) VALUE("Jhon","Mayer");
INSERT INTO artista(nome,sobrenome) VALUE("Paul","McCartney");

