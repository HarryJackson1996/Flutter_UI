part of 'music_bloc.dart';

@immutable
abstract class MusicEvent extends Equatable {
  const MusicEvent();
}

class MusicFetchedEvent extends MusicEvent {
  @override
  List<Object> get props => [];
}

class MusicRefreshedEvent extends MusicEvent {
  @override
  List<Object> get props => [];
}
