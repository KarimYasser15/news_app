import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/routes_manager.dart';
import 'package:news_app/features/news/articles/data/models/articles_response/article.dart';

import '../../../../config/theme/app_styles.dart';

class ArticlesItemWidget extends StatelessWidget {
  const ArticlesItemWidget({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, RoutesManager.articleDetails,
            arguments: article),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              article.source?.name ?? "",
              style: AppStyles.articleSource,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              article.title ?? "",
              style: AppStyles.articleTitle,
            ),
            SizedBox(
              height: 4.h,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                article.publishedAt ?? "",
                style: AppStyles.publishedAt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
