import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'music_controller_event.dart';
part 'music_controller_state.dart';

class MusicControllerBloc extends Bloc<MusicControllerEvent, PlayState> {
  MusicControllerBloc() : super(PlayState.Paused);

  @override
  Stream<PlayState> mapEventToState(
    MusicControllerEvent event,
  ) async* {
    if (event is MusicPlayedEvent) {
      yield PlayState.Playing;
    }
    if (event is MusicPausedEvent) {
      yield PlayState.Paused;
    }
    if (event is MusicResetEvent) {
      yield PlayState.Reset;
    }
  }
}
