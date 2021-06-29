import 'package:flutter/material.dart';
import 'package:flutter_music_player/blocs/music_controller_bloc/music_controller_bloc.dart';
import 'package:flutter_music_player/ui/screens/music_player/utils/music_player_utils.dart';
import 'package:flutter_music_player/ui/screens/music_player/widgets/music_controller.dart';
import 'package:flutter_music_player/ui/screens/music_player/widgets/music_player_image.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerScreen extends StatefulWidget {
  final List<dynamic> songs;

  const MusicPlayerScreen(this.songs);

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> with SingleTickerProviderStateMixin {
  late AudioPlayer player;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setAsset('assets/audio/Bliss.mp3');
    _animationController = AnimationController(duration: const Duration(seconds: 4), vsync: this);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(50, 50, 50, 1),
              Color.fromRGBO(20, 20, 20, 1),
            ],
            stops: [
              0.1,
              1.0,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Color.fromRGBO(150, 150, 150, 1),
                    ),
                  ),
                  Text(
                    'Playing Now',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Color.fromRGBO(150, 150, 150, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              MusicPlayerImage(
                imagePath: 'assets/images/Aiguille-DayAndNight.jpg',
                controller: _animationController,
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Music Title',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Color.fromRGBO(74, 243, 255, 1),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Music Title',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(150, 150, 150, 1),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SliderTheme(
                        data: SliderThemeData(trackShape: CustomTrackShape()),
                        child: Slider(
                          value: 10,
                          min: 0,
                          max: 30,
                          onChanged: (double a) {},
                          activeColor: Color.fromRGBO(74, 243, 255, 1),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '0:00',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '03:10',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      MusicController(
                        MusicPlayerUtils(
                          _animationController,
                          player,
                          PlayState.Paused,
                          context,
                        ),
                        MusicControllerBloc(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx + 10;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width - 20;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

// Container(
//                         height: 100,
//                         child: Stack(
//                           children: [
//                             Center(
//                               child: Container(
//                                 height: 15,
//                                 width: 15,
//                                 decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle, boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.white,
//                                     spreadRadius: 4,
//                                     blurRadius: 15,
//                                   ),
//                                   BoxShadow(
//                                     color: Colors.white12,
//                                     spreadRadius: -4,
//                                     blurRadius: 5,
//                                   )
//                                 ]),
//                               ),
//                             ),
//                             Center(
//                               child: Icon(
//                                 Icons.house,
//                                 color: Colors.white,
//                               ),
//                             )
//                           ],
//                         ),
//                       )
