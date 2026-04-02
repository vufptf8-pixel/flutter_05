import 'dart:io';
import 'classroom.dart';
import 'listclassroom.dart';
import 'liststudent.dart';
import 'listteacher.dart';
import 'listperson.dart';
import 'student.dart';
import 'teacher.dart';

void main(){
  int chon;
  do{
  print("MENU QUẢN LÝ TRƯỜNG HỌC");
  print("1. Danh sách sinh viên \n2. Danh sách Giáo viên \n3. Danh sách Lóp học \n4. Toàn bộ danh sách \n5. Thoát");
  
  
  stdout.write("Mời chọn: ");
  chon = int.tryParse(stdin.readLineSync()??"")??-1;
  
  switch(chon){
    case 1:
    if(ListStudent.listStudent.isEmpty){
      print("Danh sách trống");
    }else{
      ListStudent.showListStudent();
    }
    int luachon;
    do{
      print("1. Thêm Student \t2. Xóa Student  \t3. Trở về");
    stdout.write("Mời chọn: ");
    luachon = int.tryParse(stdin.readLineSync()??"")??-1;
    
    if(luachon == 1){
      Student student = Student();
      student.nhapInfor();
      ListStudent.addStudent(student);
      ListPerson.addPerson(student);
    }
    if(luachon == 2){
      ListStudent.deleteStudent();
    }
    if(luachon == 3){
      break;
    }
    }while(luachon != 3);
    case 2:
    if(ListTeacher.listTeacher.isEmpty){
      print("Danh sách trống");
    }else{
      ListTeacher.showListTeacher();
    }
    int luachon;

    do{
    print("1. Thêm Teacher \t2. Xóa Teacher  \t3. Trở về");
    stdout.write("Mời chọn: ");
    luachon = int.tryParse(stdin.readLineSync()??"")??-1;
    
    
    
    if(luachon == 1){
      Teacher teacher = Teacher();
      teacher.nhapInfor();
      ListTeacher.addTeacher(teacher);
      ListPerson.addPerson(teacher);
    }
    if(luachon == 2){
      ListTeacher.deleteTeacher();
    }
    if(luachon == 3)

    break;
    }while(luachon != 3);
    case 3:
    if(ListClassroom.listClassroom.isEmpty){
      print("Chưa có lớp học nào");
    }else{
      ListClassroom.showListClassroom();
    }
    int luachon;
    do{
      print("1. Thêm lớp học \t2. Xóa lớp học \t3. Xem thông tin lớp học \t4. Trở về");
    stdout.write("Mời chọn: ");
    luachon = int.tryParse(stdin.readLineSync()??"")??-1;
    if(luachon==1){
      Classroom classroom = Classroom();
      classroom.nhapInforClassroom();
      ListClassroom.addClassroom(classroom);
    }
    if(luachon==2){
      ListClassroom.deleteClassroom();
    }
    if(luachon==3){
      String? nameClassroom = ListClassroom.showClassroomById();
      if(nameClassroom == null){continue;}
      int select;
      do{
        
      print("1. Thêm Student vào lớp \t2. Thêm Teacher vào lớp \t3. Xóa Student khỏi lớp \t4. Xóa Teacher khỏi lớp \t5. Trở về");
      stdout.write("Mời chọn: ");
      select = int.tryParse(stdin.readLineSync()??"")??-1;
      if(select == 1){
        Student.addStudentToClassroom(nameClassroom);
      }
      if(select == 2){
        Teacher.addTeacherToClassroom(nameClassroom);
      }
      if(select == 3){
        Student.deleteStudentToClassroom(nameClassroom);
      }
      if(select == 4){
        Teacher.deleteTeacherToClassroom(nameClassroom);
      }
      if(select == 5){
        break;
      }
      }while(select != 5);
      



    }
    if(chon==4){
      break;
    }
    }while(luachon != 4);
    


    break;
    case 4:
      ListPerson.showListPerson();


    break;
    case 5:
    break;
  }
  }while(chon != 5);
  







}