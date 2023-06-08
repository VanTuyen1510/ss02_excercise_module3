drop database if exists product_management;

create database product_management;

use product_management;

create table Vat_tu(
   id int primary key,
   Ten_Vtu varchar(70)
);
create table Phieu_nhap(
   So_Pn int primary key,
   Ngay_nhap date
);

create table phone(
   id int primary key,
   phone_number long
);

create table Phieu_xuat(
   So_Px int primary key,
   Ngay_xuat date
);

create table Nha_CC(
  id int primary key,
  `name` varchar(70),
  Dia_chi varchar(255),
  
  phone_id int,
  foreign key(phone_id) references phone(id)
  
);

create table Don_dh(
   So_Dh int primary key,
   Ngay_Dh date,
   
   Nha_CC_id int,
   foreign key(Nha_CC_id) references Nha_CC(id)
   
);




create table phieu_xuat_export_detail_vat_tu(
   So_Px_export_detail int,
   vat_tu_id_export_detail int,
   DG_xuat long,
   Sl_xuat int,
   primary key(So_Px_export_detail,vat_tu_id_export_detail),
   
   foreign key(So_Px_export_detail) references Phieu_xuat(So_Px),
   foreign key(vat_tu_id_export_detail) references Vat_tu(id)
);

create table vat_tu_input_detail_phieu_nhap(
   vat_tu_id_input_detail int,
    So_Pn_input_detail int,
    DG_nhap long,
    Sl_nhap int,
    
    primary key(vat_tu_id_input_detail,So_Pn_input_detail ),
    
    foreign key(vat_tu_id_input_detail) references Vat_tu(id),
    foreign key(So_Pn_input_detail) references Phieu_nhap(So_Pn)
    
);

create table vat_tu_order_detail_Nha_CC(
    vat_tu_id_order_detail int,
    So_Dh_order_detail int,
    
    primary key(vat_tu_id_order_detail,So_Dh_order_detail),
    
    foreign key(vat_tu_id_order_detail) references Vat_tu(id),
    foreign key(So_Dh_order_detail) references Don_dh(So_Dh)
    
);


