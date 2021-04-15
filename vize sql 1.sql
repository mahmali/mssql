/*CREATE DATABASE okul*/
use okul
create table �grenci_bilgileri
(�gr_no int ,noo int /*PRIMARY KEY*/,isim varchar(30),numara int CHECK (numara<100),CONSTRAINT pkkey primary key(numara,noo));

insert into �grenci_bilgileri(�gr_no,noo,isim,numara) values (10,21,'muhammedd ali',11);/*s�tunlara eleman ekler*/
insert into �grenci_bilgileri(�gr_no,noo,isim,numara) values (10,11,'muhammedd ali',11);

alter table �grenci_bilgileri add son_eklenen int not null;
alter table �grenci_bilgileri add son_eklenen2 int; /*yeni s�tun ekler*/

alter table �grenci_bilgileri drop column son_eklenen2; /*ekleln bir s�t�nu siler*/
alter table �grenci_bilgileri alter column son_eklenen varchar(20) NULL ; /*verilen s�t�nun degerlerini g�ncellemeye yarar*/
alter table �gernci_bilgileri add check (son_eklenen2>10); /*girilern deger verilen degerden b�y�k olma �art� getirildi*/

create table silinecek_tablo (deger int);  /*yeni tablo ekleme*/
drop table silinecek_tablo; /*ismi verilen tabloyu siler*/
drop database okul /*veritaban� silme i�levi yapar*/

truncate table �grenci_bilgileri; /*verilen tablonun i�ini bo�al�r, temizler*/

select *from �grenci_bilgileri; /*t�m tablo verilrinin getirir*/
select isim,noo from �grenci_bilgileri; /*istenilen s�t�n� ,s�t�nlar� getirir dadece*/

select *from �grenci_bilgileri where noo>15; /*verilen �arta g�re ekrana veri getirme*/










