#1.kullanıcı gireceği ders sayısını belirtecek
lessonCount = 0
while lessonCount <=0 or lessonCount > 10:
    lessonCount = int(input("kaç adet ders notu gireceksiniz? "))

#2. girilen ders sayısı kadar 2 adet soru sorulacak
# (ders için vize notu giriniz, final notu giriniz)
#girilen notlar float olabilir 

passedExams = 0
failedExams = 0
for i in range(lessonCount):
    Exam1 = float(input(f"{i+1}. ders için vize notunu giriniz: "))
    Exam2 = float(input(f"{i+1}. ders için final notunu giriniz: "))
    totalNote = (Exam1 * 0.4)+ (Exam2 * 0.6)

    if totalNote >= 50:
        passedExams += 1
    else:
        failedExams += 1
         
print(f"{passedExams} dersten geçtiniz, {failedExams} dersten kaldınız.")
