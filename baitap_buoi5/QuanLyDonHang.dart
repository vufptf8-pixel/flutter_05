import "dart:io";
void main(){

  //Khai báo biến nhập vào
  String name;
  int soLuong;
  double donGia;

  //Khai báo biến tính toán
  double thanhTien;
  double giamGia;
  double thueVAT;
  double tongThanhToan;


  //Nhập tên sản phẩm, số lượng, đơn giá
  stdout.write("Nhập tên sản phẩm: ");
  name = stdin.readLineSync()?? "";
  stdout.write("Nhập số lượng: ");
  soLuong = int.parse(stdin.readLineSync()??"");
  stdout.write("Nhập đơn giá: ");
  donGia = double.parse(stdin.readLineSync()??"");

  //Tính thành tiền
  thanhTien = soLuong*donGia;

  //Tính giảm giá
  if(thanhTien >= 1000000){
    giamGia = thanhTien*0.1;
  }else if(thanhTien >= 500000){
    giamGia = thanhTien*0.05;
  }else{
    giamGia = 0;
  }

  //Tính thuế VAT
  thueVAT = (thanhTien - giamGia)* 0.08;

  //Tính tổng thanh toán cuối 
  tongThanhToan = thanhTien - giamGia - thueVAT;

  //In kết quả
  print("--------------------------------------------------------");
  print("Tên sản phẩm: $name\tSố lượng: $soLuong\tĐơn giá: $donGia");
  print("--------------------------------------------------------");
  print("Thành tiền: $thanhTien\tGiảm giá: $giamGia\t Thuế Vat: $thueVAT\t Tổng thanh toán: $tongThanhToan");
  print("--------------------------------------------------------");
 


}