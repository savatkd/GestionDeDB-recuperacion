/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     9/9/2021 19:42:36                            */
/*==============================================================*/


drop index PELICULA_ALQUILER_FK;

drop index CLIENTE_ALQUILER_FK;

drop index ALQUILER_PK;

drop table ALQUILER;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index PELICULA_PK;

drop table PELICULA;

/*==============================================================*/
/* Table: ALQUILER                                              */
/*==============================================================*/
create table ALQUILER (
   IDALQUILER           INT4                 not null,
   IDCLIENTE            INT4                 null,
   IDPELICULA           INT4                 null,
   FECHAPRESTAMO        DATE                 not null,
   FECHAENTREGA         DATE                 not null,
   VALOR                NUMERIC(8,2)         not null,
   DESCUENTO            NUMERIC(8,2)         not null,
   constraint PK_ALQUILER primary key (IDALQUILER)
);

/*==============================================================*/
/* Index: ALQUILER_PK                                           */
/*==============================================================*/
create unique index ALQUILER_PK on ALQUILER (
IDALQUILER
);

/*==============================================================*/
/* Index: CLIENTE_ALQUILER_FK                                   */
/*==============================================================*/
create  index CLIENTE_ALQUILER_FK on ALQUILER (
IDCLIENTE
);

/*==============================================================*/
/* Index: PELICULA_ALQUILER_FK                                  */
/*==============================================================*/
create  index PELICULA_ALQUILER_FK on ALQUILER (
IDPELICULA
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   IDCLIENTE            INT4                 not null,
   CEDULACLIENTE        VARCHAR(10)          not null,
   NOMBRECLIENTE        VARCHAR(20)          not null,
   APELLIDOCLIENTE      VARCHAR(20)          not null,
   FECHAREGISTROCLIENTE DATE                 not null,
   constraint PK_CLIENTE primary key (IDCLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
IDCLIENTE
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA (
   IDPELICULA           INT4                 not null,
   NOMBREPELICULA       VARCHAR(30)          not null,
   ANOESTRENO           INT4                 not null,
   constraint PK_PELICULA primary key (IDPELICULA)
);

/*==============================================================*/
/* Index: PELICULA_PK                                           */
/*==============================================================*/
create unique index PELICULA_PK on PELICULA (
IDPELICULA
);

alter table ALQUILER
   add constraint FK_ALQUILER_CLIENTE_A_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE)
      on delete restrict on update restrict;

alter table ALQUILER
   add constraint FK_ALQUILER_PELICULA__PELICULA foreign key (IDPELICULA)
      references PELICULA (IDPELICULA)
      on delete restrict on update restrict;

