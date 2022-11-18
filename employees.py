#bir şirket çalışanları verilerini tutan dosya oluşturulacak
#kullanıcıdan çalışan sayısı alınacak 
# çalışan sayısı kadar isim, soyisim, maaş bilgisi alınacak
#dosyadaki her satıra "ad soyad-maaş" kalıbında çalışan bilgileri eklenecek
#eklenen çalışanlar eski verileri silmeden alta eklenecek 
#hata yakalama işlemleri olacak 
#programın sonunda bu dosyadan bilgileri satır satır okuyup listeleyecek kod yazılacak 


employees = open("employees.txt", "a")
try:
   employeesCount = int(input("çalışan sayısı giriniz: "))
   for i in range(employeesCount):
        employeesInfo = input("çalışan adı-soyadı giriniz:")
        employeesSalary = float(input("çalışan maaş bilgisini giriniz:"))
        employees.write(f"{employeesInfo}, {employeesSalary} \n")
except ValueError:
    print("Ad-Soyad bilgisinde rakam olamaz")
    print("Maaş bilgisinde string ifade olamaz")
finally:
    print(f"{employeesInfo}  {employeesSalary}")
employees.close()

employees = open("employees.txt","r")
lines = employees.readlines() 
for line in lines:
    print(line)