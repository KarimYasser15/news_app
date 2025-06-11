import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/config/assets_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/model/articles_response/article.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)?.settings.arguments as Article;
    final Uri url = Uri.parse(article.url!);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage(AssetsManager.homeBackground))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Article Details"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: article.urlToImage!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                article.source!.name!,
                style: AppStyles.articleSource,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                article.title!,
                style: AppStyles.articleTitle,
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    article.publishedAt!,
                    style: AppStyles.publishedAt,
                  )),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 370.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        article.description!,
                        style: AppStyles.articleSource,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          launchUrl(url);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "View Full Article",
                              style: AppStyles.viewArticle,
                            ),
                            const Icon(Icons.arrow_forward)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
