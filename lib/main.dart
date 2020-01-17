import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/data/weather_repository.dart';

// Screens
import 'screens/questions_test_screen.dart';
import 'bloc/weather_bloc.dart';
import 'screens/new_game.dart';
import 'screens/start_screen.dart';
import 'screens/game_screen.dart';
import 'screens/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xffE63946),
            accentColor: Color(0xff1D3557),

            /*
          #E63946
          #F1FAEE
          #A8DADC
          #457B9D
          #1D3557
          #474747
          #E63946
          */
            // Define the default font family.

            scaffoldBackgroundColor: Color(0xffF1FAEE)),
        home: BlocProvider(
          create: (context) => WeatherBloc(FakeWeatherRepository()),
          child: WeatherSearchPage(),
        ));
  }
}
