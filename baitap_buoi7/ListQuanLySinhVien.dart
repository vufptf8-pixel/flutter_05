import "dart:io";
void main(){

  ListSinhVien listSinhVien = ListSinhVien();

  int? chon;



  do{ 
  print("------------------------------------------------------------------------------------------------------------------------------");
  print("Chương trình quản lý danh sách sinh viên.");
  print("1.Thêm sinh viên vào danh sách.\n2.Hiển thị danh sách.\n3.Tìm sinh viên có điểm TB cao nhất.\n4.Thoát chương trình");
  print("------------------------------------------------------------------------------------------------------------------------------");
    stdout.write("Mời chọn: ");
  chon = int.tryParse(stdin.readLineSync()!);
  switch(chon){
  case 1:
    listSinhVien.themSinhVien();
    break;
    
  case 2:
    listSinhVien.hienDanhSach();
    stdout.write("Nhấn phím bất kì để tiếp tục");
    stdin.readLineSync();
    break;
    
  case 3:
    listSinhVien.diemTBCaoNhat();
    stdout.write("Nhấn phím bất kì để tiếp tục:");
    stdin.readLineSync();
    break;
  case 4:
    break;
    
  };
  
  }while(chon != 4);
  


          
  
  // switch:
  // case

}

class SinhVien{

//Khai báo biến nhập
  String? name;
  double? diemToan;
  double? diemLy;
  double? diemHoa;

//Khai báo biến tính toán
double get diemTB => (diemToan! + diemLy! + diemHoa!)/3;

String get hocLuc { if(this.diemTB > 9){
  return "Xuất sắc";
}else if(this.diemTB > 7){
  return "Giỏi";
}else if(this.diemTB > 5){
  return "Khá";
}else{
  return "Kém";
}}
  
  

//Hàm khởi tạo
SinhVien();

//Hàm nhập thông tin 1 sinh viên
void nhapThongTin(){
  
do{
  stdout.write("Họ và tên SV: ");
  this.name = stdin.readLineSync()!;
  }while(this.name == null);
  
do{
  stdout.write("Nhập điểm Toán : ");
  this.diemToan = double.parse(stdin.readLineSync()!);
}while(diemToan == null || this.diemToan! > 10 || this.diemToan! < 0);
  

  do{
    stdout.write("Nhập điểm Lý: ");
    this.diemLy = double.parse(stdin.readLineSync()!);
  }while(this.diemLy == null || this.diemLy! > 10 || this.diemLy! < 0);

  

  do{
    stdout.write("Nhập điểm Hóa: ");
    this.diemHoa = double.parse(stdin.readLineSync()!);

  }while(this.diemHoa == null || this.diemHoa! > 10 || this.diemHoa! <0);
}

//Hàm xuất thông tin 1 sinh viên

void xuatThongTin(){
  print("----------------------------------------------------------------------------------------------------------------------");
  print("Họ và tên: $name\tToán: $diemToan\tLý: $diemLy \tHóa: $diemHoa \tĐiểm TB: ${diemTB.toStringAsFixed(2)} \tHọc lưc: $hocLuc");
  print("----------------------------------------------------------------------------------------------------------------------");
}

}


//List Sinh Viên
class ListSinhVien{

//Tạo list rỗng
List<SinhVien> listSinhVien=[];


//Hàm khởi tạo
ListSinhVien();

//Hàm thêm sinh viên vào danh sách:
void themSinhVien(){
  SinhVien sinhVien = SinhVien();
  sinhVien.nhapThongTin();
  listSinhVien.add(sinhVien);
}

//Hàm hiển thị danh sách sinh viên
void hienDanhSach(){
  for(var i in listSinhVien){
    i.xuatThongTin();

  }


}

//Hàm tìm sinh viên có điểm TB cao nhứt
void diemTBCaoNhat(){
  double diemTBCaoNhat = listSinhVien[0].diemTB;
  for(var i =0; i < listSinhVien.length - 1; i++){
    if(listSinhVien[i+1].diemTB > listSinhVien[i].diemTB){
        diemTBCaoNhat = listSinhVien[i+1].diemTB;
    }
    }
  print("Sinh viên có điểm TB cao nhất: ");
  for(var i = 0; i < listSinhVien.length; i++){
    if(listSinhVien[i].diemTB == diemTBCaoNhat){
      listSinhVien[i].xuatThongTin();
  }
}







}
}
