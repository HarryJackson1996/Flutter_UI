import 'dart:convert';

Albums albumsFromJson(String str) => Albums.fromJson(json.decode(str));

String albumsToJson(Albums data) => json.encode(data.toJson());

class Albums {
  Albums({
    required this.albums,
  });

  final List<Album>? albums;

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        albums: json["albums"] == null ? null : List<Album>.from(json["albums"].map((x) => Album.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "albums": albums == null ? null : List<dynamic>.from(albums!.map((x) => x.toJson())),
      };
}

class Album {
  Album({
    this.name,
    this.description,
    this.songs,
  });

  final String? name;
  final String? description;
  final List<Song>? songs;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        songs: json["songs"] == null ? null : List<Song>.from(json["songs"].map((x) => Song.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "songs": songs == null ? null : List<dynamic>.from(songs!.map((x) => x.toJson())),
      };
}

class Song {
  Song({
    this.name,
    this.authors,
    this.image,
    required this.audio,
  });

  final String? name;
  final List<String>? authors;
  final String? image;
  final String? audio;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        name: json["name"] == null ? null : json["name"],
        authors: json["authors"] == null ? null : List<String>.from(json["authors"].map((x) => x)),
        image: json["image"] == null ? null : json["image"],
        audio: json["audio"] == null ? null : json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "authors": authors == null ? null : List<dynamic>.from(authors!.map((x) => x)),
        "image": image == null ? null : image,
        "audio": audio == null ? null : audio,
      };
}
