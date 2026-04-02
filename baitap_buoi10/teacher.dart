import 'dart:io';

import 'classroom.dart';
import 'listteacher.dart';
import 'person.dart';

class Teacher extends Person{
  String? subject = "Chưa gán";
  double? salary;


  Teacher(
   
  );


//Nhập thông tin Teacher
  @override
  void nhapInfor(){
    print("Nhập thông tin Teacher");
    super.nhapInfor();
    do{
      stdout.write("Lương: ");
    this.salary = double.tryParse(stdin.readLineSync()??"")??-1;
    }while(this.salary! <= 0);
    print("Đã thêm Teacher.");
    
  }


//Xuât thông tin Teacher
  void xuatInforTeacher(){
    print("***************************************************************************************************************************");
    print("ID: ${this.id} \tHọ và tên: ${this.name} \tTuổi: ${this.age} \tGiới tính: ${this.gender} \tLớp phụ trách: ${this.subject} \tLương: ${this.salary}");
    print("***************************************************************************************************************************");
  }


//Thêm Teacher vào Classroom
  static void addTeacherToClassroom(String? nameClassroom){
    int i = 0;
  for(var e in ListTeacher.listTeacher){
    if(e.subject == nameClassroom){
      print("Lớp này đã có Teacher phụ trách. Vui lòng xóa trước khi thêm mới.");
      i++;
    }
  }
  if(i==0){
  ListTeacher.showListTeacher();
  int chon;
  do{
    stdout.write("Mời nhập id Teacher muốn phụ trách lớp: ");
    chon = int.tryParse(stdin.readLineSync()??"")??-1;
  }while(chon <= 0);
  
  int j=0;
  for(var e in ListTeacher.listTeacher){
    if(e.id == chon){
        e.subject = nameClassroom;
        print("Đã cập nhật");
        j++;
    }
  }if(j==0){print("Không có Teacher nào có ID $chon");}
  }

}

// Xóa Teacher khỏi Classroom
static void deleteTeacherToClassroom(String? nameClassroom){
  Classroom.showTeacherInClassroom(nameClassroom);
  int chon;
  stdout.write("Chọn id Teacher bạn muốn xóa khỏi lớp: ");
  chon = int.tryParse(stdin.readLineSync()??"")??-1;
  int i = 0;
  for(var e in ListTeacher.listTeacher){
    if(e.id == chon){
      e.subject = "Đã rời lớp";
      print("Đã cập nhật");
      i++;
    }
  }
  if(i==0){print("Không có Teacher nào có ID $chon");}
}
}