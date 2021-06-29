import 'package:flutter/cupertino.dart';
import 'package:flutter_music_player/blocs/music_controller_bloc/music_controller_bloc.dart';

abstract class MusicPlayerInterface {
  Future<void> playMusic();
  Future<void> pauseMusic();
  Future<void> resetMusic();
}
