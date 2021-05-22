                                
use ogrenci

declare @sayi1 int,@sayi2 int, @toplam int
set @sayi1=10
set @sayi2=9
set @toplam=@sayi1+@sayi2
print @toplam                     /*verien iki sayının toplamı bulma*/

declare @sayi3 int
select @sayi3=100
print @sayi3                     /*aynı işlem set yerine select ileda yapılabilir*/

declare @enyüksek int
select @enyüksek=max(final) from notlar
select @enyüksek as "en büyük not" /*printsiz böylede yazılabilir.*/      /*hocalar tablosundaki en büyük finalı verir*/

select *from sys.sysmessages       /*verilen tüm hataların listeler*/

select 5/1 /*direk böylede 4 işlem yapılabilir*/

delete from notlar where final>95   /*silme işlemi kalıcıdır ana listeden siler*/
select @@ROWCOUNT                   /*kaç tane eleman sildigini verir*/

declare @deger varchar(90)
set @deger='mıhamemd ali akkkaya'
/*go*/                              /*araya go gelir ise hata verir, go tabloyu ikiye ayırır çünki*/
print @deger

declare @personel table(
no int identity(1,1),
ad varchar(90) not null,
telefon varchar(15) )
insert into @personel values ('mahmlai',232323)
insert into @personel values ('mahmldfdfai',2322323323)
select *from @personel order by ad                             /*declare ile liste oluşturma ve listedeki elemanları gösterme*/

declare @eklenenler table(ad varchar(18),soyad varchar(38),maas money)   /*eklenenler diye tablo oluşturma*/
insert into personel                                                     /*aktarılacak yere kalıcı olrak deger ekler*/
output inserted.ad, inserted.soyad,inserted.maas                         /*aktarılacak degerler*/
into @eklenenler                                                         /*aktarılacakların tutuldugu yer*/
values ('eslem','pazar',88)                                              /*eklene degereler*/
select *from @eklenenler                                                 /*tablo degişkeninin içeriginin listesi*/

declare @silinenler table(                             /*silinecek degerlerin konulacagı deger tablosu oluşturur*/
	ad varchar(20),
	soyad varchar(20),
	maas varchar (20)    )
delete from personel                                   /*silinecek tablo ismi istenir*/
	output deleted.ad,deleted.soyad,deleted.maas
	into @silinenler                                     
where maas<31                                          /*tablodaki silineceklerin şarı burada tanılanır*/
select *from @silinenler                               /*silinen degerleri alt tarafta gösterir*/
select count(*) from @silinenler                               /*silinen degerlerin sayısı verir*/

/*if exists(select *from personel where maas<90
	print 'maası 90 dan küçük olan degerler'*/            /*olmadı*/

if (select min(maas) from personel)>100                 /*verien şart*/
	print 'maası 100 büyük olan bir maas yok'
else 
	select ad,soyad,maas from personel                  /*yazdırılacak kelimeler*/
	where maas<100

select count(*)from ogrenci                            /*ögrenci sayısını verir*/

declare @o_sayısı int                                  /*degişken tanımlama*/      
select @o_sayısı=count(*)from ogrenci                  /*degişkene deger atama*/ 
print @o_sayısı                                        /*degişkeni yazdırma*/

use okul                                                /*tablo tanımlama*/
select isim, cinsiyet=                                  /*gösterilecek sütun listesi*/
	case cinsiyet                                       /*case işlem yapılacak sütun şeçme*/
		when 'E' then 'erkek'                           /*işlem tanımlama E leri erkek olrak degiştirme*/
		when 'K' then 'kız'
 	 end
from müsterilerID                                       /*işlme yapılacak tablo*/

use ogrenci
select ad,soyad,                       
	case	
		when maas is null then 0                        /*maası null olan degerleri 0 yapar*/
		else maas                                       /*null degil ise diger maas degerini yazdırır*/
	end
from personel                                           /*işlem ana tabloya işlemez*/

select *from personel

update personel                                          /*update oldugu için ana listede işlem yapar*/
set maas=(                                               /*işlem yapılacak sütun belirlenir*/
	case
		when maas<100 then (maas+(maas*20)/100)          /*işlem ler*/
		when maas>100 and maas<200 then maas-((maas*15)/100)
		else maas+(maas)
	end)                                                 /*case işlemini bitir*/
	
declare @sayac int                                       /*deger tanımlama*/
set @sayac=1											/*degere sayı atama*/
while @sayac<=5
begin                                                   /*döngü başlangıç noktası belirleme*/
	print (cast(@sayac as varchar(10)) + 'karesi:' + cast(@sayac*@sayac as varchar(10)))         /*işlemler*/
		set @sayac=@sayac+1                             /*döngü sayacını arttırma*/
end                                                     /*dönğüyü bitirme*/

declare @sayac smallint
set @sayac =1 
yenile:                                                     /*goto nin gidecegi deger*/
print 'sayac degeri:' + cast(@sayac as varchar(1))          /*yapılan işlem*/
set @sayac=@sayac+1
while @sayac<=4                                             /*dongü*/                                
	goto yenile

declare @deger int                                  /*kısa bir örnek sadece returm mantığını anlamaya yönelikti*/
declare @deger2 int
set @deger=123
if @deger2 is null
begin 
	print 'deger degişkeni null'
	return
end
else
begin
	print @deger
end
if @deger2 is not null
	print @deger2

waitfor time'12:15:00'          /*kodları verien saat geldiginde gerçekleştir*/
waitfor delay '00:15:00'        /*15 dk sonra kodları çalıştır*/

waitfor delay '00:00:10'        /*personel tablosunu 10 dk sonra ekrana getir*/
select *from personel

begin try                       /*hata mesajı kullanma örnekleri ile*/
	select 1/0
end try
begin catch                     /*try catch yapısı*/
	select
		ERROR_NUMBER() as "hata no",          /*from ersonal yazılsa personal olavagını anlayamaz hata da veremez*/
		ERROR_SEVERITY() as öncelik,
		ERROR_LINE() as hataSatırı,
		ERROR_MESSAGE() as hataMesajı
end catch

create table urunler(                     /*tablo oluşturma*/
	urun_no int not null,
    ad nvarchar(10))
    
create table fiyat(                      /*tablo oluşturma*/
	urun_no int null,
	fiyat money null)

declare @tablo varchar(20)
set @tablo ='hocalar'                    /*tablonun içine hocalar kelimesi atanır*/
execute ('select *from '+@tablo)         /*select *from hocalar       olur aslında arka planda*/

declare @deger varchar(10)
declare @sorgu varchar(max)
set @deger='hocalar'
set @sorgu='select * from '+@deger       
execute (@sorgu)                         /*execute kullanımı biraz daha gelişmş hali sadece*/

create procedure ortalama2(@a int=0,@b int =0)      /*ortalama isminde bir prosedur oluşturuldu*/
as
return (@a+@b)/2                                     /*prosedure nin işlmi yapıp geri dönderecegi işlemler tanıtıldı*/
go
declare @sonuc decimal(10,2)
exec @sonuc=ortalama2 10,5                           /*işleme girecek olan verler girildi*/
print ('ortalama:'+cast(@sonuc as varchar(12)))      /*ve prosedür çalıştırılıp ekrana yazıldı*/
/*
create procedure ogrencibul(                     /*prosedure oluşturma*/
	@numara varchar(20)=null,                   /*giriş, alınacak deger*/
	@adi varchar(30)=null output,                /*output olanlar çıkış verilecek degerleer*/
	@tarih smalldatetime output,
	@plaka int output) 
select *from ogrenci where no=6532518            /*ögrenci bilgilerin alma*/
as
if @numara=is not null
	select @adi=adi,
		   @tarih=dogum_tarihi,
		   @plaka=memleket
	from ogrenci where no=6532518
else
	print 'verilen numaraya ait öğrenci bulunamadı'
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

select *from ogrenci where no in (select no from notlar where ıd in(1,2,3,4,5,6))

select adi,soyadi,memleket*2 as memleketin_2_katı from ogrenci where no in(select no from notlar where final =(select max(final) from notlar))
select sum(sinif)-sum(h_ID) as 'fark' from ogrenci where sinif=2;
SELECT AVG(memleket) FROM ogrenci WHERE sinif=4; 
select count(adi) from ogrenci
select count(distinct sinif) from ogrenci

select sinif,avg(memleket) from ogrenci group by sinif
select no,AVG(final) from notlar where final>50 group by no having AVG(final)>=60
select no,final from notlar group by no,final

select adi from ogrenci where no in(select no from notlar where but is null)























































































