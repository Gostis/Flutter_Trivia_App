import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:trivia_app/data/model/game_settings.dart';
import './bloc.dart';

class GameSettingsBloc extends Bloc<GameSettingsEvent, GameSettingsState> {
  //final QuestionsRepository questionsRepository;
  ////Declaring with the API-call
  //GameSettingsBloc(this.questionsRepository);

  @override
  GameSettingsState get initialState => GameSettingsInitial();

  @override
  Stream<GameSettingsState> mapEventToState(
    GameSettingsEvent event,
  ) async* {
    //Start loading directly when new event arrives
    //yield GameSettingsLoading();

    if (event is GetGameSettings) {
      yield GameSettingsLoaded(
          gamesettings: GameSettings(
              event.category, event.difficulty, event.lives, event.time));
    }
    /*else if (event is GetTriviaQustions) {
      try {
        final weather =
            await weatherRepository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError("Couldn't fetch detailed weather");
      }
    }*/
  }
}
