import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra/models/Radio_response.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../models/radios_model.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  final ApiManager _apiManager = ApiManager();
  List<RadiosModel>? radiosList = [];
  RadiosModel? currentRadio; //to know which radio is playing
  int currentIndex = 0; // to know which radio is playing
  final player = AudioPlayer();
  bool isPlaying = false;

  RadioCubit() : super(RadioInitialState());

  getRadios() async {
    try {
      var response = await _apiManager.getRadios();
      var data = RadioResponse.fromJson(response);

      radiosList = data.radios;
      currentRadio = radiosList![currentIndex];

      emit(RadioSuccessState());
    } catch (error) {
      emit(RadioErrorState(error.toString()));
    }
  }

  previousRadio() {
    if (currentIndex == 0) return;
    player.stop();
    isPlaying = false;
    currentIndex--;
    currentRadio = radiosList![currentIndex];
    emit(RadioSuccessState());
  }

  nextRadio() {
    if (currentIndex == radiosList!.length - 1) return;
    player.stop();
    isPlaying = false;
    currentIndex++;
    currentRadio = radiosList![currentIndex];
    emit(RadioSuccessState());
  }

  clickOnPlayButton() {
    if (player.state == PlayerState.playing) {
      isPlaying = false;
      player.pause();
    } else if (player.state == PlayerState.paused) {
      isPlaying = true;
      player.resume();
    } else {
      isPlaying = true;
      player.play(UrlSource(currentRadio!.url!));
    }
    emit(RadioSuccessState());
  }
}
