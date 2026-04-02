import 'dart:io';
import 'classroom.dart';
import 'liststudent.dart';
import 'person.dart';

class Student extends Person{
String? grade = "Chưa gán";
double? score;

Student(
 
);

//Nhập thông tin Student
@override
 void nhapInfor(){

  print("Nhập thông tin Student");
  super.nhapInfor();
  do{
  stdout.write("Điểm số: ");
  this.score = double.tryParse(stdin.readLineSync()??"")??-1;
  }while(this.score! <= 0);
  print("Đã thêm Student.");


}



//Xuất thông tin Student
void xuatInforStudent(){

  print("--------------------------------------------------------------------------------------");
  print("ID: ${this.id} \tHọ và tên: ${this.name} \tTuổi: ${this.age} \tGiới tính: ${this.gender} \tLớp học: ${this.grade} \tĐiểm: ${this.score}");
  print("--------------------------------------------------------------------------------------");
}

//Thêm Student vào Classroom
static void addStudentToClassroom(String? nameClassroom){
  ListStudent.showListStudent();
  int chon;
  do{
    stdout.write("Mời chọn id Student muốn đưa vào lớp: ");
    chon = int.tryParse(stdin.readLineSync()??"")??-1;
  }while(chon <= 0);
  
  int i = 0;
  for(var e in ListStudent.listStudent){
    if(e.id == chon){
        e.grade = nameClassroom;
        print("Đã cập nhật");
        i++;
    }
  }
  if(i == 0){print("Không có Student nào có ID $chon");}
}



// Xóa Student khỏi Classroom
static void deleteStudentToClassroom(String? nameClassroom){
  Classroom.showStudentInClassroom(nameClassroom);
  int chon;
  do{
    stdout.write("Chọn id Student muốn xóa khỏi lớp: ");
  chon = int.tryParse(stdin.readLineSync()??"")??-1;
  }while(chon <= 0);
  

  int i=0;
  for(var e in ListStudent.listStudent){
    if(e.id == chon){
      e.grade = "Đã rời lớp";
      i++;
      print("Đã cập nhật");
    }
  }
  if(i==0){print ("Không có Student nào có ID $chon");}

}






}