// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:trivia_app/data/weather_repository.dart';
// import './bloc.dart';

// class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
//   final WeatherRepository weatherRepository;

//   //constructor
//   WeatherBloc(this.weatherRepository);

//   @override
//   WeatherState get initialState => WeatherInitial();

//   @override
//   Stream<WeatherState> mapEventToState(
//     WeatherEvent event,
//   ) async* {
//     //output to the stream: (yield)

//     //Start loading directly when new event arrives
//     yield WeatherLoading();

//     if (event is GetWeather) {
//       try {
//         final weather = await weatherRepository.fetchWeather(event.cityName);
//         yield WeatherLoaded(weather);
//       } on NetworkError {
//         yield WeatherError("Couldn't fetch weather");
//       }
//     } else if (event is GetDetailedWeather) {
//       try {
//         final weather =
//             await weatherRepository.fetchDetailedWeather(event.cityName);
//         yield WeatherLoaded(weather);
//       } on NetworkError {
//         yield WeatherError("Couldn't fetch detailed weather");
//       }
//     }
//   }
// }
