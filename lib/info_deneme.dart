import 'package:flutter/cupertino.dart';

import 'background_decoration.dart';

class AdditionalInformationDeneme {
  double? wind;
  int? humidity;
  int? pressure;
  double? feels_like;

  AdditionalInformationDeneme(
      {this.wind, this.humidity, this.pressure, this.feels_like});

  Container Ekbilgiler() {
    return Container(
      height: 120,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            /*Text(
              'Additional Information :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                decoration: TextDecoration.underline,
              ),
            ),*/
            Text(
              'Wind ',
              style: StilOfText().titleStyle(),
            ),
            Text(
              '${wind?.round()}',
              style: StilOfText().valueStlye(),
            ),
            Text(
              'Pressure ',
              style: StilOfText().titleStyle(),
            ),
            Text('$pressure', style: StilOfText().valueStlye()),
            Text('Humditiy ', style: StilOfText().titleStyle()),
            Text('$humidity', style: StilOfText().valueStlye()),
            Text('Feels Like ', style: StilOfText().titleStyle()),
            Text('$feels_like', style: StilOfText().valueStlye()),
          ],
        ),
      ),
    );
  }
}
