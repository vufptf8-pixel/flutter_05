import 'dart:io';

void main(){
  String name;
  int gioLam;
  double luongGio;
  double tongLuong;
  double phuCap;
  double thueThuNhap;
  double luongThucLanh;

// Nhập tên, giờ làm, lương mỗi giờ
  stdout.write("Nhập tên sinh viên: ");
  name = stdin.readLineSync()??"";
  stdout.write("Nhập số giờ làm: ");
  gioLam = int.parse(stdin.readLineSync()??"");
  stdout.write("Nhập lương mỗi giờ làm: ");
  luongGio = double.parse(stdin.readLineSync()??"");

  //Tính tổng lương
  tongLuong = luongGio*gioLam;

  //Tính phụ cấp
  if(gioLam > 40){
      phuCap = luongGio*gioLam*0.2;
  }else{
      phuCap = 0;
  };


//Tính thuế thu nhập
  if((tongLuong+phuCap) > 10000000){
    thueThuNhap = (tongLuong+phuCap)*0.1;
    }else if ((tongLuong+phuCap) >= 7000000){
      thueThuNhap = (tongLuong + phuCap)*0.05;
    }else{
      thueThuNhap = 0;
    };

  //Tính lương thực lãnh
  luongThucLanh = tongLuong + phuCap - thueThuNhap;

  //In kết quả
  print("-----------------------------------------------------------------------------------------------------------------------");
  print("Họ và tên: $name\tLương trước thuế: ${tongLuong + phuCap}\tThuế thu nhập: $thueThuNhap \tLương thực lãnh: $luongThucLanh");
  print("-----------------------------------------------------------------------------------------------------------------------");











  }