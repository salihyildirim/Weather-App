import 'package:flutter/cupertino.dart';

import 'background_decoration.dart';

class AdditionalInformation {
  double? wind;
  int? humidity;
  int? pressure;
  double? feels_like;

  AdditionalInformation(
      {this.wind, this.humidity, this.pressure, this.feels_like});

  Container Ekbilgiler() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Additional Information :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wind ',
                style: StilOfText().titleStyle(),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${wind?.round()}',
                style: StilOfText().valueStlye(),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Pressure ',
                style: StilOfText().titleStyle(),
              ),
              SizedBox(
                width: 5,
              ),
              Text('$pressure', style: StilOfText().valueStlye()),
            ],
          ),
          Text('Humditiy ', style: StilOfText().titleStyle()),
          SizedBox(
            width: 5,
          ),
          Text('$humidity', style: StilOfText().valueStlye()),
          Text('Feels Like ', style: StilOfText().titleStyle()),
          SizedBox(
            width: 5,
          ),
          Text('$feels_like', style: StilOfText().valueStlye()),
        ],
      ),
    );
  }
}
