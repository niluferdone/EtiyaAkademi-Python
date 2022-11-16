#  ------------  -----------------  #

baslik = "haberiniz olsun" #string
vade = 12                  #integer
faizOrani1 = 1.47           #float
faizOrani2 = 1.44
faizOrani = 1.47

print(baslik)
print(type(baslik))
print(type(vade))
print(type(faizOrani))

mesaj = "hoşgeldin"
musteriAdi = "Nilüfer"
musteriSoyadi = "Döne"
sonucMesaj = mesaj + " " + musteriAdi + " " +musteriSoyadi + "!" 

print(sonucMesaj)

sayi1 = 10
sayi2 = 20
print(sayi1 + sayi2)


#  -------------  -----------------  #

#if-else (şart blokları)#

dolarDun = 7.95
dolarBugun = 7.75

if dolarDun > dolarBugun :
    print("azalış oku")
    print("Bitti")
elif dolarDun < dolarBugun :
    print("artış oku")
else :
    print("eşittir oku")     

print("Bitti")

#if dolarDun < dolarBugun :
    #print("artış oku")

#if dolarDun == dolarBugun :
    #print("eşittir oku")        


#  --------------  -----------------  #

#Bölüm Ödevi 1 #
# 2 adet sayısal değişken tanımlayınız. Bu sayılara istediğiniz değeri atayınız. Bu sayılardan hangisi büyükse, ekrana yazdırınız.

number1 = 27
number2 = 48 

if number1 > number2 : 
    print("1.sayı, 2.sayıdan büyüktür.")
elif number1 < number2 :
    print("2.sayı, 1.sayıdan büyüktür.")
else:         
    print("iki sayı birbirine eşittir.")


#  -------------  -----------------  #

#Bölüm Ödevi 2#
# 3 adet sayısal değişken tanımlayınız. Bu sayılardan en büyük ve en küçük olanı ekrana ayrı ayrı yazdırınız. 

arr = []
adet = int(input('kaç sayı girilecek: '))
for n in range(adet):
    sayi = int(input('Sayıyı Gir: '))
    arr.append(sayi)

en_kucuk = min(arr)
en_buyuk = max(arr)

print("en büyük sayı :", en_buyuk, 
      "en küçük sayı :", en_kucuk)