import "dart:io";

void main(){
  //Khai báo biến lựa chọn
  int? chon;


  //Hiển thị Menu lựa chọn
  do{
  print("CHƯƠNG TRÌNH QUẢN LÝ SẢN PHẨM");
  print("1.Thêm Sản Phẩm\n2.Sửa Sản Phẩm\n3.Xóa Sản Phẩm\n4.Tìm Sản Phẩm\n5.Hiện Danh Sách\n6.Tính Tổng Tiền\n7.Thoát Chương Trình");
  stdout.write("Mời chọn: ");
  chon = int.tryParse(stdin.readLineSync()??"")??0;
    switch(chon){
    case 1:
      var thoat;
      do{
        themSanPham(); //Gọi hàm Thêm Sản Phẩm
        stdout.write("Tiếp tục thêm sản phẩm(1)/Thoát(0): ");
        thoat = int.tryParse(stdin.readLineSync()??"")??0;
      }while(thoat==1);
      
      break;
    case 2:
      var thoat;
      do{
        suaSanPham(); //Gọi hàm Sửa Sản Phẩm
        stdout.write("Tiếp tục sửa(1)/Thoát(0): ");
        thoat = int.tryParse(stdin.readLineSync()??"")??0;
      }while(thoat==1);
      

      break;
    case 3:
      xoaSanPham(); //Gọi hàm Xóa Sản Phẩm
      break;
    case 4:
      timSanPham(); //Gọi hàm Tìm Sản Phẩm
      break;
    case 5:
      xuatThongTin();// Gọi hàm xuất thông tin
      stdout.write("Enter để tiếp tục: ");
      stdin.readLineSync();
      break;
    case 6:
      tongTien();// Gọi Hàm tính tổng tiền
      stdout.write("Enter để tiếp tục: ");
      stdin.readLineSync();
      break;
    case 7:
      break;

  };
  }while(chon != 7);

}
  //Khai báo biến của sản phẩm
  String name = "";
  int? soLuong;
  double? donGia;
  double? giaTien;
  
  //Khai báo list chứa danh sách sản phẩm
  List<Map<String,dynamic>> listSanPham = [];

  //Hàm thêm sản phẩm
  void themSanPham(){
    do{ stdout.write("Sản phẩm: ");
    name = stdin.readLineSync()??"";
 }while(name == "");
  

  do{stdout.write("Số lượng: ");
  soLuong = int.tryParse(stdin.readLineSync()!);
  }while(soLuong == null);

 do{ stdout.write("Đơn giá: ");
  donGia = double.tryParse(stdin.readLineSync()!);
  }while(donGia == null);

   listSanPham.add({
    "name":name,
    "soLuong":soLuong,
    "donGia":donGia,
    "giaTien":soLuong!*donGia!,
  });

  for(var i = 0; i < listSanPham.length; i++){
    listSanPham[i]["soTT"]=i+1;}//Thêm Số TT cho sản phẩm


  }

  //Hiện danh sách sản phẩm
  void xuatThongTin(){

  for(var i = 0; i < listSanPham.length; i++){
    listSanPham[i]["soTT"]=i+1;
    print("--------------------------------------------------------------------------------");
    print("Số TT: ${listSanPham[i]["soTT"]}\tTên SP: ${listSanPham[i]["name"]}\tSố lượng: ${listSanPham[i]["soLuong"]}\tĐơn giá: ${listSanPham[i]["donGia"]}\tGiá tiền: ${listSanPham[i]["giaTien"]}");
    print("--------------------------------------------------------------------------------");
  }

  
  

}
 
//Sửa sản phẩm
void suaSanPham(){

  int soTT;
  int? chon;

  xuatThongTin();


  do{stdout.write("Chọn sản phẩm muốn sửa. Nhập số TT: ");
  soTT = int.tryParse(stdin.readLineSync()??"")??0;
  }while( soTT < 1 || soTT > listSanPham.length);

  
  //Tạo menu sửa tên, số lượng hoặc đơn giá
  do{print("1.Sửa tên sản phẩm\n2.Sửa số lượng\n3.Sửa đơn giá");
  stdout.write("Bạn muốn sửa phần nào (chọn 1,2 hoặc 3): ");
  chon = int.tryParse(stdin.readLineSync()!);
  }while(chon == null ||chon < 1 || chon > 3);

  switch(chon){
    case 1:
      var x;
      do{stdout.write("Tên sản phẩm ${listSanPham[soTT-1]["name"]} sửa thành: ");
      x = stdin.readLineSync()??"";
       
      }while(x == "");
      listSanPham[soTT-1]["name"]=x;

      break;
    
    case 2:
      var x;
      
      do{stdout.write("Số lượng của sản phẩm ${listSanPham[soTT-1]["name"]} sửa thành: ");
      x = int.tryParse(stdin.readLineSync()??"")??-1;
      }while(x<0);
      listSanPham[soTT - 1]["soLuong"]=x;
      listSanPham[soTT -1]["giaTien"] = listSanPham[soTT -1]["soLuong"]*listSanPham[soTT -1]["donGia"];

      break;

    case 3:
      var x;
      do{stdout.write("Đơn giá sản phẩm ${listSanPham[soTT -1]["name"]} sửa thành: ");
       x= double.tryParse(stdin.readLineSync()??"")??-1;
       
      }while(x<0);
      listSanPham[soTT - 1]["donGia"] = x;
      listSanPham[soTT - 1]["giaTien"] = listSanPham[soTT -1]["soLuong"]*listSanPham[soTT - 1]["donGia"];

      break;


  }
  


}
//Hàm xóa sản phẩm
void xoaSanPham(){
  int soTT;
  
  do{
  xuatThongTin();
  stdout.write("Chọn số TT của sản phẩm muốn xóa(Nếu muốn hủy xóa nhấn 0): ");
  soTT = int.tryParse(stdin.readLineSync()??"")??-1;
  if(soTT == 0) return;
  }while(soTT < 1||soTT > listSanPham.length);
  listSanPham.removeAt(soTT - 1);


  for(var i = 0; i < listSanPham.length; i++){
    listSanPham[i]["soTT"]=i+1;


} 
}


//Hàm tìm sản phẩm
void timSanPham(){
  String timTen;
  do{stdout.write("Nhập tên sản phẩm muốn tìm: ");
  timTen = stdin.readLineSync()??"";
  }while(timTen == "");
  var timSanPham = listSanPham.where((e)=>e["name"]==timTen).toList();
  if(timSanPham.isNotEmpty){
    for(var i = 0; i < timSanPham.length; i++){
    print("--------------------------------------------------------------------------------");
    print("Số TT: ${timSanPham[i]["soTT"]}\tTên SP: ${timSanPham[i]["name"]}\tSố lượng: ${timSanPham[i]["soLuong"]}\tĐơn giá: ${timSanPham[i]["donGia"]}\tGiá tiền: ${timSanPham[i]["giaTien"]}");
    print("--------------------------------------------------------------------------------");
  }
    
  }else{
    print("Không tìm thấy sản phẩm");
  }


}

//Hàm tính tổng tiền

void tongTien(){
  double tongTien = 0;
  xuatThongTin();
  for(var i = 0;i < listSanPham.length; i ++){
    tongTien += listSanPham[i]["giaTien"];
  }

  print("Tổng tiền thanh toán $tongTien");

}



