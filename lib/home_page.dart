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
  String sehir = 'Dallas';
  double sicaklik = 20.0;
  var response;
  double? wind;
  int? humidity;
  int? pressure;
  double? feels_like;

  @override
  Future<void> getData() async {
    response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$sehir&appid=04643ff1c678061b7bc3881ccafbe63a&units=metric');
    sicaklik = jsonDecode(response.body)['main']['temp'];
    wind = jsonDecode(response.body)['wind']['speed'];
    humidity = jsonDecode(response.body)['main']['humidity'];
    pressure = jsonDecode(response.body)['main']['pressure'];
    feels_like = jsonDecode(response.body)['main']['feels_like'];
  }

  @override
  void initState() {
    getData();
    super.initState();
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
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '${sicaklik.round()}',
                      style: StilOfText().titleStyle(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$sehir',
                        style: StilOfText().titleStyle(),
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
                            getData();
                          });
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: AdditionalInformation(
                          wind: wind,
                          pressure: pressure,
                          humidity: humidity,
                          feels_like: feels_like)
                      .Ekbilgiler(),
                ),
              ],
            ),
          ),
        ));
  }
}
