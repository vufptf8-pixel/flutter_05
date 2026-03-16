import "dart:math";
import "dart:convert";
void main(){
  print(min(2,1));
  print(max(2,1));
  print(sqrt(2));
  var jsonString = '[{"score": 40}, {"score": 80}]';
 var scores = jsonDecode(jsonString);
 var user = '{"id": 40 , "name": "Tony" }';
 var scores1 = jsonDecode(user);
 print(scores);

}