import 'dart:convert';
import 'dart:developer';

import 'package:currency_api_converter/constants/uri.constats.dart';
import 'package:currency_api_converter/logic/response/response.dart';
import 'package:currency_api_converter/models/album.dart';
import 'package:currency_api_converter/widgets/article.tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Everything> products = [];

  late Future<Album> futureAlbum;
  late Future<Everything> futureNews;
  late Future<List<Images>> futureImages;
  late Future<List<ArticleModel>> futureArticle;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
    futureArticle = fetchArticles();
    futureAlbum = fetchAlbum();
    futureImages = fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetched data Sample'),
        elevation: 3,
      ),
      body: Center(
          child: FutureBuilder<Everything>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            // return Text(snapshot.data!.title);
            return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder: (context, index) {
                final image = data.articles[index];
                return ArticleWidget(
                  title: image.title!,
                  description: image.description!,
                  imageUrl: image.urlToImage!,
                  thumbnailUrl: image.publishedAt!,
                );
              },
            );
            // buildPosts(data);
            // buildArticles(data);
            // return ArticleWidget(
            //   title: data.title,
            //   description: data.thumbnailUrl,
            //   imageUrl: data.url,
            //   thumbnailUrl: data.thumbnailUrl,
            // );
          } else if (snapshot.hasError) {
            log('${snapshot.error}');
            return IconButton(onPressed: () {}, icon: Icon(Icons.refresh));
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}

Widget buildPosts(List<Images> images) {
  return ListView.builder(
    itemCount: images.length,
    itemBuilder: (context, index) {
      final image = images[index];
      return ArticleWidget(
        title: image.title,
        description: image.thumbnailUrl,
        imageUrl: image.url,
        thumbnailUrl: image.thumbnailUrl,
      );
    },
  );
}

// Widget buildNews(List<Everything> news) {
//   return ListView.builder(
//     itemCount: news.length,
//     itemBuilder: (context, index) {
//       final mohoro = news[index];
//       return ArticleWidget(
//         title: mohoro.title,
//         description: mohoro.thumbnailUrl,
//         imageUrl: mohoro.url,
//         thumbnailUrl: mohoro.thumbnailUrl,
//       );
//     },
//   );
// }

// Widget buildArticles(List<ArticleModel> article) {
//   return ListView.builder(
//     itemCount: article.length,
//     itemBuilder: (context, index) {
//       final image = article[index];
//       return ArticleWidget(
//         title: image.title,
//         description: image.description,
//         imageUrl: image.url,
//         thumbnailUrl: image.publishedAt,
//       );
//     },
//   );
// }

// Future refresh() async {
//   final url = Uri.parse(articleUrl);
//   final response = await http.get(url);

//   final List article = json.decode(response.body);

//   if (response.statusCode == 200) {
//     return article.map((e) => art.fromJson(e)).toList();
//   } else {
//     throw Exception('Failed to Load album');
//   }
// }
