import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_api_converter/constants/styles.dart';
import 'package:currency_api_converter/models/album.dart';
import 'package:currency_api_converter/widgets/article.detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ArticleWidget extends StatelessWidget {
  final String imageUrl;
  final String thumbnailUrl;
  final String title;
  final String description;
  final void Function()? onPressed;
  final String? author;

  const ArticleWidget({
    Key? key,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.title,
    required this.description,
    this.onPressed,
    this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListTile(
      onTap: () {
        Get.to(
          () => DetailsPage(
            article: ArticleModel(
              author: author,
              title: title,
              description: description,
              url: '',
              urlToImage: imageUrl,
              publishedAt: thumbnailUrl,
              content: '',
            ),
          ),
        );
      },
      leading: _buildImage(context),
      title: Text(
        title,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: $styles.text.h5.copyWith(
          fontSize: 18,
          letterSpacing: 0.6,
        ),
      ),
      subtitle: Text(
        description,
        maxLines: 2,
        style: $styles.text.bodySmall.copyWith(fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        thumbnailUrl.substring(0, 9),
      ),
    );
    // Container(
    //   color: $styles.colors.blackOut,
    //   padding: const EdgeInsetsDirectional.only(
    //     start: 14,
    //     end: 14,
    //     bottom: 14,
    //   ),
    //   height: width / 2.2,
    //   child: Row(
    //     children: [
    //       _buildImage(context),
    //       _buildTitleAndDescription(),
    //     ],
    //   ),
    // );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.08),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: $styles.text.h5.copyWith(
                fontSize: 18,
                letterSpacing: 0.6,
              ),
            ),
            //description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  description,
                  maxLines: 2,
                  style: $styles.text.bodySmall
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),

            //dateTime
            Row(
              children: [
                Icon(
                  MdiIcons.calendarRange,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                SizedBox(
                  height: 20,
                  child: Text(thumbnailUrl.substring(0, 9)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
