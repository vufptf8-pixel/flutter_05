import 'dart:io';
import 'listperson.dart';
import 'student.dart';
import 'teacher.dart';

class Person{

int? id;
String? name;
int? age;
String? gender;

Person(
 
);

@override
String toString(){
  return "ID : $id\t Họ và tên: $name\t Tuổi: $age\t Giới tính: $gender";

  
}



//Phần nhập thông tin chung để Student và Teacher kế thừa
void nhapInfor(){

   do{
    stdout.write("ID: ");
  this.id = int.tryParse(stdin.readLineSync()??"")??-1;
  for(var e in ListPerson.listPerson){
    if(e.id == this.id){
      print("ID bị trùng. Vui lòng chọn ID khác.");
      this.id = -1;
    }

  }
  }while(this.id! <= 0);
  

  do {
    stdout.write("Họ và tên: ");
  this.name = (stdin.readLineSync()??"").trim();
  } while (this.name == "");
  
  do {
    stdout.write("Tuổi: ");
    this.age = int.tryParse(stdin.readLineSync()??"")??-1;
  } while (this.age! <= 0);

  do {
    stdout.write("Giới tính. (1. Nam, 2. Nữ): ");
    int chon = int.tryParse(stdin.readLineSync()??"")??-1;
    if(chon == 1){
      this.gender = "Nam";
    }
    if(chon == 2){
      this.gender = "Nữ";
    }
  } while (this.gender != "Nam" && this.gender != "Nữ");


}


//Xuất thông tin Person
void xuatInfor(Person person){
    if(person is Student){
      person.xuatInforStudent();
    }
    if(person is Teacher){
      person.xuatInforTeacher();
    }
}
}







