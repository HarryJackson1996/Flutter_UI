import 'package:flutter_music_player/clients/mock_music_client.dart';
import 'package:flutter_music_player/models/albums.dart';

class MusicRepository {
  late MockMusicClient _mockMusicClient;

  MusicRepository() {
    this._mockMusicClient = MockMusicClient();
  }

  Future<Albums> fetchAlbums() async {
    Albums remoteAlbums;
    try {
      remoteAlbums = await _mockMusicClient.fetchAlbums();
      return remoteAlbums;
    } catch (e) {
      rethrow;
    }
  }
}
