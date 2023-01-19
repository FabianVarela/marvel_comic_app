// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterListModel _$CharacterListModelFromJson(Map<String, dynamic> json) =>
    CharacterListModel(
      data: CharactersData.fromJson(json['data'] as Map<String, dynamic>),
    );

CharactersData _$CharactersDataFromJson(Map<String, dynamic> json) =>
    CharactersData(
      results: (json['results'] as List<dynamic>)
          .map((e) => CharactersResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CharactersResult _$CharactersResultFromJson(Map<String, dynamic> json) =>
    CharactersResult(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: CharacterThumbnail.fromJson(
          json['thumbnail'] as Map<String, dynamic>),
      resourceURI: json['resourceURI'] as String,
    );

CharacterThumbnail _$CharacterThumbnailFromJson(Map<String, dynamic> json) =>
    CharacterThumbnail(
      path: json['path'] as String,
      extension: json['extension'] as String,
    );
