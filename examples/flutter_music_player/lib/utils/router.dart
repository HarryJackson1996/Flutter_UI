import 'package:flutter/material.dart';
import 'package:flutter_music_player/ui/screens/home/home.dart';
import 'package:flutter_music_player/ui/screens/music_player/music_player.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case musicPlayerRoute:
        return MaterialPageRoute(builder: (_) => MusicPlayerScreen(settings.arguments as List));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

const String musicPlayerRoute = '/musicPlayerRoute';
