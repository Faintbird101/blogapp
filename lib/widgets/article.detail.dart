import 'package:currency_api_converter/models/album.dart';
import 'package:currency_api_converter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final ArticleModel article;
  const DetailsPage({
    super.key,
    required this.article,
  });

  // ArticleController controller = Get.find<ArticleController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailsPage'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(article.urlToImage!),
          const SizedBox(height: 8),
          IconAndDetail(
          Icons.calendar_today, '${article.publishedAt}'.substring(0, 9)),
          IconAndDetail(Icons.person, '${article.author}'),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          Header("${article.title}"),
          Paragraph(
            '${article.content}',
          ),
        ],
      ),
    );
  }
}
