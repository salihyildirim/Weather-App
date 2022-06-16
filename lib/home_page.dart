import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/search_page.dart';

import 'additional_information.dart';
import 'background_decoration.dart';
import "string_extension.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sehir = 'Sehir';
  double sicaklik = 20;
  var response;
  double? wind;
  int? humidity;
  int? pressure;
  double? feels_like;
  String weather_icon = '01d';
  late Position position;
  String weather_main = '';

  Future<void> getDevicePosition() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print('Oluşan Hata : $e');
    }
    response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=04643ff1c678061b7bc3881ccafbe63a&units=metric');
    sehir = jsonDecode(utf8.decode(response.bodyBytes))['name'];
    getData(sehir);
  }

  @override
  Future<void> getData(String sehir) async {
    response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$sehir&appid=04643ff1c678061b7bc3881ccafbe63a&units=metric');
    sicaklik = jsonDecode(response.body)['main']['temp'];
    setState(() {
      wind = jsonDecode(response.body)['wind']['speed'];
    });
    humidity = jsonDecode(response.body)['main']['humidity'];
    pressure = jsonDecode(response.body)['main']['pressure'];
    feels_like = jsonDecode(response.body)['main']['feels_like'];
    weather_icon = jsonDecode(response.body)['weather'][0]['icon'];
    weather_main = jsonDecode(response.body)['weather'][0]['main'];
  }

  @override
  void initState() {
    getDevicePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BackGroundDecoration(resim: weather_icon).getBackGround(),
        child: sehir == null
            ? Center(
                child: SpinKitRotatingCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              )
            : Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${sicaklik.round()}°C',
                        style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.black38,
                                blurRadius: 5,
                                offset: Offset(-4, 4))
                          ],
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$sehir'.capitalize(),
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.black38,
                                    blurRadius: 5,
                                    offset: Offset(-4, 4))
                              ],
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 35,
                            ),
                            onPressed: () async {
                              sehir = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchPage(),
                                ),
                              );
                              setState(() {
                                sehir = sehir;
                                getData(sehir);
                              });
                            },
                          )
                        ],
                      ),
                      /*Card(
                        color: Colors.transparent,
                        child: Container(
                          height: 140,
                          width: 120,
                          child: Column(
                            children: [
                              Image.network(
                                'http://openweathermap.org/img/wn/${weather_icon}@2x.png',
                              ),
                              Text('$weather_main'),
                            ],
                          ),
                        ),
                      ),*/
                      /*Container(
                        width: 80,
                        height: 80,
                        child: Image.network(
                            'http://openweathermap.org/img/wn/${weather_icon}@2x.png'),
                      ),
                      Text('$weather_main'),*/
                      AdditionalInformation(
                              wind: wind,
                              pressure: pressure,
                              humidity: humidity,
                              feels_like: feels_like)
                          .Ekbilgiler(),
                    ],
                  ),
                ),
              ));
  }
}
