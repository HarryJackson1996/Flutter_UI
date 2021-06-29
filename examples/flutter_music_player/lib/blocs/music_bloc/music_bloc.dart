import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_music_player/blocs/music_controller_bloc/music_controller_bloc.dart';
import 'package:flutter_music_player/models/albums.dart';
import 'package:flutter_music_player/repositories/music_repository.dart';
import 'package:meta/meta.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final MusicRepository musicRepository;

  MusicBloc({
    required this.musicRepository,
  }) : super(MusicInitial());

  @override
  Stream<MusicState> mapEventToState(
    MusicEvent event,
  ) async* {
    if (event is MusicFetchedEvent) {
      yield* _mapMusicFetchedToState(event);
    }
    if (event is MusicRefreshedEvent) {
      yield* _mapMusicRefreshedToState(event);
    }
  }

  Stream<MusicState> _mapMusicFetchedToState(MusicFetchedEvent event) async* {
    if (state is! MusicLoading) {
      yield MusicLoading();
    }
    try {
      final Albums albums = await musicRepository.fetchAlbums();
      yield MusicLoadSuccess(albums: albums);
    } catch (e) {
      yield MusicLoadFailure(e.toString());
    }
  }

  Stream<MusicState> _mapMusicRefreshedToState(MusicRefreshedEvent event) async* {}
}
