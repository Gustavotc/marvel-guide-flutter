import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_guide/utils/converter.dart';

class MarvelApi {
  static const baseUrl = 'gateway.marvel.com';
  static final publicKey = dotenv.env['PUBLIC_KEY'] ?? '';
  static final privateKey = dotenv.env['PRIVATE_KEY'] ?? '';

  var client = http.Client();

  Future<dynamic> getHeroes({String? name, int offset = 0}) async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String rawParams = timestamp + privateKey + publicKey;
    String md5 = Converter.textToMd5(rawParams);

    var params = {
      'ts': timestamp,
      'apikey': publicKey,
      'hash': md5,
      'offset': offset.toString(),
      'limit': '50',
    };

    if (name != null) {
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
      return null;
    }

    return null;
  }

  Future<dynamic> getComics({offset = 0}) async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String rawParams = timestamp + privateKey + publicKey;
    String md5 = Converter.textToMd5(rawParams);

    var params = {
      'ts': timestamp,
      'apikey': publicKey,
      'hash': md5,
      'offset': offset.toString(),
      'limit': '42',
      'orderBy': '-focDate',
    };

    var endpoint = Uri.https(baseUrl, '/v1/public/comics', params);

    try {
      var response = await client.get(endpoint);
      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);
        return decodedJson['data'];
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  Future<dynamic> getHeroComics(int id, {offset = 0}) async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String rawParams = timestamp + privateKey + publicKey;
    String md5 = Converter.textToMd5(rawParams);

    var params = {
      'ts': timestamp,
      'apikey': publicKey,
      'hash': md5,
      'offset': offset.toString(),
      'orderBy': '-focDate',
    };

    var endpoint =
        Uri.https(baseUrl, '/v1/public/characters/$id/comics', params);

    try {
      var response = await client.get(endpoint);
      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);
        return decodedJson['data'];
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  Future<dynamic> getItemsById(List<int> ids,
      {String path = 'characters'}) async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String rawParams = timestamp + privateKey + publicKey;
    String md5 = Converter.textToMd5(rawParams);

    var params = {
      'ts': timestamp,
      'apikey': publicKey,
      'hash': md5,
    };

    var results = [];

    for (var id in ids) {
      var endpoint = Uri.https(baseUrl, '/v1/public/$path/$id', params);

      try {
        var response = await client.get(endpoint);
        if (response.statusCode == 200) {
          var decodedJson = json.decode(response.body);
          results.add(decodedJson['data']['results'][0]);
        }
      } catch (e) {
        return null;
      }
    }

    return results;
  }
}
