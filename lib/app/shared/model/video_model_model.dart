// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  String kind;
  String etag;
  String id;
  Snippet snippet;

  VideoModel({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
      };
}

class Snippet {
  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String categoryId;
  String liveBroadcastContent;
  Localized localized;
  String defaultAudioLanguage;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.categoryId,
    this.liveBroadcastContent,
    this.localized,
    this.defaultAudioLanguage,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        categoryId: json["categoryId"],
        liveBroadcastContent: json["liveBroadcastContent"],
        localized: Localized.fromJson(json["localized"]),
        defaultAudioLanguage: json["defaultAudioLanguage"],
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "categoryId": categoryId,
        "liveBroadcastContent": liveBroadcastContent,
        "localized": localized.toJson(),
        "defaultAudioLanguage": defaultAudioLanguage,
      };
}

class Localized {
  String title;
  String description;

  Localized({
    this.title,
    this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default standard;
  Default maxres;

  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: Default.fromJson(json["standard"]),
        maxres: Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
        "standard": standard.toJson(),
        "maxres": maxres.toJson(),
      };
}

class Default {
  String url;
  int width;
  int height;

  Default({
    this.url,
    this.width,
    this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}
