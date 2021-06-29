part of 'music_controller_bloc.dart';

@immutable
abstract class MusicControllerEvent extends Equatable {}

class MusicPlayedEvent extends MusicControllerEvent {
  @override
  List<Object?> get props => [];
}

class MusicPausedEvent extends MusicControllerEvent {
  @override
  List<Object?> get props => [];
}

class MusicResetEvent extends MusicControllerEvent {
  @override
  List<Object?> get props => [];
}
