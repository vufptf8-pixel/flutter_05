import 'dart:io';
void main(){
  int n = int.parse(stdin.readLineSync()!);
  int soTong = 0;
  int soNguoc = 0;
  // for (int i = 1; i <= n; i ++){
  //   soTong += i;
  //   print(i);
  // }

  // print(soTong);

  while(n>=1){
    soNguoc = soNguoc*10 + n%10;
    n=n~/10;

  }
  print(soNguoc);

}