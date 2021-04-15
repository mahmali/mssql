/*CREATE DATABASE okul*/
use okul
create table ögrenci_bilgileri
(ögr_no int ,noo int /*PRIMARY KEY*/,isim varchar(30),numara int CHECK (numara<100),CONSTRAINT pkkey primary key(numara,noo));

insert into ögrenci_bilgileri(ögr_no,noo,isim,numara) values (10,21,'muhammedd ali',11);/*sütunlara eleman ekler*/
insert into ögrenci_bilgileri(ögr_no,noo,isim,numara) values (10,11,'muhammedd ali',11);

alter table ögrenci_bilgileri add son_eklenen int not null;
alter table ögrenci_bilgileri add son_eklenen2 int; /*yeni sütun ekler*/

alter table ögrenci_bilgileri drop column son_eklenen2; /*ekleln bir sütünu siler*/
alter table ögrenci_bilgileri alter column son_eklenen varchar(20) NULL ; /*verilen sütünun degerlerini güncellemeye yarar*/
alter table ögernci_bilgileri add check (son_eklenen2>10); /*girilern deger verilen degerden büyük olma þartý getirildi*/

create table silinecek_tablo (deger int);  /*yeni tablo ekleme*/
drop table silinecek_tablo; /*ismi verilen tabloyu siler*/
drop database okul /*veritabaný silme iþlevi yapar*/

truncate table ögrenci_bilgileri; /*verilen tablonun içini boþalýr, temizler*/

select *from ögrenci_bilgileri; /*tüm tablo verilrinin getirir*/
select isim,noo from ögrenci_bilgileri; /*istenilen sütünü ,sütünlarý getirir dadece*/

select *from ögrenci_bilgileri where noo>15; /*verilen þarta göre ekrana veri getirme*/










