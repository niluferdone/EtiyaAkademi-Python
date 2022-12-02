-- Sepetinde o an en az 5 ürün olan customerları listeleyiniz.

select c.name as "Müşteri Adı", c.surname as "Müşteri Soyadı", count(*) as "Müşteri Sayısı" from customers as c
inner join orders as o
on c.id = o.customer_id 
inner join order_details as od
on o.id = od.order_id 
group by c.name, c.surname
having count(*)>=5

-- Bugüne kadar verdiği sipariş toplamı 2000₺'yi geçen customerları listeleyiniz.

select c.name as "Müşteri Adı", c.surname as "Müşteri Soyadı", sum(od.order_total_price) as "Tutar", count(*) as "Müşteri Sayısı" from customers as c
inner join orders as o
on c.id = o.customer_id 
inner join order_details as od
on o.id = od.order_id 
group by c.name, c.surname, od.order_total_price
having  od.order_total_price> 2000

-- Her kategoride en çok kazandıran ürünü (price * quantity değeri ele alınmalıdır) listeleyiniz.

select  c.name,  MAX(p.unit_price * p.stock) as "Toplam Fiyat" from products p
inner join categories c
on p.category_id = c.id
group by c.name

-- Satıcıları sattığı ürün adedine göre büyükten küçüğe sıralayınız.

select * from sellers 
order by sales_quantity desc

-- Siparişleri içerdiği ürün adedine göre listeleyiniz.

select order_id as "Sipariş Kodu", SUM(quantity) as "Ürün Adedi" from order_details
group by order_id
order by SUM(quantity) desc

-- En çok kullanılan kargo şirketlerini kullanıldığı sipariş veya sipariş ürünü adedi ile birlikte listeleyiniz.

select o.cargo_company_id as "Kargo Şirketi", sum(od.quantity) as "Sipariş Ürün Adedi" from orders as o 
inner join order_details as od 
on o.id = od. order_id 
group by o.id 

-- Ürün bilgilerini içerisinde kategori,renk,beden,satıcı,kaç adet satıldı, kaç para kazandırdı bilgileri ile listeleyiniz.

select p.name "Ürün İsmi", ct.type "Kategori", c.name "Renk", s.name "Beden",  sum(od.quantity) "Toplam Satılan Adet", sum(od.order_total_price) "Toplam Kazanılan Para" from products  as p
inner join categories as ct
on p.category_id = ct.id
inner join product_color as pc
on p.id = pc.product_id
inner join colors c
on pc.color_id = c.id
inner join product_size as ps
on p.id = ps.product_id
inner join sizes as s
on ps.size_id = s.id
inner join order_details od
on p.id = od.product_id
group by p.name, ct.type, c.name, s.name
order by sum(od.order_total_price), sum(od.quantity)

-- Girilen Ülke için kaç adet şehir olduğunu,

select count(*) as "Şehir Sayısı", co.name as "Ülke Adı" from countries as co
inner join cities as ci
on co.id = ci.country_id 
group by co.name


-- Girilen şehir için kaç adet ilçe olduğunu,

select count(*) as "Cadde Sayısı", d.name as "İlçe Adı" from districts as d
inner join streets s 
on d.id = s.district_id
group by d.name


-- Girilen ilçe için kaç adet mahalle olduğunu listeleyiniz. 

select d.name as "Mahalle Adı", count(*) from districts as d 
inner join streets as s 
on d.id = s.district_id
group by d.id


