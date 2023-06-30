import 'dart:convert';

import 'package:marvel_comic_app/features/comic_list/model/character_list_model.dart';

const jsonResponse = '''
    {
      "code":200,
      "status":"Ok",
      "data":{
        "results":[{
          "id":1011334,
          "name":"3-D Man",
          "description":"",
          "thumbnail":{
            "path":"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
            "extension":"jpg"
          },
          "resourceURI":"http://gateway.marvel.com/v1/public/characters/1011334"
        }]
      }
    }
    ''';

CharacterListModel getCharacterList() {
  final characterMap = jsonDecode(jsonResponse) as Map<String, dynamic>;
  return CharacterListModel.fromJson(characterMap);
}
