import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:trivia_app/data/model/game_settings.dart';
import 'package:trivia_app/data/model/question.dart';

abstract class GameSettingsState extends Equatable {
  const GameSettingsState();
}

class GameSettingsInitial extends GameSettingsState {
  //Initial constructor for the first state
  const GameSettingsInitial();

  @override
  List<Object> get props => [];
}

class GameSettingsLoading extends GameSettingsState {
  //When submitting
  const GameSettingsLoading();

  @override
  List<Object> get props => null;
}

class GameSettingsLoaded extends GameSettingsState {
  //when a return from database is recived
  //Todo: implement classes
  final GameSettings gamesettings;
  //List<Question> questions;

  GameSettingsLoaded({@required this.gamesettings});

  @override
  List<Object> get props => [this.gamesettings];
}

class GameSettingsError extends GameSettingsState {
  //When API throws an error (probably network error)
  final String message;
  const GameSettingsError(this.message);

  @override
  List<Object> get props => [this.message];
}
