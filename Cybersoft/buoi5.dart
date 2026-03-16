void main(){
  final a = 5 + 3;
  print(a);
  print(total(5));
  log("Xin chào");

}

int total(int a,[int b = 2]){

  if(a>b){
    return a-b;
  }else{
  return a + b;}
}

int totalA(int a,int b) => (a>b) ? a-b : a+b;

void log(String value){
  print("Hàm log $value");
}

