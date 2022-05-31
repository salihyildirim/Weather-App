import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/search_page.dart';

import 'additional_information.dart';
import 'background_decoration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sehir = 'Ankara';
  double sicaklik = 20.0;
  var response;

  @override
  Future<void> getData() async {
    response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$sehir&appid=04643ff1c678061b7bc3881ccafbe63a&units=metric');
    sicaklik = jsonDecode(response.body)['main']['temp'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BackGroundDecoration(resim: 'c').getBackGround(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text('Button'),
                  onPressed: () async {
                    await getData();
                    print('$sicaklik');
                  },
                ),
                Text(
                  'dasdasd',
                  style: StilOfText().titleStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$sehir',
                      style: StilOfText().valueStlye(),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () async {
                        sehir = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(),
                          ),
                        );
                        setState(() {
                          sehir = sehir;
                        });
                      },
                    )
                  ],
                ),
                AdditionalInformation().Ekbilgiler(),
              ],
            ),
          ),
        ));
  }
}
