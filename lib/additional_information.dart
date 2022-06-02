import 'package:flutter/cupertino.dart';

import 'background_decoration.dart';

class AdditionalInformation {
  double? wind;
  int? humidity;
  int? pressure;
  double? feels_like;

  AdditionalInformation(
      {this.wind, this.humidity, this.pressure, this.feels_like});

  Column Ekbilgiler() {
    return Column(
      children: [
        Text(
          'Additional Information',
          style: StilOfText().titleStyle(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Wind :', style: StilOfText().titleStyle()),
            Text(
              '${wind?.round()}',
              style: StilOfText().valueStlye(),
            ),
            Text('Humditiy :', style: StilOfText().titleStyle()),
            Text('$humidity', style: StilOfText().valueStlye())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pressure :',
              style: StilOfText().titleStyle(),
            ),
            Text('$pressure', style: StilOfText().valueStlye()),
            Text('Feels Like :', style: StilOfText().titleStyle()),
            Text('$feels_like', style: StilOfText().valueStlye())
          ],
        )
      ],
    );
  }
}
