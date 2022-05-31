class Info {
  final double? wind;
  final int? humidity;
  final int? pressure;
  final double? feels_like;
  final double? temp;

  Info(
      {required this.wind,
      required this.humidity,
      required this.pressure,
      required this.feels_like,
      required this.temp});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      wind: json['wind']['speed'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      feels_like: json['main']['feels_like'],
      temp: json['main']['temp'],
    );
  }
}
