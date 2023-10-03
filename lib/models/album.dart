//First, create an Album class that contains the data from the network request.
// It includes a factory constructor that creates an Album from JSON.

import 'dart:developer';

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class Images {
  final int id;
  final String title;
  final int albumId;
  final String url;
  final String thumbnailUrl;

  const Images({
    required this.url,
    required this.thumbnailUrl,
    required this.albumId,
    required this.id,
    required this.title,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

class Everything {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  Everything({
    required this.articles,
    required this.status,
    required this.totalResults,
  });

  factory Everything.fromJson(Map<String, dynamic> everything) {
    var list = everything['articles'] as List;
    log(list.runtimeType.toString());
    List<ArticleModel> articleList =
        list.map((i) => ArticleModel.fromJson(i)).toList();

    return Everything(
      status: everything['status'],
      totalResults: everything['totalResults'],
      articles: articleList,
    );
  }
}

class Source {
  final int id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> source) {
    return Source(
      id: source['id'],
      name: source['name'],
    );
  }
}

class ArticleModel {
  // final Source source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleModel({
    // required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      // source: Source.fromJson(map['source']),
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }
}
