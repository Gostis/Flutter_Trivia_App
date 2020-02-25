import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens
import 'models/game_settings.dart';
import 'screens/new_game.dart';
import 'screens/questions_test_screen.dart';
import 'screens/game_screen.dart';
import 'screens/next_question_test_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GameSettings())],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xffE63946),
            accentColor: Color(0xff1D3557),

            /*
            Extract this to be in another file
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
        home: Game(),
      ),
    );
  }
}
