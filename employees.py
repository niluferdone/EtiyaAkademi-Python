#bir şirket çalışanları verilerini tutan dosya oluşturulacak
#kullanıcıdan çalışan sayısı alınacak 
# çalışan sayısı kadar isim, soyisim, maaş bilgisi alınacak
#dosyadaki her satıra "ad soyad-maaş" kalıbında çalışan bilgileri eklenecek
#eklenen çalışanlar eski verileri silmeden alta eklenecek 
#hata yakalama işlemleri olacak 
#programın sonunda bu dosyadan bilgileri satır satır okuyup listeleyecek kod yazılacak 


employees = open("employees.txt", "a+")
try:
   employeesCount = int(input("çalışan sayısı giriniz: "))
   for i in range(employeesCount):
        employeesName =input(f"{i+1}. çalışanın adını giriniz: ")
        employeesLastName =input(f"{i+1}. çalışanın soyadını giriniz: ")
        employeesSalary = float(input(f"{i+1}. çalışanın maaş bilgisini giriniz:"))
        employees.write(f"{employeesName} {employeesLastName} - {employeesSalary} \n")
except ValueError:
    print("Ad-Soyad bilgisinde rakam olamaz")
    print("Maaş bilgisinde string ifade olamaz")
employees.seek(0)
print(employees.read())
employees.close()