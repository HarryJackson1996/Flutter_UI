import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music_player/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(MyApp());
}
