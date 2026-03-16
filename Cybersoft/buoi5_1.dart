void main() async {

  fetchData().then((value) => print(value + "haha"));

  var a = await fetchData();
  print(a);

}

Future<String> fetchData() async {
    Future.delayed(Duration(seconds : 2));
   return "Data loaded";
}