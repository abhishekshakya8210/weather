class Weather {
  final String cityname;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  Weather({
    required this.cityname,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityname: json['name'],
      temperature: (json['main']['temp'] as num).toDouble(), 
      description: json['weather'][0]['description'],       
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed'] as num).toDouble(), 
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],                        
    );
  }
}
