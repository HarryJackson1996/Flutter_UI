import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_music_player/models/albums.dart';

class MockMusicClient {
  final String _jsonPath = 'assets/json/albums.json';

  Future<Albums> fetchAlbums() async {
    try {
      final String data = await rootBundle.loadString(_jsonPath);
      return Albums.fromJson(jsonDecode(data));
    } catch (e) {
      throw e;
    }
  }
}
