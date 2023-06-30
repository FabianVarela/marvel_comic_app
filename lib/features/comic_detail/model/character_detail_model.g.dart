// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      data: CharacterData.fromJson(json['data'] as Map<String, dynamic>),
    );

CharacterData _$CharacterDataFromJson(Map<String, dynamic> json) =>
    CharacterData(
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CharacterResult _$CharacterResultFromJson(Map<String, dynamic> json) =>
    CharacterResult(
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
