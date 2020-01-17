import 'package:equatable/equatable.dart';
import 'package:trivia_app/data/model/game_settings.dart';
import 'package:trivia_app/data/model/question.dart';

abstract class GameSettingsEvent extends Equatable {
  const GameSettingsEvent();
}

class GetGameSettings extends GameSettingsEvent {
  final String category;
  final String difficulty;
  final int time;
  final int lives;
  //final GameSettings gameSettings;

  const GetGameSettings(this.category, this.difficulty, this.time, this.lives);

  @override
  // TODO: implement props
  List<Object> get props =>
      [this.category, this.difficulty, this.time, this.lives];
}

class GetTriviaQustions extends GameSettingsEvent {
  final List<Question> questions;

  const GetTriviaQustions(this.questions);

  @override
  // TODO: implement props
  List<Object> get props => [this.questions];
}
