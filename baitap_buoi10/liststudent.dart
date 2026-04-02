import 'dart:io';

import 'listperson.dart';
import 'student.dart';

class ListStudent{


  static List<Student> listStudent = [];


  //Thêm Student vô List

  static void addStudent(Student student){

    listStudent.add(student);
 
  }


//Xóa Student khỏi List
  static void deleteStudent(){
    if(listStudent.isEmpty){
    print("Chưa có Student nào");
    }else{
    showListStudent();
    int chon;
    do{
      stdout.write("Chọn id Student bạn muốn xóa: ");
      chon = int.tryParse(stdin.readLineSync()??"")??-1;
    

    for(var e in listStudent){
        if(e.id == chon){
          listStudent.remove(e);
          ListPerson.listPerson.remove(e);
          print("Đã xóa");
          break;
        }
        print("Không có student nào có id là $chon");
    }
    }while(chon < 0);
  }
    
    
    
  }



//Hiển thị List Student
  static void showListStudent(){
    for(var e in listStudent){
      e.xuatInforStudent();
    }
  }


  
}