
dersSayisi = input("ders Sayısı:")
top= 0 
for i in range(9):
    vize = int(input("{0}. Vize Notu : ".format(i)))
    top+= vize
    vizeOrt = top/i
top2= 0
for i in range(9):
    final = int(input("{0}. Final Notu : ".format(i)))
    top2+= final
    finalOrt = top2/i

print("Vize ortalaması:" , vizeOrt)
print("Final ortalaması: ", finalOrt)

sonuc = float(vizeOrt)*(0.4) + float(finalOrt)*(0.6)
if sonuc > 50 : 
    print("Geçtiniz")
else: 
    print("Kaldınız")       



