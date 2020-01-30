// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trivia_app/bloc/bloc.dart';
// import 'package:trivia_app/bloc/game_settings_bloc.dart';
// import 'package:trivia_app/data/model/game_settings.dart';

// class TestScreen extends StatefulWidget {
//   final GameSettings masterSettings;

//   const TestScreen({
//     Key key,
//     @required this.masterSettings,
//   }) : super(key: key);

//   @override
//   _TestScreenState createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     BlocProvider.of<GameSettingsBloc>(context).add(GetGameSettings(
//         widget.masterSettings.difficulty,
//         widget.masterSettings.category,
//         widget.masterSettings.lives,
//         widget.masterSettings.time));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Weather Detail"),
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 16),
//         alignment: Alignment.center,
//         child: BlocBuilder<GameSettingsBloc, GameSettingsState>(
//             builder: (context, state) {
//           if (state is GameSettingsLoaded) {
//             return (Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Text(
//                   state.gamesettings.category,
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Text(
//                   // Display the Celsius temperature with 1 decimal place
//                   state.gamesettings.difficulty,
//                   style: TextStyle(fontSize: 80),
//                 ),
//                 Text(
//                   // Display the Fahrenheit temperature with 1 decimal place
//                   state.gamesettings.lives.toString(),
//                   style: TextStyle(fontSize: 80),
//                 ),
//                 Text(
//                   // Display the Fahrenheit temperature with 1 decimal place
//                   state.gamesettings.time.toString(),
//                   style: TextStyle(fontSize: 80),
//                 ),
//               ],
//             ));
//           }
//         }),
//       ),
//     );
//   }
// }
