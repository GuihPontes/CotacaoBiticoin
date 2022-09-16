import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _cotacao = "A cotação atual é  : ";

  void api() async {
    var url = Uri.http(
      "blockchain.com",
      "/pt/ticker",
    );

    var response = await http.get(url);
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    var itemCount = jsonResponse['BRL']['buy'];
    setState(() {
      _cotacao = " A cotação atual é  : ${itemCount}";
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.white,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(
              "https://i0.wp.com/vagasabertas.org/wp-content/uploads/2018/01/Como-investir-em-Biticoin-Cursos-Dicas.jpg?fit=1060%2C410&ssl=1",
              width: 400,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(_cotacao,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: api,
                child: Text("Atualizar"),
                color: Colors.amber,
              ))
        ]),
      )),
    );
  }
}
