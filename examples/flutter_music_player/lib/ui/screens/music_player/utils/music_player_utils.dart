import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_player/blocs/music_controller_bloc/music_controller_bloc.dart';
import 'package:flutter_music_player/ui/screens/music_player/utils/music_player_interface.dart';
import 'package:just_audio/just_audio.dart';

///TODO - SWITCH TO GET IT
class MusicPlayerUtils implements MusicPlayerInterface {
  late AnimationController _animationController;
  late AudioPlayer _audioPlayer;
  late PlayState _playState;
  late BuildContext _context;

  MusicPlayerUtils(
    AnimationController animationController,
    AudioPlayer audioPlayer,
    PlayState playState,
    BuildContext context,
  ) {
    this._animationController = animationController;
    this._audioPlayer = audioPlayer;
    this._playState = playState;
    this._context = context;
  }

  AudioPlayer get audioPlayer => _audioPlayer;

  @override
  Future<void> pauseMusic() async {
    _animationController.stop();
    BlocProvider.of<MusicControllerBloc>(_context).add(MusicPausedEvent());
    await _audioPlayer.pause();
  }

  @override
  Future<void> playMusic() async {
    _animationController.forward();
    _animationController.repeat();
    BlocProvider.of<MusicControllerBloc>(_context).add(MusicPlayedEvent());
    await _audioPlayer.play();
  }

  @override
  Future<void> resetMusic() async {
    _animationController.duration = Duration(milliseconds: 400);
    _animationController.reverse();
    _animationController.duration = Duration(seconds: 4);
    BlocProvider.of<MusicControllerBloc>(_context).add(MusicResetEvent());

    if (_audioPlayer.playing) {
      await _audioPlayer.stop();
    }
  }
}
