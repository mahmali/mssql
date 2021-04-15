use okul

SELECT * FROM notlar WHERE numara IN ( SELECT numara FROM ogrenci WHERE bolkod=531); /*iç içe sorgu yazma (birden fazla deger oldugu zamanlarýdak kullanýlýr)*/
SELECT * FROM ogrenci WHERE no IN(7,12); /*7 ve 12 olanlarý çeker */

alter table müsteriler add cinsiyet varchar(10);
alter table müsteriler add ID int;
alter table müsteriler add deger1 varchar; /*tabloya yeni sütun degeri ekleme*/

insert into müsteriler (isim,sehir,ilce,ID) values ('muhammed ali akkaya','kahraman maraþ','afþin',1);

drop table notlar; /*tablonun tamamýný silme*/
truncate table bolum /*tablonun içindeki tüm verileri silet tablo yapýsal olarak kalýr*/

delete from müsteriler where ID=1;   /*ID si 1 olan deegeri siler where den sonra istenilen þart girilebilir*/
delete from müsteriler where ad like '%ur% '

select *from müsteriler where cinsiyet='E';
SELECT * from müsteriler where sehir in ('rize','ankara');
select *from müsteriler where sehir in ('ankara','Rize') and cinsiyet='K';
select *from müsteriler where isim like'%mustafa%';


select *from müsteriler where ID=1; /*ýd si 1 olan degeri geri dönderiri*/
select *from müsteriler; /*tüm tablo verilerini ekrana yazdýrýr*/

select *from müsteriler where sehir like '%a'; /*like ile istenilen karakter gecen degerleri ekrana getirme*/
select *from müsteriler where not sehir like '%a'; /* not ifadesi ile sonunda istenilen karakter olmayan verileri ekrana getirdik*/

select sehir,isim from müsteriler; /*verilen tablodan istenilen sütun yada sütunlar getirilir*/
select müsteriler.isim,ögrenci_bilgileri.isim from müsteriler,ögrenci_bilgileri; /*istenilen tablodan istenilen sütunu getirme*/
select distinct müsteriler.isim,ögrenci_bilgileri.isim from müsteriler,ögrenci_bilgileri; /*tablo içindeki anyný kayýtlar bir defa gösterilercek*/
select *from müsteriler order by isim asc; /*verilen sütüna göre baþtan sona dogru tablo dýralanýr*/
select *from müsteriler order by isim desc; /*verilen sütüna göre sonda baþa dogru tablo dýralanýr*/
select *from müsteriler order by cinsiyet,isim asc; /*önce ilk sütuna göre ardýndan 2. verilen sütuna göre sýralama yapar*/
select *from müsteriler order by cinsiyet asc,isim desc; /*önce ilk sütunu baþtan sona sonra 2. sütunu sondan baþa dogru sýralar*/

select isim as ad, sehir as memeleket from müsteriler; /* verilen sütun ismlerine sadece o onalýk gecerli takma ad verilir ve sadece ismi degiþen sütunlar ekran gelir*/
select isim,ID+1 as yeni_ID from müsteriler; /*verien stünlarda matemetiksel iþlemler yapar ama asýk tabloda degiþmez*/
select isim,(sehir+'-'+ilce) from müsteriler; /*verilen sütunlarý birleþtirerek tek sütunda gösterir asýl listede degiþmez*/

select *from müsteriler where ID<2; /* where den sonraki þartý saglayan verileri ekrana getiri*/
select *from müsteriler where sehir='rize' order by isim desc; /*verilen þertý saglayan verileri, verilen þartla sýralayarak
ekrana getiri*/
select *from müsteriler where tarih<'1950' order by tarih desc; /*verilen tarihten önceki verileri sondan baþa dogru sýralma yapar*/
select *from müsteriler where not tarih<'1950' order by tarih desc; /* not iþareti koyarsan tam tersi olur, verilen tarihten sonraki
verileri yani ilkinde alýnmayan verileri alarak sondan baþa dogru sýralar*/
select *from müsteriler where tarih>'1945' and tarih<'1950' order by tarih desc; /* and (ve) iafadesi ile verilen þartlarý
artýrarak istenileni daha rahat bularak sýralayabilrizi*/

select *from müsteriler where sehir IN('rize','ankara');/*in operatörü ile verilen sütunda verilen degerler olan verileri ekrana getirir*/
select *from müsteriler where ID not in (1);/*burada not ifadesi ile ID si 1 olayan degerleri sýraladýk*/
select *from müsteriler where sehir='ankara' and ID=1; /* in yerine yandaki görüldügü gibi or ile yada and ilede istenilenler alýnabilir*/

select *from müsteriler where sehir='ankara' or not ID=1; /*sehiri ankara yada Id si 1 olmayan degerler istenir*/
select *from müsteriler where sehir='ankara' or ID<>1; /*üstteki gibi not yerine ID<>1 yaparak Id si 1 e eþit olmayan degerleri ekrana
getirdik. bu iki select sorgududa ayný iþe yarar*/

select *from müsterilerID where ID between 10 and 20; /*verilen sütundaki verilen degerler arasýndaki degerleri
verir*/
select *from müsterilerID where ID>=10 and ID <=20; /* between ile yapýlan ilemi and ile yapma iþlemi*/

select *from müsteriler where sehir like '%atya%'; /*içinde verilen degerlerin oldugu verileri gösterir*/
select *from müsteriler where sehir like 'va%'; /*va ile baþlayan verileri ekrana getiren pergram*/
select *from müsteriler where sehir like '%an'; /* senu verilen eger ile biten verileri ekrana getirir*/
select *from müsteriler where sehir like '__n'; /* 3 harften oluþan ve 3. harfi n ona degerleri verir*/
select *from müsteriler where sehir like '[bu]%'; /* b ya u ile baþlayan verileri verir*/
select *from müsteriler where sehir like '[a-c]%'; /*verilen sütunun ilk degeri a ile c arasýnda olan verileri
verir*/
select *from müsterilerID where ID like '%[1-2][3-4]'; /* verilen sütunun son degerleri 13 ile 24 arasýnda ise verir*/
select *from müsterilerID where ID like '[^1-5][^123456789][0-2]'; /*ilki 1 ile 5 arasýnda olmayan 
ikincisi 123456789 sayýlarýndan biri olamyan ve 3. karakteri 0 ile 2 arasýnda olan degerleri verir*/

select *from müsteriler where tarih is null; /* taih kýsmý null olan verileri veririr*/
select isim,sehir,ID from müsterilerID; /*tablodan sadece istenilen sütunlarý verir*/
select isim,sehir,deger1 from müsteriler where deger1 is not null; /*isim sehir ve deger1 degerleri gösterir
ve deger1 tablosundaki null olmayan degerleri verir*/

select 3*5; /*select ifadesi ile aritmatik iþlemlerde yapýlabilir*/
select 3*5,5-10,3/5,4+(-10); /* select ile 4 ilen yapýlabilir*/
select 3*5 as 'toplam',545/25 as 'bölüm'; /* aritmatik iþlemlerle geçiçi isim kullanma */
select isim,sehir,ID,ID*2 as 'mod alýnmýþ ID' from müsterilerID; /*istenilen degerleri görüntüleme ve ID 
2 ile çarparak yanda yani sütuna yazýdýram pragram*/
select isim,(sehir+'--'+ilce) as 'il -- ilce' from müsteriler;/*takma isim verme ve verile iki sütundaki
verileri birleritirerek yeni bir sütuna yazma iþlemi*/

select isim, SUBSTRING(isim,2,2) as 'ay - gün' from müsteriler; /* ik ik degeri almaz ve ondan sonraki
iki degeri alarka yeni sütuna yazar ve sede yeni sütunu ve isim sütununu gösterir*/
select isim,substring (isim,1,1)+'.'+sehir as '(isim ilk harf).(sehir)',sehir from müsteriler;/*ismin ilk degerini
ve sehirin ortasýnda '.' iþareti koyarak birleitirdik ve yeni bi sütuna yarleþtirdik*/
select isim,left(isim,5)as 'ismin ilk 5 harfi',sehir,RIGHT(sehir,5)as 'sehrin son 5 harfi' from müsteriler;/*
ismin ilk 5 harfi ile sehirin son 5 harfini alýp yeni sütuna yazdýrmak*/

select isim,UPPER(isim) as 'büyük harfli isimler' from müsteriler; /* isteilen sütunu büyük harfe dönüþtürme*/
select isim,LOWER(isim) as 'küçük harfli isimler' from müsteriler; /* istenilen sütunu küçük harfe dönüþtürme*/
select isim, LTRIM(rtrim(isim)) as 'boþluðu alýnmýþ isim' from müsteriler; /*verien sütunun baþýnda ve sonunda
boþluk varsa bu boþluklarý siler*/
select isim,len(isim) as 'isim karakter sayýlarý' from müsteriler; /*verilen sütunun içindeki verinin karakter
uzunluðnu yania bir sütuna atar*/
select isim,len(ltrim(isim)) as 'isim karakter sayýlarý' from müsteriler; /*burda ise hem soldaki boþluklarý alýr
ve isim sütunun karakter uzunluðunu yeni sütuna atar*/
select isim,len(isim) as 'karakter uzunluklarý' from müsteriler where len(isim)>10; /* isim sütununnun karakter 
sayýsý 10 büyük olan verileri alýr va yani sütuna atarak sadece yeni sütunu ve isim sürunun yazar*/
select isim,len(isim) as 'karakter uzunluklarý' from müsteriler where not len(isim)>10; /* üstteki degerin tam
tersin iþlem yapar*/
select isim,sehir,len(isim+sehir) as 'isim ve sehir karakter uzunluklarý' from müsteriler where len(isim+sehir)<20;/* isim ve sehir katakter
uzunluðu 20 den küçük ise alýr ve kullanýcýya verir*/
select SUBSTRING(isim,1,1)as 'ilk harfler',isim from müsteriler where len(isim)<10; /* isimlerin ilke harflelrinin alýr ve karak uzunlugu 10
dan küçük olan þartýný saðlayan verileri yazdýrýr*/

select isim,sehir,cinsiyet,replace(cinsiyet,'e','T')as 'degiþen cinsiyet' from müsteriler; /*verilen sütundaki degeri 
baþka bir degerle degiþtirir*/
select CHARINDEX('ali','muhammed ali akkaya'); /*1 deger 2. degeri kaçýncý karakterinden baþladýgýný geri döndürü*/
select reverse(isim) as 'tersten yazýlan isimler',isim from müsteriler; /*verilen degeri tersten yazamaya yarar*/
select abs(5*(-62)) as deger; /*verien degerin mutlak degerini alýr*/
select isim,abs(deger1-deger2)as 'deger1-deger2' from müsteriler where deger1<deger2; /*deger1 - deger 2 iþlemini yaprak yani sütuna atar ve
deger1 < deger2 sartýný saglayan degeri kullanýcýya verir, mutlak deger (abs) iþlemi yapýlmadanda kulanýlýr*/
select d1, CEILING(d1) as 'aþagý yuvarla d1',FLOOR(d1) as 'yukarý yuvarla d1' from degerler; /* verilen dergeri aþagýya yada yukarý yuvarlama
iþlemleri yapma*/

/* yuvarlama iþlemleri */
select ROUND(748.58,-1);
select ROUND(748.58,-2);
select ROUND(748.58,-3);
select ROUND(748.58,-4);
select ROUND(123.4545,2);
select ROUND(123.45,-2);

select isim,ID,round ((ID*2)/3,2) as 'yeni ID' from müsterilerID;
select isim,ID,(((ID*200.9)/3)) as 'yeni ID',round(((ID*200.9)/3),-2) as 'yuvarlanmýþ ID'  from müsterilerID; /* virgülden önceki 2 degeri 0 yapar*/
select isim,ID,(((ID*200.9)/3)) as 'yeni ID',round(((ID*200.9)/3),2) as 'yuvarlanmýþ ID'  from müsterilerID; /*normalde virgülden sonra 2 basamak
deger gösterir gerisini 0 yapar */
select isim,ID,POWER(ID,2) as 'ID nin karesi' from müsterilerID; /* verilen deger yada sütunun üssü nü almaya yarar*/
select ID,round(sqrt(ID),3)as 'ID nin kare kökü' from müsterilerID; /* verilen degerin karekökü alýnýr ve round ile sedece virgülden sonraki 3 basamk
gösterilir*/
select sum(ID) as 'ID sütun toplamý' from müsterilerID; /* bir sütündaki verilen tüm degerleri toplamaya yarar*/
select sum(ID) as 'yeni' from müsterilerID where sehir='van'; /* sehri van olan verilerin toplam ID sini bulna program*/
select ID,sehir as 'vanlýlar' from müsterilerID where sehir='van'; /*vanlý olan verileri ekrana getiren program*/
select sum(ID) as 'vanlý ve erkek ve belli aralýktakiler' from müsterilerID where sehir='van' and cinsiyet='E' and tarih between '1945-10-10' and '1950-10-10';
select sum(ID) from müsterilerID where sehir='van' and cinsiyet='E' and tarih between '1950'and '1960'; /* vanlý erkek ve 1950 ile 1960 arasýnda dagmuþ olan verileirn 
toplam degerlerini bulur ve toplar*/
select avg(ID) as 'ortalama deger' from müsterilerID; /*verielen sütünun ortalama degerini bular istenirse where ile koþul belirtilebilir*/
select max(ID) as 'en büyük deger',min(ID)as 'küçük' from müsterilerID where sehir='ankara'; /* sehiri ankara olan ve enbüyük
ve en küçük ID ye sahip olan degeri veirir*/
select *from müsterilerID where ID%5=0; /* ýd sinin mod 5 i sýfýr olna verileri verir*/
select CURRENT_TIMESTAMP; /* o anki tarih ve saat verileri verir*/

/* zaman komutlarý */
select GETDATE() as 'saat';/*saat ve tarihi ayrýnntýlý bir þekilde verir*/
select datepart (year,getdate()); /*yýl*/
select datepart (MONTH,getdate()); /*ay*/
select datepart (DAY,getdate()); /*gün */
select datepart (WEEK,getdate()); /*hafta*/
select datepart (MONTH,2020-10-12);
select datepart (QUARTER,2020-10-12); 
select datepart (day,getdate()+5); /*verilen tarihe ekleme yapýlýr*/

select DATEDIFF (year,'2010-10-05','2015-5-10'); /* verieln tarihler arasýndaki farký bulur. month day ve quarter ilede bulunur*/

select isim,tarih, datediff (year,tarih,getdate()) as 'yýl' from müsterilerID; /*verilen tarihle þimdiki tarih arasýndaki farký verir*/
select DATEADD (day,365,'2020-10-10'); /*verilen tarihin istenilen tarih cinsine istenilen degeri atar*/
select sehir,AVG(ID) as 'ID ortalamalarý' from müsterilerID group by sehir; /*verilen sehirlerin ID ortalamalarýn veririr*/
select sehir,count(sehir) as 'sehir sayýsý' from müsterilerID group by sehir; /* verilen sehirlerin kaç tane oldugunu bulur*/
select max(ID) as 'en büyük IS' from müsterilerID; /* verilen en büyük ID yi verir*/
select sehir,max(ID)as 'en büyük ID' ,min(ID) as 'en küçük ID' from müsterilerID group by sehir; /*verilen sehirleri gruplar ve en büyük ve en küçük
ID leri bulur*/
select sehir,cinsiyet,count(sehir)as 'sehir sayýsý', max(ID) as 'max Id',min(ID) as 'min Id' from müsterilerID group by sehir,cinsiyet order by sehir; 
/* sehir ve cinsiyeti gruplayarak max ve min degerlerini gruplar ve sehirlerin kaç tane oldugunu bulur*/
select sehir,count(sehir)as 'sehir sayýsý' from müsterilerID group by sehir having count(sehir)>10 order by sehir; /*sehir sayýlarýný blulup gruplar ve
sehir sayýsý 10 büyük ise veriyi alýr*/
select sehir,count(sehir) as 'sehir sayýlarý' from müsteriler group by sehir having count(*)>10; /*sehirleri grouplar ve grup sayýsýnýda verilen degere
göre karþýlarþtýrýr ver istenilen degerleri verir*/
select sehir,count(sehir) as 'sehir sayýlarý' from müsteriler group by sehir having not count(*)>10 order by sehir; /* üstteki degerin tam tersidir*/
select sehir,count(*) as 'sehir sayýlarý' from müsteriler group by sehir,cinsiyet having count(*)>10 order by sehir;
select *from müsterilerID ýd;

select * from müsteriler;
select * from müsterilerID;
truncate table müsterilerID /*ismi verilen tablonun içerisini boþaltýr*/

update müsteriler set ID=2 where cinsiyet='k'; /*cinsiyeti kýz olan degerlerin Id sini 2 yapar*/
update müsteriler set ID=1; /*where þartý yazýlmassa verilen tüm degerler için sart saðlanýr*/
update müsteriler set isim='ali akkaya' where ID=1; /*sonraki þartý saðlarsa önceki þertý uygula. güncelleme iþlemi yapar yani*/
update müsteriler set adi='ali veli' where adi='veli' /*ali veliyi ali olrak güncelledi*/


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
Create table hocalar(h_ID tinyint primary key , h_adi char(20) , h_soyadi char(20) ,unvan tinyint foreign key references unvan(un_kod) , top_ders_saati tinyint) /*pk ve fk ile tablo oluþturma*/
Create table notlar(no int , op_kod smallint foreign key references dersler(op_kod) , vize tinyint , check(vize between 0 and 100) , final tinyint , check(final between 0 and 100) ,
		 but tinyint , check(but between 0 and 100) ) /*kýsýtlamalý tablo oluþturma */
Create table ogrenci(no int primary key , adi char(20) , soyadi char(20) , bolkod smallint foreign key references bolum(bolkod) , sinif tinyint , check( sinif IN(1,2,3,4)) , h_ID tinyint
		foreign key references hocalar(h_ID) , d_tarihi datetime , memleket tinyint foreign key references memleket(tr_kod) , cinsiyet char(5) ) /*kýsýtlamalý tablo oluþturma 2*/

Create table unvan(un_kod tinyint primary key , ünvani char(11)) /*pk lli bir tablo oluþturma*/


drop table silinecek_tablo; /*ismi verilen tabloyu siler*/
drop database okul /*veritabaný silme iþlevi yapar*/

truncate table ögrenci_bilgileri; /*verilen tablonun içini boþalýr, temizler*/

select *from ögrenci_bilgileri; /*tüm tablo verilrinin getirir*/
select isim,noo from ögrenci_bilgileri; /*istenilen sütünü ,sütünlarý getirir dadece*/

select *from ögrenci_bilgileri where noo>15; /*verilen þarta göre ekrana veri getirme*/

SELECT SUM(maas) FROM personel; /*tüm maaslarý toplar*/
SELECT AVG (sütun_adi ) FROM Tablo_adi; /*ortalama alýr null hariç*/
SELECT MAX (sütun_adý ) FROM Tablo_adý;  /*max min*/
SELECT COUNT (sütun_adý ) FROM Tablo_adý;  /*sayma iþlemi nula hariç*/

