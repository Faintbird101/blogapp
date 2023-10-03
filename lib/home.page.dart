import 'dart:developer';
import 'package:currency_api_converter/logic/response/response.dart';
import 'package:currency_api_converter/models/album.dart';
import 'package:currency_api_converter/widgets/article.tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        // elevation: 3,
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
                  author: image.author,
                  content: image.content,
                  url: image.url,
                );
              },
            );
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
