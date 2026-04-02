import 'dart:io';

import 'listclassroom.dart';
import 'liststudent.dart';
import 'listteacher.dart';



class Classroom{
  int? id;
  String? name;
  int quantityStudent = 0;
  String? nameTeacher = "Chưa có";

  Classroom(
  );



  //Tạo Classroom
   void nhapInforClassroom(){
    do{
      stdout.write("ID: ");
    this.id = int.tryParse(stdin.readLineSync()??"")??-1;
    for(var e in ListClassroom.listClassroom){
      if(e.id == this.id){
        print("ID đã tồn tại. Mời nhập ID khác.");
        this.id = -1;
      }
    }
    }while(this.id! <= 0);

    do{
      stdout.write("Name: ");
    this.name = (stdin.readLineSync()??"").trim();
    }while(this.name =="");
    print("Đã thêm classroom");
    
    }


  // Hiển thị Classroom
    void xuatInforClassroom(){
      this.quantityStudent = 0;
      countQuantityStudent();
      findNameTeacher();
      print("===================================================================================================================");
      print("ID: ${this.id} \tName: ${this.name} \tQuantityStudents: ${this.quantityStudent} \tName Teacher: ${this.nameTeacher}");
      print("===================================================================================================================");
    }


    //Hiển thị danh sách Student trong Classroom
 static void showStudentInClassroom(String? name){
      print("Danh sách sinh viên trong lớp ${name}");
      int i=0;
      for(var e in ListStudent.listStudent){
        if(e.grade == name){
          i++;
          e.xuatInforStudent();
        }
        
        }
        if(i==0){print("\tChưa có ai");}
    }
    


    //Hiển thị Teacher trong Classroom
  static void showTeacherInClassroom(String? name){
      print("Giáo viên phụ trách lớp ${name}");
      int i = 0;
      for(var e in ListTeacher.listTeacher){
        
        if(e.subject == name){
          i++;
          e.xuatInforTeacher();

        }
        
      }
      if(i==0){print ("\tChưa có ai");}
    }



// Đếm số lượng Student trong Classroom
    void countQuantityStudent(){
      for(var e in ListStudent.listStudent){
        if(e.grade == this.name){
          this.quantityStudent++;
        }
      }
    }

// Tìm tên Teacher cho Classroom
    void findNameTeacher(){
      for(var e in ListTeacher.listTeacher){
        if(e.subject == this.name){
          this.nameTeacher = e.name;
        }
      }
    }
}