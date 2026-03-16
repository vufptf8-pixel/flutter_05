bool isPrime(int n){
  
  if(n<2) return false;
  for(int i = 2; i<n; i++){
    if(n % i == 0){
      return false;
    }
  }
  return true;
  
   
  
}

void main(){
  var n = 9 ;
  if(!isPrime(n)){
    print("$n không phải số nguyên tố");
  }else{
    print("$n là số nguyên tố");
  }



}