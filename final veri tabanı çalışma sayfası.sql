                                        /*veri taban� ve y�netim sisteleri final �al��ma sayfas�*/

use ogrenci

declare @sayi1 int,@sayi2 int, @toplam int
set @sayi1=10
set @sayi2=9
set @toplam=@sayi1+@sayi2
print @toplam                     /*verien iki say�n�n toplam� bulma*/

declare @sayi3 int
select @sayi3=100
print @sayi3                     /*ayn� i�lem set yerine select ileda yap�labilir*/

declare @eny�ksek int
select @eny�ksek=max(final) from notlar
select @eny�ksek as "en b�y�k not" /*printsiz b�ylede yaz�labilir.*/      /*hocalar tablosundaki en b�y�k final� verir*/

select *from sys.sysmessages       /*verilen t�m hatalar�n listeler*/

select 5/1 /*direk b�ylede 4 i�lem yap�labilir*/

delete from notlar where final>95   /*silme i�lemi kal�c�d�r ana listeden siler*/
select @@ROWCOUNT                   /*ka� tane eleman sildigini verir*/

declare @deger varchar(90)
set @deger='m�hamemd ali akkkaya'
/*go*/                              /*araya go gelir ise hata verir, go tabloyu ikiye ay�r�r ��nki*/
print @deger

declare @personel table(
no int identity(1,1),
ad varchar(90) not null,
telefon varchar(15) )
insert into @personel values ('mahmlai',232323)
insert into @personel values ('mahmldfdfai',2322323323)
select *from @personel order by ad                             /*declare ile liste olu�turma ve listedeki elemanlar� g�sterme*/

declare @eklenenler table(ad varchar(18),soyad varchar(38),maas money)   /*eklenenler diye tablo olu�turma*/
insert into personel                                                     /*aktar�lacak yere kal�c� olrak deger ekler*/
output inserted.ad, inserted.soyad,inserted.maas                         /*aktar�lacak degerler*/
into @eklenenler                                                         /*aktar�lacaklar�n tutuldugu yer*/
values ('eslem','pazar',88)                                              /*eklene degereler*/
select *from @eklenenler                                                 /*tablo degi�keninin i�eriginin listesi*/

declare @silinenler table(                             /*silinecek degerlerin konulacag� deger tablosu olu�turur*/
	ad varchar(20),
	soyad varchar(20),
	maas varchar (20)    )
delete from personel                                   /*silinecek tablo ismi istenir*/
	output deleted.ad,deleted.soyad,deleted.maas
	into @silinenler                                     
where maas<31                                          /*tablodaki silineceklerin �ar� burada tan�lan�r*/
select *from @silinenler                               /*silinen degerleri alt tarafta g�sterir*/
select count(*) from @silinenler                               /*silinen degerlerin say�s� verir*/

/*if exists(select *from personel where maas<90
	print 'maas� 90 dan k���k olan degerler'*/            /*olmad�*/

if (select min(maas) from personel)>100                 /*verien �art*/
	print 'maas� 100 b�y�k olan bir maas yok'
else 
	select ad,soyad,maas from personel                  /*yazd�r�lacak kelimeler*/
	where maas<100

select count(*)from ogrenci                            /*�grenci say�s�n� verir*/

declare @o_say�s� int                                  /*degi�ken tan�mlama*/      
select @o_say�s�=count(*)from ogrenci                  /*degi�kene deger atama*/ 
print @o_say�s�                                        /*degi�keni yazd�rma*/

use okul                                                /*tablo tan�mlama*/
select isim, cinsiyet=                                  /*g�sterilecek s�tun listesi*/
	case cinsiyet                                       /*case i�lem yap�lacak s�tun �e�me*/
		when 'E' then 'erkek'                           /*i�lem tan�mlama E leri erkek olrak degi�tirme*/
		when 'K' then 'k�z'
 	 end
from m�sterilerID                                       /*i�lme yap�lacak tablo*/

use ogrenci
select ad,soyad,                       
	case	
		when maas is null then 0                        /*maas� null olan degerleri 0 yapar*/
		else maas                                       /*null degil ise diger maas degerini yazd�r�r*/
	end
from personel                                           /*i�lem ana tabloya i�lemez*/

select *from personel

update personel                                          /*update oldugu i�in ana listede i�lem yapar*/
set maas=(                                               /*i�lem yap�lacak s�tun belirlenir*/
	case
		when maas<100 then (maas+(maas*20)/100)          /*i�lem ler*/
		when maas>100 and maas<200 then maas-((maas*15)/100)
		else maas+(maas)
	end)                                                 /*case i�lemini bitir*/
	
declare @sayac int                                       /*deger tan�mlama*/
set @sayac=1											/*degere say� atama*/
while @sayac<=5
begin                                                   /*d�ng� ba�lang�� noktas� belirleme*/
	print (cast(@sayac as varchar(10)) + 'karesi:' + cast(@sayac*@sayac as varchar(10)))         /*i�lemler*/
		set @sayac=@sayac+1                             /*d�ng� sayac�n� artt�rma*/
end                                                     /*d�n��y� bitirme*/

declare @sayac smallint
set @sayac =1 
yenile:                                                     /*goto nin gidecegi deger*/
print 'sayac degeri:' + cast(@sayac as varchar(1))          /*yap�lan i�lem*/
set @sayac=@sayac+1
while @sayac<=4                                             /*dong�*/                                
	goto yenile

declare @deger int                                  /*k�sa bir �rnek sadece returm mant���n� anlamaya y�nelikti*/
declare @deger2 int
set @deger=123
if @deger2 is null
begin 
	print 'deger degi�keni null'
	return
end
else
begin
	print @deger
end
if @deger2 is not null
	print @deger2

waitfor time'12:15:00'          /*kodlar� verien saat geldiginde ger�ekle�tir*/
waitfor delay '00:15:00'        /*15 dk sonra kodlar� �al��t�r*/

waitfor delay '00:00:10'        /*personel tablosunu 10 dk sonra ekrana getir*/
select *from personel

begin try                       /*hata mesaj� kullanma �rnekleri ile*/
	select 1/0
end try
begin catch                     /*try catch yap�s�*/
	select
		ERROR_NUMBER() as "hata no",          /*from ersonal yaz�lsa personal olavag�n� anlayamaz hata da veremez*/
		ERROR_SEVERITY() as �ncelik,
		ERROR_LINE() as hataSat�r�,
		ERROR_MESSAGE() as hataMesaj�
end catch

create table urunler(                     /*tablo olu�turma*/
	urun_no int not null,
    ad nvarchar(10))
    
create table fiyat(                      /*tablo olu�turma*/
	urun_no int null,
	fiyat money null)

declare @tablo varchar(20)
set @tablo ='hocalar'                    /*tablonun i�ine hocalar kelimesi atan�r*/
execute ('select *from '+@tablo)         /*select *from hocalar       olur asl�nda arka planda*/

declare @deger varchar(10)
declare @sorgu varchar(max)
set @deger='hocalar'
set @sorgu='select * from '+@deger       
execute (@sorgu)                         /*execute kullan�m� biraz daha geli�m� hali sadece*/

create procedure ortalama2(@a int=0,@b int =0)      /*ortalama isminde bir prosedur olu�turuldu*/
as
return (@a+@b)/2                                     /*prosedure nin i�lmi yap�p geri d�nderecegi i�lemler tan�t�ld�*/
go
declare @sonuc decimal(10,2)
exec @sonuc=ortalama2 10,5                           /*i�leme girecek olan verler girildi*/
print ('ortalama:'+cast(@sonuc as varchar(12)))      /*ve prosed�r �al��t�r�l�p ekrana yaz�ld�*/
/*
create procedure ogrencibul(                     /*prosedure olu�turma*/
	@numara varchar(20)=null,                   /*giri�, al�nacak deger*/
	@adi varchar(30)=null output,                /*output olanlar ��k�� verilecek degerleer*/
	@tarih smalldatetime output,
	@plaka int output) 
select *from ogrenci where no=6532518            /*�grenci bilgilerin alma*/
as
if @numara=is not null
	select @adi=adi,
		   @tarih=dogum_tarihi,
		   @plaka=memleket
	from ogrenci where no=6532518
else
	print 'verilen numaraya ait ��renci bulunamad�'
	go*/

/*
create function buyukHarf(@gelen varchar(max))
returns varchar(max)
as
begin
	return upper(@gelen)
end
select dbo.buyukHarf(adi),soyadi from ogrenci*/

create database final
create table okul(no int primary key , adi char(20) , soyadi char(20) , bolkod smallint) 
insert into okul values(12,'ali','akkaya',25)
insert into okul values(25,'ali','yerlikaya',55)

select *from okul
select adi from okul
select distinct adi,soyadi,bolkod from okul order by bolkod asc
select distinct adi,soyadi,bolkod from okul order by bolkod desc
select *from okul where bolkod<50
select *from okul where bolkod between 25 and 50

use ogrenci

select h_adi, h_soyadi,top_ders_saati from hocalar where top_ders_saati=20
select no,op_kod, from notlar where ((vize*0.4)+(final*0.6))>70         
select adi,soyadi from ogrenci where bolkod=536 order by adi asc
select no from ogrenci where dogum_tarihi between '1986.01.01' and '1986.12.31'          
select ders_adi from dersler where donem=1
select * from hocalar where top_ders_saati between 15 and 17 order by top_ders_saati desc
select no,adi from ogrenci where adi like 'a%'
SELECT * FROM ogrenci WHERE h_ID IN(7,12)
SELECT * FROM notlar WHERE no IN ( SELECT no FROM ogrenci WHERE bolkod=531)
SELECT adi, soyadi, no,h_ID FROM ogrenci WHERE h_ID IN (1,3,5,7)

select *from ogrenci where no in (select no from notlar where �d in(1,2,3,4,5,6))

select adi,soyadi,memleket*2 as memleketin_2_kat� from ogrenci where no in(select no from notlar where final =(select max(final) from notlar))
select sum(sinif)-sum(h_ID) as 'fark' from ogrenci where sinif=2;
SELECT AVG(memleket) FROM ogrenci WHERE sinif=4; 
select count(adi) from ogrenci
select count(distinct sinif) from ogrenci

select sinif,avg(memleket) from ogrenci group by sinif
select no,AVG(final) from notlar where final>50 group by no having AVG(final)>=60
select no,final from notlar group by no,final

select adi from ogrenci where no in(select no from notlar where but is null)























































































