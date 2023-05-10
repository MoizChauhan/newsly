import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsly/app/controller/local_controller.dart';
import 'package:newsly/app/model/article_model.dart';
import 'package:newsly/app/utils/app_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/custom_tag.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key, required this.article, required this.saved})
      : super(key: key);
  final ArticleModel article;
  final bool saved;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          _NewsHeadline(article: article, saved: saved),
          _NewsBody(article: article)
        ],
      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomTag(
                backgroundColor: Colors.black,
                children: [
                  Text(
                    article.source.name ?? "",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  const Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${DateTime.now().difference(article.publishedAt).inHours}h',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            article.description,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            article.content,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              launchUrlString(article.url);
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Row(
              children: [
                Text(
                  'Read More',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.blue.shade900,
                      ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.blue.shade900,
                ),
              ],
            ),
          ),
          SizedBox(height: 300)
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  final LocalController localController = Get.find<LocalController>(tag: "app");
  _NewsHeadline({
    Key? key,
    required this.article,
    required this.saved,
  }) : super(key: key);
  final bool saved;
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          image: DecorationImage(
              image: NetworkImage(
                article.imageUrl,
              ),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (saved) {
                      localController.removeNews(article.key);
                    } else {
                      localController.addNews(article.toJson());
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        saved ? Icons.delete : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            // CustomTag(
            //   backgroundColor: Colors.grey.withAlpha(150),
            //   children: [
            //     Text(
            //       article.author,
            //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //             color: Colors.white,
            //           ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 10),
            // Text(
            //   article.title,
            //   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white,
            //         height: 1.25,
            //       ),
            // ),
            const SizedBox(height: 10),
            Text(
              article.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
