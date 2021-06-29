part of 'music_bloc.dart';

@immutable
abstract class MusicState extends Equatable {
  @override
  List<Object> get props => [];
}

class MusicInitial extends MusicState {}

class MusicLoading extends MusicState {}

class MusicLoadSuccess extends MusicState {
  final Albums albums;

  MusicLoadSuccess({required this.albums});

  @override
  List<Object> get props => [albums];
}

class MusicLoadFailure extends MusicState {
  final String error;

  MusicLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
