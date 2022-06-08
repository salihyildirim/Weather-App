import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'background_decoration.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("HATA"),
          content: new Text("Geçersiz Bir Şehir Girdiniz"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new MaterialButton(
              child: new Text("KAPAT"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final myController = TextEditingController();
  Widget build(BuildContext context) {
    return Container(
      decoration: BackGroundDecoration(resim: 'search').getBackGround(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: TextField(
                  controller: myController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Sehir Seçiniz',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  style: TextStyle(fontSize: 30),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  var response = await http.get(
                      'https://api.openweathermap.org/data/2.5/weather?q=${myController.text}&appid=04643ff1c678061b7bc3881ccafbe63a&units=metric');
                  jsonDecode(response.body)['message'] == 'city not found'
                      ? _showDialog()
                      : Navigator.pop(context, myController.text);
                },
                child: Text(
                  'TAMAM',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
