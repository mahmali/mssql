                                        /*veri tabaný ve yönetim sisteleri final çalýþma sayfasý*/

use ogrenci

declare @sayi1 int,@sayi2 int, @toplam int
set @sayi1=10
set @sayi2=9
set @toplam=@sayi1+@sayi2
print @toplam                     /*verien iki sayýnýn toplamý bulma*/

declare @sayi3 int
select @sayi3=100
print @sayi3                     /*ayný iþlem set yerine select ileda yapýlabilir*/

declare @enyüksek int
select @enyüksek=max(final) from notlar
select @enyüksek as "en büyük not" /*printsiz böylede yazýlabilir.*/      /*hocalar tablosundaki en büyük finalý verir*/

select *from sys.sysmessages       /*verilen tüm hatalarýn listeler*/

select 5/1 /*direk böylede 4 iþlem yapýlabilir*/

delete from notlar where final>95   /*silme iþlemi kalýcýdýr ana listeden siler*/
select @@ROWCOUNT                   /*kaç tane eleman sildigini verir*/

declare @deger varchar(90)
set @deger='mýhamemd ali akkkaya'
/*go*/                              /*araya go gelir ise hata verir, go tabloyu ikiye ayýrýr çünki*/
print @deger

declare @personel table(
no int identity(1,1),
ad varchar(90) not null,
telefon varchar(15) )
insert into @personel values ('mahmlai',232323)
insert into @personel values ('mahmldfdfai',2322323323)
select *from @personel order by ad                             /*declare ile liste oluþturma ve listedeki elemanlarý gösterme*/

declare @eklenenler table(ad varchar(18),soyad varchar(38),maas money)   /*eklenenler diye tablo oluþturma*/
insert into personel                                                     /*aktarýlacak yere kalýcý olrak deger ekler*/
output inserted.ad, inserted.soyad,inserted.maas                         /*aktarýlacak degerler*/
into @eklenenler                                                         /*aktarýlacaklarýn tutuldugu yer*/
values ('eslem','pazar',88)                                              /*eklene degereler*/
select *from @eklenenler                                                 /*tablo degiþkeninin içeriginin listesi*/

declare @silinenler table(                             /*silinecek degerlerin konulacagý deger tablosu oluþturur*/
	ad varchar(20),
	soyad varchar(20),
	maas varchar (20)    )
delete from personel                                   /*silinecek tablo ismi istenir*/
	output deleted.ad,deleted.soyad,deleted.maas
	into @silinenler                                     
where maas<31                                          /*tablodaki silineceklerin þarý burada tanýlanýr*/
select *from @silinenler                               /*silinen degerleri alt tarafta gösterir*/
select count(*) from @silinenler                               /*silinen degerlerin sayýsý verir*/

/*if exists(select *from personel where maas<90
	print 'maasý 90 dan küçük olan degerler'*/            /*olmadý*/

if (select min(maas) from personel)>100                 /*verien þart*/
	print 'maasý 100 büyük olan bir maas yok'
else 
	select ad,soyad,maas from personel                  /*yazdýrýlacak kelimeler*/
	where maas<100

select count(*)from ogrenci                            /*ögrenci sayýsýný verir*/

declare @o_sayýsý int                                  /*degiþken tanýmlama*/      
select @o_sayýsý=count(*)from ogrenci                  /*degiþkene deger atama*/ 
print @o_sayýsý                                        /*degiþkeni yazdýrma*/

use okul                                                /*tablo tanýmlama*/
select isim, cinsiyet=                                  /*gösterilecek sütun listesi*/
	case cinsiyet                                       /*case iþlem yapýlacak sütun þeçme*/
		when 'E' then 'erkek'                           /*iþlem tanýmlama E leri erkek olrak degiþtirme*/
		when 'K' then 'kýz'
 	 end
from müsterilerID                                       /*iþlme yapýlacak tablo*/

use ogrenci
select ad,soyad,                       
	case	
		when maas is null then 0                        /*maasý null olan degerleri 0 yapar*/
		else maas                                       /*null degil ise diger maas degerini yazdýrýr*/
	end
from personel                                           /*iþlem ana tabloya iþlemez*/

select *from personel

update personel                                          /*update oldugu için ana listede iþlem yapar*/
set maas=(                                               /*iþlem yapýlacak sütun belirlenir*/
	case
		when maas<100 then (maas+(maas*20)/100)          /*iþlem ler*/
		when maas>100 and maas<200 then maas-((maas*15)/100)
		else maas+(maas)
	end)                                                 /*case iþlemini bitir*/
	
declare @sayac int                                       /*deger tanýmlama*/
set @sayac=1											/*degere sayý atama*/
while @sayac<=5
begin                                                   /*döngü baþlangýç noktasý belirleme*/
	print (cast(@sayac as varchar(10)) + 'karesi:' + cast(@sayac*@sayac as varchar(10)))         /*iþlemler*/
		set @sayac=@sayac+1                             /*döngü sayacýný arttýrma*/
end                                                     /*dönðüyü bitirme*/

declare @sayac smallint
set @sayac =1 
yenile:                                                     /*goto nin gidecegi deger*/
print 'sayac degeri:' + cast(@sayac as varchar(1))          /*yapýlan iþlem*/
set @sayac=@sayac+1
while @sayac<=4                                             /*dongü*/                                
	goto yenile

declare @deger int                                  /*kýsa bir örnek sadece returm mantýðýný anlamaya yönelikti*/
declare @deger2 int
set @deger=123
if @deger2 is null
begin 
	print 'deger degiþkeni null'
	return
end
else
begin
	print @deger
end
if @deger2 is not null
	print @deger2

waitfor time'12:15:00'          /*kodlarý verien saat geldiginde gerçekleþtir*/
waitfor delay '00:15:00'        /*15 dk sonra kodlarý çalýþtýr*/

waitfor delay '00:00:10'        /*personel tablosunu 10 dk sonra ekrana getir*/
select *from personel

begin try                       /*hata mesajý kullanma örnekleri ile*/
	select 1/0
end try
begin catch                     /*try catch yapýsý*/
	select
		ERROR_NUMBER() as "hata no",          /*from ersonal yazýlsa personal olavagýný anlayamaz hata da veremez*/
		ERROR_SEVERITY() as öncelik,
		ERROR_LINE() as hataSatýrý,
		ERROR_MESSAGE() as hataMesajý
end catch

create table urunler(                     /*tablo oluþturma*/
	urun_no int not null,
    ad nvarchar(10))
    
create table fiyat(                      /*tablo oluþturma*/
	urun_no int null,
	fiyat money null)

declare @tablo varchar(20)
set @tablo ='hocalar'                    /*tablonun içine hocalar kelimesi atanýr*/
execute ('select *from '+@tablo)         /*select *from hocalar       olur aslýnda arka planda*/

declare @deger varchar(10)
declare @sorgu varchar(max)
set @deger='hocalar'
set @sorgu='select * from '+@deger       
execute (@sorgu)                         /*execute kullanýmý biraz daha geliþmþ hali sadece*/

create procedure ortalama2(@a int=0,@b int =0)      /*ortalama isminde bir prosedur oluþturuldu*/
as
return (@a+@b)/2                                     /*prosedure nin iþlmi yapýp geri dönderecegi iþlemler tanýtýldý*/
go
declare @sonuc decimal(10,2)
exec @sonuc=ortalama2 10,5                           /*iþleme girecek olan verler girildi*/
print ('ortalama:'+cast(@sonuc as varchar(12)))      /*ve prosedür çalýþtýrýlýp ekrana yazýldý*/
/*
create procedure ogrencibul(                     /*prosedure oluþturma*/
	@numara varchar(20)=null,                   /*giriþ, alýnacak deger*/
	@adi varchar(30)=null output,                /*output olanlar çýkýþ verilecek degerleer*/
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
	print 'verilen numaraya ait öðrenci bulunamadý'
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

select *from ogrenci where no in (select no from notlar where ýd in(1,2,3,4,5,6))

select adi,soyadi,memleket*2 as memleketin_2_katý from ogrenci where no in(select no from notlar where final =(select max(final) from notlar))
select sum(sinif)-sum(h_ID) as 'fark' from ogrenci where sinif=2;
SELECT AVG(memleket) FROM ogrenci WHERE sinif=4; 
select count(adi) from ogrenci
select count(distinct sinif) from ogrenci

select sinif,avg(memleket) from ogrenci group by sinif
select no,AVG(final) from notlar where final>50 group by no having AVG(final)>=60
select no,final from notlar group by no,final

select adi from ogrenci where no in(select no from notlar where but is null)























































































