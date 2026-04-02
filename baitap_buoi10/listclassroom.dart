import 'dart:io';
import 'classroom.dart';
import 'liststudent.dart';
import 'listteacher.dart';


class ListClassroom{



  static List<Classroom> listClassroom = [];



//Thêm Classroom vào List
 static void addClassroom(Classroom classroom){
    listClassroom.add(classroom);
}

 
//  Xóa Classroom khỏi List
 static void deleteClassroom(){
  if(listClassroom.isEmpty){
    print("Chưa có lớp học nào");
  }else{
  showListClassroom();
  int chon;
  stdout.write("Chọn id Classroom bạn muốn xóa: ");
  chon = int.tryParse(stdin.readLineSync()??"")??-1;
    int i = 0;
    for(var classroom in listClassroom){
      if(classroom.id==chon){
      

    
          
    for(var student in ListStudent.listStudent){
      if(student.grade == classroom.name){
        student.grade = "Classroom đã xóa";
      }
    }
    for(var teacher in ListTeacher.listTeacher){
      if(teacher.subject == classroom.name){
        teacher.subject = "Classroom đã xóa";
      }
    }
    print("Đã xóa.");

   
  i++;

  
    
    
    }
    
    }
    listClassroom.removeWhere((e) => e.id == chon);
    if(i==0){
      print("Không có lớp học nào có ID $chon");
    }
    
    
    
  }

  
}
    
    
 // Hiển thị List Classroom 
  static void showListClassroom(){
      for(var e in listClassroom){
        e.xuatInforClassroom();
      }
    }


//Hiển thị chi tiết 1 Classroom
static  String? showClassroomById(){
    if(listClassroom.isEmpty){
      print("Chưa có lớp học nào");
    }else{
    showListClassroom();
    int chon;
    do{
      stdout.write("Mời nhập vào id Classroom muốn xem chi tiết thông tin: ");
    chon = int.tryParse(stdin.readLineSync()??"")??-1;
    }while(chon <= 0);
    int i = 0;
    for(var e in listClassroom){
      if(e.id == chon){
        e.countQuantityStudent();
        e.findNameTeacher();
        e.xuatInforClassroom();
        Classroom.showStudentInClassroom(e.name);
        Classroom.showTeacherInClassroom(e.name);
        i++;
        return e.name;
        




    
      }
    }
    if(i==0){
    print("Không có Classroom nào có ID $chon");
    
    }
    }
    return null;
  }
  
}