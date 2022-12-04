--1) Kargo şirketlerine toplam kaç para ödendiğini hesaplayınız. 

--I.yöntem --

select cc.name as "Kargo Adı", sum(order_total_price) as "Toplam Tutar" from order_details as od
inner join orders as o
on od.order_id = o.id
inner join cargo_companies as cc
on o.cargo_company_id = cc.id
group by cc.name, od.order_total_price

--II.yöntem --

select cc.name as "Kargo Adı", sum(cargo_price) as "Toplam Tutar" from cargo_companies as cc
group by cc.name




--2) Halihazırda indirimli ve isminde 'b' geçen tüm ürünleri listeleyiniz.

select name as "Ürün Adı", unit_price as "Ürün Fiyatı", discount_price as "Ürünün İndirimli Fiyatı" from products
where discount_price>0 and name like '%b%'




--3) 3. harfi c olan tüm ürünleri listeleyiniz.

select * from products
where name like '__c%'



--4) Bir kişinin sipariş oluştururken kullanacağı insert komutlarını yazınız (alt tablolar dahil ve siparişte en az 3 ürün olacak şekilde)

insert into orders(customer_id, cargo_company_id, shipping_address_id, invoice_address_id) 
values 
('4', '2', '2','2'), 
('5', '5', '1','1'), 
('6', '4', '1','1');



-- 5) Sipariş oluşturduktan sonra sepeti boşaltacak update komutlarını oluşturunuz.

insert into order_details(order_number,quantity,product_id,order_id,order_total_price)
	values(2,50,7,3,500);
	update baskets set total_price = NULL where is_go_order = TRUE;
	update baskets set product_id = NULL where is_go_order = TRUE;
	update baskets set customer_id = NULL where is_go_order = TRUE;
	
	delete from baskets
	where total_price = null and product_id = null and customer_id = null;


--6) İndirim halindeki ürünlerin indirim uygulanmış fiyatlarıyla listelenmesini sağlayınız.
 
 select name as "Ürün Adı", unit_price as "Ürün Fiyatı", discount as "İndirim Oranı", discount_price as "İndirimli Fiyat" from products 
 group by name, discount, discount_price, unit_price
 order by discount_price desc


--7) Kullanıcı bir ürünü review ettiğinde (puanladığında) oluşacak insert komutunu geliştiriniz.

--1.yöntem
insert into products(name, unit_price, stock, category_id,rating) values('saat', '850', '100', 2, 6.8) 

--2.yöntem
insert into products(name,unit_price,stock,category_id,rating) values ('beyaz elbise','600',60,1,'6');

select AVG(rating) as "Ürün Puanı" from products
where name='beyaz elbise'


--8) Kullanıcı bir ürün iade etmek istediğinde oluşacak insert komutunu geliştiriniz.

insert into order_returns (total_price, order_detail_id, number_of_returns) values (700,5,1)



--9) İade durumları değiştiğinde oluşacak update komutunu geliştiriniz.

update refund set refund_message = 'iade red edildi'
	where id = 2

select r.refund_message as "Mesaj", o.total_price as "İade Edilecek Tutar", o.order_detail_id as "İade Edilen Ürün " from refund as r 
inner join order_returns as o
on r.order_return_id = o.id



--10) Satıcı ürünü güncellemek istediğinde oluşacak örnek bir update komutu geliştiriniz.

update products 
set unit_price = '250' 
where id = 11;



-- 11) Sipariş durumu (kargoda,taşımada vs) değiştiğinde tabloda değişikliği yapacak update komutunu geliştiriniz.

--1.yöntem

select cu.name, cc.cargo_details from shippers as s
inner join cargo_companies as cc
on s.cargo_company_id = cc.id 
inner join orders as o 
on o.cargo_company_id = cc.id
inner join customers as cu
on cu.id = o.customer_id 
group by cu.name, cc.cargo_details

--2. yöntem

update cargo_companies
set cargo_details = 'Sipariş Teslim edildi.'
where id=1;




--12) Kullanıcı sepete ürün eklediğinde oluşacak insert komutunu geliştiriniz.

insert into baskets(total_price, product_id, customer_id, quantity) values (700.00, 5, 1,50);



-- 13) Kullanıcı sepetteki ürün adetini artırdığında oluşacak komutu geliştiriniz.

update baskets 
set quantity = 70
where id=12 


--14) En az bir sipariş vermiş ancak hiç "MNG Kargo" kullanmamış müşterileri listeleyiniz.

Select distinct * from cargo_companies as ca
inner join order_returns as ord
on ca.id = ord.order_detail_id
inner join order_details as od
on ord.id = od.order_id
inner join orders as o
on od.id = o.customer_id
inner join customers cu
on o.customer_id = cu.id
where not ca.name = 'mng'


--15)En az bir adet aynı üründen 10+ sipariş vermiş kullanıcıları ve ürünü listeleyiniz

select c.name as "Müşteri Adı", c.surname as "Müşteri Soyadı", p.name as "Aldıgı ürün" ,
count(*) as "Alınan Aynı Ürün Sayısı" from customers as c
inner join orders as o
on c.id = o.customer_id 
inner join order_details as od
on o.id = od.order_id 
inner join products as p
on od.product_id = p.id 
group by c.name, c.surname, p.name
having count(*)>=10


-- 16)Onaylanmamış ödemeleri listeleyiniz.

--1.yöntem

select c.name as "Müşteri Adı", p.payment_description as "Ödeme Durumu", o.id as "Sipariş Numarası", b.id as "Sepet Numarası" from payments as p 
inner join orders as o 
on p.order_id = o.id
inner join order_details as od
on o.id = od.order_id
inner join products as pr
on pr.id = od.product_id
inner join baskets as b
on pr.id = b.product_id
inner join customers as c
on b.customer_id = c.id 
where p.payment_description = 'ödeme onaylanmadı'

--2.yöntem
select payment_description from payments 
where payment_description = 'ödeme onaylanmadı'


--17) En az 2 farklı ülkede adresi olan kullanıcıları listeleyiniz.

select c.name as "Müşteri Adı", c.surname "Müşteri Soyadı", co.name as "Ülke Adı", count(*) as "Ülke Sayısı" from customers as c
inner join addresses as ad
on c.id = ad.customer_id
inner join countries as co
on ad.id = co.address_id
group by c.name, c.surname, co.name
having count(c.name)>=2



-- 18)EN az 2 farklı şehirde adresi olan ve bu adreslere en az 1 adet sipariş vermiş kullanıcıları listeleyiniz.

select c.name as "Müşteri Adı", c.surname as "Müşteri Soyadı", o.id as "Sipariş Numarası", 
count(*) as "Farklı Şehir Adedi" from customers as c
inner join addresses as a
on c.id = a.customer_id 
inner join orders as o
on c.id = o.customer_id
group by c.name, c.surname , o.id
having count(*)>=2



--19) Eklenmiş ancak hiç bir siparişte kullanılmamış adresleri listeleyiniz.
select c.name as "Müşteri Adı", c.surname as "Müşteri Soyadı", co.name as "Ülke Adı", ci.name as "Şehir Adı", d.name as "Mahalle Adı", s.name as "Sokak Adı" from customers as c 
inner join addresses as a 
on c.id= a.customer_id
inner join countries as co 
on a.id = co.address_id
inner join cities as ci 
on co.id= ci.country_id
inner join districts as d 
on ci.id = d.city_id
inner join streets as s
on d.id = s.district_id 
left join orders as o 
on c.id = o.customer_id 
where o.id is null



