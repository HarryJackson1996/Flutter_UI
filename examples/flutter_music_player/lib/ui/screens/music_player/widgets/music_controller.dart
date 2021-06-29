import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_player/blocs/music_controller_bloc/music_controller_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_player/blocs/music_controller_bloc/music_controller_bloc.dart';
import 'package:flutter_music_player/ui/screens/music_player/utils/music_player_utils.dart';
import 'package:just_audio/just_audio.dart';

class MusicController extends StatelessWidget {
  final MusicPlayerUtils musicPlayerUtils;
  final MusicControllerBloc musicControllerBloc;

  MusicController(this.musicPlayerUtils, this.musicControllerBloc);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 40.0),
        child: BlocBuilder<MusicControllerBloc, PlayState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.shuffle,
                    color: Color.fromRGBO(150, 150, 150, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await musicPlayerUtils.resetMusic();

                    // BlocProvider.of<MusicControllerBloc>(context).add(MusicResetEvent());
                    // player.stop();
                    // // player.play();
                    // controller.reset();
                    // controller.forward();
                  },
                  child: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (musicPlayerUtils.audioPlayer.playing) {
                      await musicPlayerUtils.pauseMusic();
                    } else {
                      await musicPlayerUtils.playMusic();
                    }
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 4,
                          blurRadius: 15,
                        ),
                        BoxShadow(
                          color: Colors.white12,
                          spreadRadius: -4,
                          blurRadius: 5,
                        )
                      ],
                      gradient: RadialGradient(
                        radius: 2,
                        colors: [Colors.white, Colors.white],
                      ),
                    ),
                    child: Icon(
                      getIcon(state),
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    // BlocProvider.of<MusicControllerBloc>(context).add(MusicPausedEvent());
                    // await player.dispose();
                    // await player.play();
                  },
                  child: Icon(
                    Icons.refresh_sharp,
                    color: Color.fromRGBO(150, 150, 150, 1),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  IconData getIcon(PlayState state) {
    switch (state) {
      case PlayState.Paused:
        return Icons.play_arrow;
      case PlayState.Playing:
        return Icons.pause;
      case PlayState.Reset:
        return Icons.play_arrow;
      default:
        return Icons.play_arrow;
    }
  }
}

// class MusicController extends StatelessWidget {
//   final AudioPlayer player;
//   final AnimationController controller;

//   MusicController(this.player, this.controller);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: BlocProvider<MusicControllerBloc>(
//         create: (BuildContext context) => MusicControllerBloc(),
//         child: Container(
//           alignment: Alignment.bottomCenter,
//           padding: EdgeInsets.only(bottom: 40.0),
//           child: BlocBuilder<MusicControllerBloc, PlayState>(
//             builder: (context, state) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     child: Icon(
//                       Icons.shuffle,
//                       color: Color.fromRGBO(150, 150, 150, 1),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       BlocProvider.of<MusicControllerBloc>(context).add(MusicResetEvent());
//                     },
//                     child: Icon(
//                       Icons.skip_previous,
//                       color: Colors.white,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       if (player.playing) {
//                         await player.pause();
//                         BlocProvider.of<MusicControllerBloc>(context).add(MusicPausedEvent());
//                         controller.stop();
//                       } else {
//                         BlocProvider.of<MusicControllerBloc>(context).add(MusicPlayedEvent());
//                         controller.forward();
//                         controller.repeat();
//                         await player.play();
//                       }
//                     },
//                     child: Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.white,
//                             spreadRadius: 4,
//                             blurRadius: 15,
//                           ),
//                           BoxShadow(
//                             color: Colors.white12,
//                             spreadRadius: -4,
//                             blurRadius: 5,
//                           )
//                         ],
//                         gradient: RadialGradient(
//                           radius: 2,
//                           colors: [Colors.white, Colors.white],
//                         ),
//                       ),
//                       child: Icon(
//                         state == PlayState.PAUSED ? Icons.play_arrow : Icons.pause,
//                         size: 40,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     child: Icon(
//                       Icons.skip_next,
//                       color: Colors.white,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       BlocProvider.of<MusicControllerBloc>(context).add(MusicPausedEvent());
//                       await player.dispose();
//                       await player.play();
//                     },
//                     child: Icon(
//                       Icons.refresh_sharp,
//                       color: Color.fromRGBO(150, 150, 150, 1),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
