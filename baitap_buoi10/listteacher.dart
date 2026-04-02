import 'dart:io';

import 'listperson.dart';
import 'teacher.dart';

class ListTeacher{


  static List<Teacher> listTeacher = [];



//Thêm Teacher vô List
  static void addTeacher(Teacher teacher){
    listTeacher.add(teacher);
  }




//Xóa Teacher khỏi List
  static void deleteTeacher(){
    if(listTeacher.isEmpty){
      print("Chưa có Teacher nào");
    }else{
    showListTeacher();
    int chon;
    do{
      stdout.write("Chọn id Teacher bạn muốn xóa: ");
    chon = int.tryParse(stdin.readLineSync()??"")??-1;
    for(var e in listTeacher){
      if(e.id == chon){
        listTeacher.remove(e);
        ListPerson.listPerson.remove(e);
        print("Đã xóa");
        break;
      }
      print("Không có Teacher nào có id là $chon");
    }
    }while(chon < 0);
    }
   
    

  }




//Hiển thị List Teacher
  static void showListTeacher(){
    for(var e in listTeacher){
      e.xuatInforTeacher();
    }
  }
}