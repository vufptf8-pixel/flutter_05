void main(){

final Minh = Student("Minh","M01");
print(Minh.toString());
Minh.introduce();


}

class Student{
  String name = "kk";
  String id;

  Student(this.name, this.id);

  void introduce(){
    print("Xin chào");
  }

  @override
  String toString(){
    return "$name $id";
  }
}