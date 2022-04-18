import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_guide/utils/converter.dart';

class MarvelApi {
  static const baseUrl = 'gateway.marvel.com';
  static final publicKey = dotenv.env['PUBLIC_KEY'] ?? '';
  static final privateKey = dotenv.env['PRIVATE_KEY'] ?? '';

  var client = http.Client();

  Future<dynamic> getHeroes({String? name, int offset=0}) async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String rawParams = timestamp + privateKey + publicKey;
    String md5 = Converter.textToMd5(rawParams);

    var params = {
      'ts': timestamp,
      'apikey': publicKey,
      'hash': md5,
      'offset': offset.toString(),
    };

    if(name != null) {
      params['nameStartsWith'] = name;
    }

    var endpoint = Uri.https(baseUrl, '/v1/public/characters', params);

    try {
      var response = await client.get(endpoint);
      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);
       
        return decodedJson['data'];
      }
    } catch (e) {
      return []; // RETORNAR NULL
    }

    return [];
  }

  Future<List<dynamic>> getComics() async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String rawParams = timestamp + privateKey + publicKey;
    String md5 = Converter.textToMd5(rawParams);

    var params = {
      'ts': timestamp,
      'apikey': publicKey,
      'hash': md5,
    };

    var endpoint = Uri.https(baseUrl, '/v1/public/comics', params);

    try {
      var response = await client.get(endpoint);
      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);
        var comicsList = decodedJson['data']['results'] as List<dynamic>;

        return comicsList;
      }
    } catch (e) {
      return [];
    }

    return [];
  }
}
