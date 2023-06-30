import 'package:json_annotation/json_annotation.dart';

part 'character_detail_model.g.dart';

@JsonSerializable(createToJson: false)
class CharacterModel {
  CharacterModel({required this.data});

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  final CharacterData data;
}

@JsonSerializable(createToJson: false)
class CharacterData {
  CharacterData({required this.results});

  factory CharacterData.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataFromJson(json);

  final List<CharacterResult> results;
}

@JsonSerializable(createToJson: false)
class CharacterResult {
  CharacterResult({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.resourceURI,
  });

  factory CharacterResult.fromJson(Map<String, dynamic> json) =>
      _$CharacterResultFromJson(json);

  final int id;
  final String name;
  final String description;
  final CharacterThumbnail thumbnail;
  final String resourceURI;
}

@JsonSerializable(createToJson: false)
class CharacterThumbnail {
  CharacterThumbnail({required this.path, required this.extension});

  factory CharacterThumbnail.fromJson(Map<String, dynamic> json) =>
      _$CharacterThumbnailFromJson(json);

  final String path;
  final String extension;
}
