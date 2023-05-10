import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newsly/app/model/article_model.dart';
import 'package:newsly/app/utils/app_routes.dart';

class MiniNewsCard extends StatelessWidget {
  const MiniNewsCard({super.key, required this.article, required this.saved});
  final ArticleModel article;
  final bool saved;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutes.navigateToArticlePage(article: article, saved: saved);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 1),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Container(
              height: ScreenUtil().setHeight(125.0),
              width: ScreenUtil().setWidth(125.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(233, 233, 233, 1),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                      article.imageUrl,
                    ),
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    article.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color.fromRGBO(139, 144, 165, 1),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "${DateTime.now().difference(article.publishedAt).inHours} hours ago",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      Container(
                        width: Get.width / 4,
                        child: Text(
                          article.author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromRGBO(251, 89, 84, 1),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
