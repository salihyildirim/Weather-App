import 'package:flutter/cupertino.dart';

import 'background_decoration.dart';

class AdditionalInformation {
  final double? wind;
  final int? humidity;
  final int? pressure;
  final double? feels_like;

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
            Text('$wind', style: StilOfText().titleStyle()),
            Text(
              '15',
              style: StilOfText().valueStlye(),
            ),
            Text('$humidity', style: StilOfText().titleStyle()),
            Text('45', style: StilOfText().valueStlye())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$pressure',
              style: StilOfText().titleStyle(),
            ),
            Text('1100', style: StilOfText().valueStlye()),
            Text('$feels_like', style: StilOfText().titleStyle()),
            Text('25', style: StilOfText().valueStlye())
          ],
        )
      ],
    );
  }
}
