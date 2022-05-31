import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'background_decoration.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
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
                onPressed: () {
                  Navigator.pop(context, myController.text);
                },
                child: Text('TAMAM'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
