
# kullanıcıdan vize ve final notları alacak
# vize %40 final %60 etkili olacak 
# vize ve final notları 50.5 gibi ondalıklı sayılar olabilir 
# 0-49 ff
# 50-60 dd
# 60-70 cc
# 70-80 bb
# 80-100 aa 

vize = input("Vize:")
final = input("Final:")
 
sonuc = float(vize)*(0.4) + float(final)*(0.6)
if sonuc>=80 and sonuc<100:
    print("Harf Notu: AA")
elif sonuc>=70 and sonuc<80:
    print("Harf Notu: BB")
elif sonuc>=60 and sonuc<70:
    print("Harf Notu: CC")
elif sonuc>=50 and sonuc<60:
    print("Harf Notu: DD")
elif sonuc>=0 and sonuc<50:
    print("Harf Notu: FF")
print ("Ortalama") 
print (sonuc)
