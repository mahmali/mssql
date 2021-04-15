use okul

SELECT * FROM notlar WHERE numara IN ( SELECT numara FROM ogrenci WHERE bolkod=531); /*i� i�e sorgu yazma (birden fazla deger oldugu zamanlar�dak kullan�l�r)*/
SELECT * FROM ogrenci WHERE no IN(7,12); /*7 ve 12 olanlar� �eker */

alter table m�steriler add cinsiyet varchar(10);
alter table m�steriler add ID int;
alter table m�steriler add deger1 varchar; /*tabloya yeni s�tun degeri ekleme*/

insert into m�steriler (isim,sehir,ilce,ID) values ('muhammed ali akkaya','kahraman mara�','af�in',1);

drop table notlar; /*tablonun tamam�n� silme*/
truncate table bolum /*tablonun i�indeki t�m verileri silet tablo yap�sal olarak kal�r*/

delete from m�steriler where ID=1;   /*ID si 1 olan deegeri siler where den sonra istenilen �art girilebilir*/
delete from m�steriler where ad like '%ur% '

select *from m�steriler where cinsiyet='E';
SELECT * from m�steriler where sehir in ('rize','ankara');
select *from m�steriler where sehir in ('ankara','Rize') and cinsiyet='K';
select *from m�steriler where isim like'%mustafa%';


select *from m�steriler where ID=1; /*�d si 1 olan degeri geri d�nderiri*/
select *from m�steriler; /*t�m tablo verilerini ekrana yazd�r�r*/

select *from m�steriler where sehir like '%a'; /*like ile istenilen karakter gecen degerleri ekrana getirme*/
select *from m�steriler where not sehir like '%a'; /* not ifadesi ile sonunda istenilen karakter olmayan verileri ekrana getirdik*/

select sehir,isim from m�steriler; /*verilen tablodan istenilen s�tun yada s�tunlar getirilir*/
select m�steriler.isim,�grenci_bilgileri.isim from m�steriler,�grenci_bilgileri; /*istenilen tablodan istenilen s�tunu getirme*/
select distinct m�steriler.isim,�grenci_bilgileri.isim from m�steriler,�grenci_bilgileri; /*tablo i�indeki anyn� kay�tlar bir defa g�sterilercek*/
select *from m�steriler order by isim asc; /*verilen s�t�na g�re ba�tan sona dogru tablo d�ralan�r*/
select *from m�steriler order by isim desc; /*verilen s�t�na g�re sonda ba�a dogru tablo d�ralan�r*/
select *from m�steriler order by cinsiyet,isim asc; /*�nce ilk s�tuna g�re ard�ndan 2. verilen s�tuna g�re s�ralama yapar*/
select *from m�steriler order by cinsiyet asc,isim desc; /*�nce ilk s�tunu ba�tan sona sonra 2. s�tunu sondan ba�a dogru s�ralar*/

select isim as ad, sehir as memeleket from m�steriler; /* verilen s�tun ismlerine sadece o onal�k gecerli takma ad verilir ve sadece ismi degi�en s�tunlar ekran gelir*/
select isim,ID+1 as yeni_ID from m�steriler; /*verien st�nlarda matemetiksel i�lemler yapar ama as�k tabloda degi�mez*/
select isim,(sehir+'-'+ilce) from m�steriler; /*verilen s�tunlar� birle�tirerek tek s�tunda g�sterir as�l listede degi�mez*/

select *from m�steriler where ID<2; /* where den sonraki �art� saglayan verileri ekrana getiri*/
select *from m�steriler where sehir='rize' order by isim desc; /*verilen �ert� saglayan verileri, verilen �artla s�ralayarak
ekrana getiri*/
select *from m�steriler where tarih<'1950' order by tarih desc; /*verilen tarihten �nceki verileri sondan ba�a dogru s�ralma yapar*/
select *from m�steriler where not tarih<'1950' order by tarih desc; /* not i�areti koyarsan tam tersi olur, verilen tarihten sonraki
verileri yani ilkinde al�nmayan verileri alarak sondan ba�a dogru s�ralar*/
select *from m�steriler where tarih>'1945' and tarih<'1950' order by tarih desc; /* and (ve) iafadesi ile verilen �artlar�
art�rarak istenileni daha rahat bularak s�ralayabilrizi*/

select *from m�steriler where sehir IN('rize','ankara');/*in operat�r� ile verilen s�tunda verilen degerler olan verileri ekrana getirir*/
select *from m�steriler where ID not in (1);/*burada not ifadesi ile ID si 1 olayan degerleri s�ralad�k*/
select *from m�steriler where sehir='ankara' and ID=1; /* in yerine yandaki g�r�ld�g� gibi or ile yada and ilede istenilenler al�nabilir*/

select *from m�steriler where sehir='ankara' or not ID=1; /*sehiri ankara yada Id si 1 olmayan degerler istenir*/
select *from m�steriler where sehir='ankara' or ID<>1; /*�stteki gibi not yerine ID<>1 yaparak Id si 1 e e�it olmayan degerleri ekrana
getirdik. bu iki select sorgududa ayn� i�e yarar*/

select *from m�sterilerID where ID between 10 and 20; /*verilen s�tundaki verilen degerler aras�ndaki degerleri
verir*/
select *from m�sterilerID where ID>=10 and ID <=20; /* between ile yap�lan ilemi and ile yapma i�lemi*/

select *from m�steriler where sehir like '%atya%'; /*i�inde verilen degerlerin oldugu verileri g�sterir*/
select *from m�steriler where sehir like 'va%'; /*va ile ba�layan verileri ekrana getiren pergram*/
select *from m�steriler where sehir like '%an'; /* senu verilen eger ile biten verileri ekrana getirir*/
select *from m�steriler where sehir like '__n'; /* 3 harften olu�an ve 3. harfi n ona degerleri verir*/
select *from m�steriler where sehir like '[bu]%'; /* b ya u ile ba�layan verileri verir*/
select *from m�steriler where sehir like '[a-c]%'; /*verilen s�tunun ilk degeri a ile c aras�nda olan verileri
verir*/
select *from m�sterilerID where ID like '%[1-2][3-4]'; /* verilen s�tunun son degerleri 13 ile 24 aras�nda ise verir*/
select *from m�sterilerID where ID like '[^1-5][^123456789][0-2]'; /*ilki 1 ile 5 aras�nda olmayan 
ikincisi 123456789 say�lar�ndan biri olamyan ve 3. karakteri 0 ile 2 aras�nda olan degerleri verir*/

select *from m�steriler where tarih is null; /* taih k�sm� null olan verileri veririr*/
select isim,sehir,ID from m�sterilerID; /*tablodan sadece istenilen s�tunlar� verir*/
select isim,sehir,deger1 from m�steriler where deger1 is not null; /*isim sehir ve deger1 degerleri g�sterir
ve deger1 tablosundaki null olmayan degerleri verir*/

select 3*5; /*select ifadesi ile aritmatik i�lemlerde yap�labilir*/
select 3*5,5-10,3/5,4+(-10); /* select ile 4 ilen yap�labilir*/
select 3*5 as 'toplam',545/25 as 'b�l�m'; /* aritmatik i�lemlerle ge�i�i isim kullanma */
select isim,sehir,ID,ID*2 as 'mod al�nm�� ID' from m�sterilerID; /*istenilen degerleri g�r�nt�leme ve ID 
2 ile �arparak yanda yani s�tuna yaz�d�ram pragram*/
select isim,(sehir+'--'+ilce) as 'il -- ilce' from m�steriler;/*takma isim verme ve verile iki s�tundaki
verileri birleritirerek yeni bir s�tuna yazma i�lemi*/

select isim, SUBSTRING(isim,2,2) as 'ay - g�n' from m�steriler; /* ik ik degeri almaz ve ondan sonraki
iki degeri alarka yeni s�tuna yazar ve sede yeni s�tunu ve isim s�tununu g�sterir*/
select isim,substring (isim,1,1)+'.'+sehir as '(isim ilk harf).(sehir)',sehir from m�steriler;/*ismin ilk degerini
ve sehirin ortas�nda '.' i�areti koyarak birleitirdik ve yeni bi s�tuna yarle�tirdik*/
select isim,left(isim,5)as 'ismin ilk 5 harfi',sehir,RIGHT(sehir,5)as 'sehrin son 5 harfi' from m�steriler;/*
ismin ilk 5 harfi ile sehirin son 5 harfini al�p yeni s�tuna yazd�rmak*/

select isim,UPPER(isim) as 'b�y�k harfli isimler' from m�steriler; /* isteilen s�tunu b�y�k harfe d�n��t�rme*/
select isim,LOWER(isim) as 'k���k harfli isimler' from m�steriler; /* istenilen s�tunu k���k harfe d�n��t�rme*/
select isim, LTRIM(rtrim(isim)) as 'bo�lu�u al�nm�� isim' from m�steriler; /*verien s�tunun ba��nda ve sonunda
bo�luk varsa bu bo�luklar� siler*/
select isim,len(isim) as 'isim karakter say�lar�' from m�steriler; /*verilen s�tunun i�indeki verinin karakter
uzunlu�nu yania bir s�tuna atar*/
select isim,len(ltrim(isim)) as 'isim karakter say�lar�' from m�steriler; /*burda ise hem soldaki bo�luklar� al�r
ve isim s�tunun karakter uzunlu�unu yeni s�tuna atar*/
select isim,len(isim) as 'karakter uzunluklar�' from m�steriler where len(isim)>10; /* isim s�tununnun karakter 
say�s� 10 b�y�k olan verileri al�r va yani s�tuna atarak sadece yeni s�tunu ve isim s�runun yazar*/
select isim,len(isim) as 'karakter uzunluklar�' from m�steriler where not len(isim)>10; /* �stteki degerin tam
tersin i�lem yapar*/
select isim,sehir,len(isim+sehir) as 'isim ve sehir karakter uzunluklar�' from m�steriler where len(isim+sehir)<20;/* isim ve sehir katakter
uzunlu�u 20 den k���k ise al�r ve kullan�c�ya verir*/
select SUBSTRING(isim,1,1)as 'ilk harfler',isim from m�steriler where len(isim)<10; /* isimlerin ilke harflelrinin al�r ve karak uzunlugu 10
dan k���k olan �art�n� sa�layan verileri yazd�r�r*/

select isim,sehir,cinsiyet,replace(cinsiyet,'e','T')as 'degi�en cinsiyet' from m�steriler; /*verilen s�tundaki degeri 
ba�ka bir degerle degi�tirir*/
select CHARINDEX('ali','muhammed ali akkaya'); /*1 deger 2. degeri ka��nc� karakterinden ba�lad�g�n� geri d�nd�r�*/
select reverse(isim) as 'tersten yaz�lan isimler',isim from m�steriler; /*verilen degeri tersten yazamaya yarar*/
select abs(5*(-62)) as deger; /*verien degerin mutlak degerini al�r*/
select isim,abs(deger1-deger2)as 'deger1-deger2' from m�steriler where deger1<deger2; /*deger1 - deger 2 i�lemini yaprak yani s�tuna atar ve
deger1 < deger2 sart�n� saglayan degeri kullan�c�ya verir, mutlak deger (abs) i�lemi yap�lmadanda kulan�l�r*/
select d1, CEILING(d1) as 'a�ag� yuvarla d1',FLOOR(d1) as 'yukar� yuvarla d1' from degerler; /* verilen dergeri a�ag�ya yada yukar� yuvarlama
i�lemleri yapma*/

/* yuvarlama i�lemleri */
select ROUND(748.58,-1);
select ROUND(748.58,-2);
select ROUND(748.58,-3);
select ROUND(748.58,-4);
select ROUND(123.4545,2);
select ROUND(123.45,-2);

select isim,ID,round ((ID*2)/3,2) as 'yeni ID' from m�sterilerID;
select isim,ID,(((ID*200.9)/3)) as 'yeni ID',round(((ID*200.9)/3),-2) as 'yuvarlanm�� ID'  from m�sterilerID; /* virg�lden �nceki 2 degeri 0 yapar*/
select isim,ID,(((ID*200.9)/3)) as 'yeni ID',round(((ID*200.9)/3),2) as 'yuvarlanm�� ID'  from m�sterilerID; /*normalde virg�lden sonra 2 basamak
deger g�sterir gerisini 0 yapar */
select isim,ID,POWER(ID,2) as 'ID nin karesi' from m�sterilerID; /* verilen deger yada s�tunun �ss� n� almaya yarar*/
select ID,round(sqrt(ID),3)as 'ID nin kare k�k�' from m�sterilerID; /* verilen degerin karek�k� al�n�r ve round ile sedece virg�lden sonraki 3 basamk
g�sterilir*/
select sum(ID) as 'ID s�tun toplam�' from m�sterilerID; /* bir s�t�ndaki verilen t�m degerleri toplamaya yarar*/
select sum(ID) as 'yeni' from m�sterilerID where sehir='van'; /* sehri van olan verilerin toplam ID sini bulna program*/
select ID,sehir as 'vanl�lar' from m�sterilerID where sehir='van'; /*vanl� olan verileri ekrana getiren program*/
select sum(ID) as 'vanl� ve erkek ve belli aral�ktakiler' from m�sterilerID where sehir='van' and cinsiyet='E' and tarih between '1945-10-10' and '1950-10-10';
select sum(ID) from m�sterilerID where sehir='van' and cinsiyet='E' and tarih between '1950'and '1960'; /* vanl� erkek ve 1950 ile 1960 aras�nda dagmu� olan verileirn 
toplam degerlerini bulur ve toplar*/
select avg(ID) as 'ortalama deger' from m�sterilerID; /*verielen s�t�nun ortalama degerini bular istenirse where ile ko�ul belirtilebilir*/
select max(ID) as 'en b�y�k deger',min(ID)as 'k���k' from m�sterilerID where sehir='ankara'; /* sehiri ankara olan ve enb�y�k
ve en k���k ID ye sahip olan degeri veirir*/
select *from m�sterilerID where ID%5=0; /* �d sinin mod 5 i s�f�r olna verileri verir*/
select CURRENT_TIMESTAMP; /* o anki tarih ve saat verileri verir*/

/* zaman komutlar� */
select GETDATE() as 'saat';/*saat ve tarihi ayr�nnt�l� bir �ekilde verir*/
select datepart (year,getdate()); /*y�l*/
select datepart (MONTH,getdate()); /*ay*/
select datepart (DAY,getdate()); /*g�n */
select datepart (WEEK,getdate()); /*hafta*/
select datepart (MONTH,2020-10-12);
select datepart (QUARTER,2020-10-12); 
select datepart (day,getdate()+5); /*verilen tarihe ekleme yap�l�r*/

select DATEDIFF (year,'2010-10-05','2015-5-10'); /* verieln tarihler aras�ndaki fark� bulur. month day ve quarter ilede bulunur*/

select isim,tarih, datediff (year,tarih,getdate()) as 'y�l' from m�sterilerID; /*verilen tarihle �imdiki tarih aras�ndaki fark� verir*/
select DATEADD (day,365,'2020-10-10'); /*verilen tarihin istenilen tarih cinsine istenilen degeri atar*/
select sehir,AVG(ID) as 'ID ortalamalar�' from m�sterilerID group by sehir; /*verilen sehirlerin ID ortalamalar�n veririr*/
select sehir,count(sehir) as 'sehir say�s�' from m�sterilerID group by sehir; /* verilen sehirlerin ka� tane oldugunu bulur*/
select max(ID) as 'en b�y�k IS' from m�sterilerID; /* verilen en b�y�k ID yi verir*/
select sehir,max(ID)as 'en b�y�k ID' ,min(ID) as 'en k���k ID' from m�sterilerID group by sehir; /*verilen sehirleri gruplar ve en b�y�k ve en k���k
ID leri bulur*/
select sehir,cinsiyet,count(sehir)as 'sehir say�s�', max(ID) as 'max Id',min(ID) as 'min Id' from m�sterilerID group by sehir,cinsiyet order by sehir; 
/* sehir ve cinsiyeti gruplayarak max ve min degerlerini gruplar ve sehirlerin ka� tane oldugunu bulur*/
select sehir,count(sehir)as 'sehir say�s�' from m�sterilerID group by sehir having count(sehir)>10 order by sehir; /*sehir say�lar�n� blulup gruplar ve
sehir say�s� 10 b�y�k ise veriyi al�r*/
select sehir,count(sehir) as 'sehir say�lar�' from m�steriler group by sehir having count(*)>10; /*sehirleri grouplar ve grup say�s�n�da verilen degere
g�re kar��lar�t�r�r ver istenilen degerleri verir*/
select sehir,count(sehir) as 'sehir say�lar�' from m�steriler group by sehir having not count(*)>10 order by sehir; /* �stteki degerin tam tersidir*/
select sehir,count(*) as 'sehir say�lar�' from m�steriler group by sehir,cinsiyet having count(*)>10 order by sehir;
select *from m�sterilerID �d;

select * from m�steriler;
select * from m�sterilerID;
truncate table m�sterilerID /*ismi verilen tablonun i�erisini bo�alt�r*/

update m�steriler set ID=2 where cinsiyet='k'; /*cinsiyeti k�z olan degerlerin Id sini 2 yapar*/
update m�steriler set ID=1; /*where �art� yaz�lmassa verilen t�m degerler i�in sart sa�lan�r*/
update m�steriler set isim='ali akkaya' where ID=1; /*sonraki �art� sa�larsa �nceki �ert� uygula. g�ncelleme i�lemi yapar yani*/
update m�steriler set adi='ali veli' where adi='veli' /*ali veliyi ali olrak g�ncelledi*/


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
Create table hocalar(h_ID tinyint primary key , h_adi char(20) , h_soyadi char(20) ,unvan tinyint foreign key references unvan(un_kod) , top_ders_saati tinyint) /*pk ve fk ile tablo olu�turma*/
Create table notlar(no int , op_kod smallint foreign key references dersler(op_kod) , vize tinyint , check(vize between 0 and 100) , final tinyint , check(final between 0 and 100) ,
		 but tinyint , check(but between 0 and 100) ) /*k�s�tlamal� tablo olu�turma */
Create table ogrenci(no int primary key , adi char(20) , soyadi char(20) , bolkod smallint foreign key references bolum(bolkod) , sinif tinyint , check( sinif IN(1,2,3,4)) , h_ID tinyint
		foreign key references hocalar(h_ID) , d_tarihi datetime , memleket tinyint foreign key references memleket(tr_kod) , cinsiyet char(5) ) /*k�s�tlamal� tablo olu�turma 2*/

Create table unvan(un_kod tinyint primary key , �nvani char(11)) /*pk lli bir tablo olu�turma*/


drop table silinecek_tablo; /*ismi verilen tabloyu siler*/
drop database okul /*veritaban� silme i�levi yapar*/

truncate table �grenci_bilgileri; /*verilen tablonun i�ini bo�al�r, temizler*/

select *from �grenci_bilgileri; /*t�m tablo verilrinin getirir*/
select isim,noo from �grenci_bilgileri; /*istenilen s�t�n� ,s�t�nlar� getirir dadece*/

select *from �grenci_bilgileri where noo>15; /*verilen �arta g�re ekrana veri getirme*/

SELECT SUM(maas) FROM personel; /*t�m maaslar� toplar*/
SELECT AVG (s�tun_adi ) FROM Tablo_adi; /*ortalama al�r null hari�*/
SELECT MAX (s�tun_ad� ) FROM Tablo_ad�;  /*max min*/
SELECT COUNT (s�tun_ad� ) FROM Tablo_ad�;  /*sayma i�lemi nula hari�*/

