#kullanıcıdan vize ve final notları alınacak
#kullanıcıdan alınan vize ve final notları listelenecek

lessonCount = 0
while lessonCount <=0 or lessonCount > 10:
    lessonCount = int(input("kaç derse ait not gireceksiniz? "))

passedExams = 0
failedExams = 0

passedLesson = []
failedLesson = []

for i in range(lessonCount):
    midtermExam = float(input(f"{i+1}. ders için vize notunu giriniz: "))
    finalExam = float(input(f"{i+1}. ders için final notunu giriniz: "))
    examResult = (midtermExam * 0.4) + (finalExam * 0.6)
    
    if examResult >= 50 :
        passedExams += 1
        passedLesson.append(examResult)
    else:
        failedLesson.append(examResult)
 
print(f"Başarılı olunan ders sayısı: {passedExams}")
print(f"Başarısız olunan ders sayısı: {lessonCount - passedExams}")
print(f"Başarılı olunan derslerin notu :{passedLesson}")
print(f"Başarısız olunan derslerin notu: {failedLesson}")
