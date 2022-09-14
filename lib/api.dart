import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_var.dart';

getadata() async {
  final response = await http.get(Uri.https(
      'mj09store.000webhostapp.com', 'techlangues/categories/get.php'));
  var jsondata = jsonDecode(response.body);
  // print(jsondata);
  List<data_con> Data_cons = [];
  for (var api in jsondata) {
    var cimage =
        "https://mj09store.000webhostapp.com/techlangues/categories/uploads/";
    String iname = cimage + api['c_image'];

    data_con Data_con =
        data_con(id: api['id'], name: api['c_name'], image: iname);
    Data_cons.add(Data_con);
  }
  // print(Data_cons.length);
  return Data_cons;
}

getfeatures() async {
  final response = await http.get(
      Uri.https('mj09store.000webhostapp.com', 'techlangues/features/get.php'));
  var jsondata = jsonDecode(response.body);
  // print(jsondata);
  List<features_con> Features_cons = [];
  for (var api in jsondata) {
    var cimage =
        "https://mj09store.000webhostapp.com/techlangues/features/uploads/";
    String iname = cimage + api['image'];
    // var pr="\$" + api['price'];
    features_con Features_con = features_con(
        id: api['id'],
        name: api['name'],
        image: iname,
        price: api['price'],
        duration: api['duration'],
        session: api['session'],
        review: api['review'],
        is_favorited: api['is_favorited'],
        description: api['description']);
    Features_cons.add(Features_con);
  }
  // print(Features_cons.length);

  return Features_cons;
}