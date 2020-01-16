import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperatureCelsius;
  final double temperatureFarenheit;

  Weather({
    @required this.cityName,
    @required this.temperatureCelsius,
    this.temperatureFarenheit,
  });

  @override
  // For Equatable (value equality)
  List<Object> get props =>
      [cityName, temperatureCelsius, temperatureFarenheit];
}
