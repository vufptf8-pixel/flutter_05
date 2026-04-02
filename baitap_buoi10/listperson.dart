import 'person.dart';





class ListPerson{


  static List<Person> listPerson = [];

// Thêm Person vào List
  static void addPerson(Person person){
    listPerson.add(person);
  }


// Xóa Person khỏi List

  static void deletePerson(Person person){
    listPerson.remove(person);
  }


// Hiển thị List Person
  static void showListPerson(){
    for(var e in listPerson){
      e.xuatInfor(e);
      
      }
    }
  }
