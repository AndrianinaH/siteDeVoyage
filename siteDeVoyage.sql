/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     06/04/2017 21:06:49                          */
/*==============================================================*/


drop index CHAMBRE_HOTEL_FK;

drop index CHAMBRE_PK;

drop table CHAMBRE;

drop index CLIENT_PK;

drop table CLIENT;

drop index COMMODITE_PK;

drop table COMMODITE;

drop index DESTINATION_PK;

drop table DESTINATION;

drop index FILTRE_HOTEL_FK;

drop index DEST_HOTEL_FK;

drop index HOTEL_PK;

drop table HOTEL;

drop index CHAMBRE_RESERVATINO_FK;

drop index RESERVATION_CLIENT_FK;

drop index RESERVATION_PK;

drop table RESERVATION;

/*==============================================================*/
/* Table: CHAMBRE                                               */
/*==============================================================*/
create table CHAMBRE (
   ID_CHAMBRE           SERIAL               not null,
   ID_HOTEL             INT4                 not null,
   NOM_CHAMBRE          VARCHAR(100)         null,
   NBR_PETIT_LIT        INT4                 null,
   NBR_GRAND_LIT        INT4                 null,
   PRIX                 NUMERIC(10)          null,
   constraint PK_CHAMBRE primary key (ID_CHAMBRE)
);

/*==============================================================*/
/* Index: CHAMBRE_PK                                            */
/*==============================================================*/
create unique index CHAMBRE_PK on CHAMBRE (
ID_CHAMBRE
);

/*==============================================================*/
/* Index: CHAMBRE_HOTEL_FK                                      */
/*==============================================================*/
create  index CHAMBRE_HOTEL_FK on CHAMBRE (
ID_HOTEL
);

/*==============================================================*/
/* Table: CLIENT                                                */
/*==============================================================*/
create table CLIENT (
   ID_CLIENT            SERIAL               not null,
   NOM_CLIENT           VARCHAR(100)         null,
   EMAIL                VARCHAR(100)         null,
   MDP                  VARCHAR(100)         null,
   constraint PK_CLIENT primary key (ID_CLIENT)
);

/*==============================================================*/
/* Index: CLIENT_PK                                             */
/*==============================================================*/
create unique index CLIENT_PK on CLIENT (
ID_CLIENT
);

/*==============================================================*/
/* Table: COMMODITE                                             */
/*==============================================================*/
create table COMMODITE (
   ID_COMMODITE         SERIAL               not null,
   NOM_COMMODITE        VARCHAR(100)         null,
   constraint PK_COMMODITE primary key (ID_COMMODITE)
);

/*==============================================================*/
/* Index: COMMODITE_PK                                          */
/*==============================================================*/
create unique index COMMODITE_PK on COMMODITE (
ID_COMMODITE
);

/*==============================================================*/
/* Table: DESTINATION                                           */
/*==============================================================*/
create table DESTINATION (
   ID_DESTINATION       SERIAL               not null,
   NOM_DESTINATION      VARCHAR(100)         null,
   constraint PK_DESTINATION primary key (ID_DESTINATION)
);

/*==============================================================*/
/* Index: DESTINATION_PK                                        */
/*==============================================================*/
create unique index DESTINATION_PK on DESTINATION (
ID_DESTINATION
);

/*==============================================================*/
/* Table: HOTEL                                                 */
/*==============================================================*/
create table HOTEL (
   ID_HOTEL             SERIAL               not null,
   ID_DESTINATION       INT4                 not null,
   ID_COMMODITE         INT4                 not null,
   NOM_HOTEL            VARCHAR(100)         null,
   DESCRIPTION          TEXT                 null,
   IMAGE                VARCHAR(100)         null,
   constraint PK_HOTEL primary key (ID_HOTEL)
);

/*==============================================================*/
/* Index: HOTEL_PK                                              */
/*==============================================================*/
create unique index HOTEL_PK on HOTEL (
ID_HOTEL
);

/*==============================================================*/
/* Index: DEST_HOTEL_FK                                         */
/*==============================================================*/
create  index DEST_HOTEL_FK on HOTEL (
ID_DESTINATION
);

/*==============================================================*/
/* Index: FILTRE_HOTEL_FK                                       */
/*==============================================================*/
create  index FILTRE_HOTEL_FK on HOTEL (
ID_COMMODITE
);

/*==============================================================*/
/* Table: RESERVATION                                           */
/*==============================================================*/
create table RESERVATION (
   ID_RESERVATION       SERIAL               not null,
   ID_CHAMBRE           INT4                 not null,
   ID_CLIENT            INT4                 not null,
   DATE_DEBUT           DATE                 null,
   DATE_FIN             DATE                 null,
   constraint PK_RESERVATION primary key (ID_RESERVATION)
);

/*==============================================================*/
/* Index: RESERVATION_PK                                        */
/*==============================================================*/
create unique index RESERVATION_PK on RESERVATION (
ID_RESERVATION
);

/*==============================================================*/
/* Index: RESERVATION_CLIENT_FK                                 */
/*==============================================================*/
create  index RESERVATION_CLIENT_FK on RESERVATION (
ID_CLIENT
);

/*==============================================================*/
/* Index: CHAMBRE_RESERVATINO_FK                                */
/*==============================================================*/
create  index CHAMBRE_RESERVATINO_FK on RESERVATION (
ID_CHAMBRE
);

alter table CHAMBRE
   add constraint FK_CHAMBRE_CHAMBRE_H_HOTEL foreign key (ID_HOTEL)
      references HOTEL (ID_HOTEL)
      on delete restrict on update restrict;

alter table HOTEL
   add constraint FK_HOTEL_DEST_HOTE_DESTINAT foreign key (ID_DESTINATION)
      references DESTINATION (ID_DESTINATION)
      on delete restrict on update restrict;

alter table HOTEL
   add constraint FK_HOTEL_FILTRE_HO_COMMODIT foreign key (ID_COMMODITE)
      references COMMODITE (ID_COMMODITE)
      on delete restrict on update restrict;

alter table RESERVATION
   add constraint FK_RESERVAT_CHAMBRE_R_CHAMBRE foreign key (ID_CHAMBRE)
      references CHAMBRE (ID_CHAMBRE)
      on delete restrict on update restrict;

alter table RESERVATION
   add constraint FK_RESERVAT_RESERVATI_CLIENT foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT)
      on delete restrict on update restrict;

