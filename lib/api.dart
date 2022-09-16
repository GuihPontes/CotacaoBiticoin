import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void api() async {
  var url = Uri.http("www.mercadobitcoin.net/", "api/BTC/json");

  var response = await http.get(url);
  var retorno = print(response.statusCode);

  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

  var itemCount = jsonResponse['RUB.15m'];
}
