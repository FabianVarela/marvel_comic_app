import 'package:json_annotation/json_annotation.dart';

part 'character_list_model.g.dart';

@JsonSerializable(createToJson: false)
class CharacterListModel {
  CharacterListModel({required this.data});

  factory CharacterListModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterListModelFromJson(json);

  final CharactersData data;
}

@JsonSerializable(createToJson: false)
class CharactersData {
  CharactersData({required this.results});

  factory CharactersData.fromJson(Map<String, dynamic> json) =>
      _$CharactersDataFromJson(json);

  final List<CharactersResult> results;
}

@JsonSerializable(createToJson: false)
class CharactersResult {
  CharactersResult({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.resourceURI,
  });

  factory CharactersResult.fromJson(Map<String, dynamic> json) =>
      _$CharactersResultFromJson(json);

  final int id;
  final String name;
  final String description;
  final CharactersThumbnail thumbnail;
  final String resourceURI;
}

@JsonSerializable(createToJson: false)
class CharactersThumbnail {
  CharactersThumbnail({required this.path, required this.extension});

  factory CharactersThumbnail.fromJson(Map<String, dynamic> json) =>
      _$CharactersThumbnailFromJson(json);

  final String path;
  final String extension;
}
