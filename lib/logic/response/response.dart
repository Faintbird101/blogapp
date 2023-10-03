import 'dart:convert';

import 'package:currency_api_converter/constants/uri.constats.dart';
import 'package:currency_api_converter/models/album.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Load album');
  }
}

Future<List<Images>> fetchImages() async {
  final response = await http.get(Uri.parse(imageUrl));
  final List body = json.decode(response.body);

  if (response.statusCode == 200) {
    return body.map((e) => Images.fromJson(e)).toList();
  } else {
    throw Exception('Failed to Load album');
  }
}

Future<List<ArticleModel>> fetchArticles() async {
  final response = await http.get(Uri.parse(articleUrl));
  final List article = json.decode(response.body);

  if (response.statusCode == 200) {
    return article.map((e) => ArticleModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to Load album');
  }
}

Future<Everything> fetchNews() async {
  final response = await http.get(Uri.parse(articleUrl));

  if (response.statusCode == 200) {
    return Everything.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Load album');
  }
}

