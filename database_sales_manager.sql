drop database if exists Sales_manager;

create database  Sales_manager;
 use  Sales_manager;

create table customer(
  cID int primary key,
  cName varchar(255),
  cAge int
);

create table bill(
  oID int primary key,
  cID int ,
  oDate date,
  oTotalPrice long,
  cID_customer int,
  foreign key(cID_customer) references customer(cID)
);

create table product(
  pID int primary key,
  pName varchar(255),
  pPrice long
);

create table order_detail(
  oID int ,
  pID int,
  odQty int,
  
  primary key(oID,pID),
  
  foreign key(oID) references bill(oID),
  foreign key(pID) references product(pID)
);
