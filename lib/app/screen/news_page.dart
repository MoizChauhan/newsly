import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsly/app/controller/home_controller.dart';
import 'package:newsly/app/model/article_model.dart';
import 'package:newsly/app/shimmer/breaking_news_shimmer.dart';
import 'package:newsly/app/shimmer/mini_card_shimmer.dart';
import 'package:newsly/app/shimmer/top_headline_shimmer.dart';
import 'package:newsly/app/utils/app_routes.dart';
import 'package:newsly/app/widgets/app_seach_bar.dart';
import 'package:newsly/app/widgets/custom_tag.dart';
import 'package:newsly/app/widgets/image_container.dart';
import 'package:newsly/app/widgets/mini_news_card.dart';
import 'package:newsly/app/widgets/no_data_widget.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: homeController.scrollController,
      child: Column(
        // padding: EdgeInsets.zero,
        children: [
          Obx(() => homeController.gettingTop.value
              ? topHeadlineShimmer(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0))
              : _NewsOfTheDay(
                  article: homeController.breakingNewsArticles.isEmpty
                      ? null
                      : homeController.breakingNewsArticles[0])),
          _BreakingNews(homeController: homeController),
          _GeneralNews(homeController: homeController)
        ],
      ),
    );
  }
}

class _GeneralNews extends StatelessWidget {
  const _GeneralNews({
    Key? key,
    required this.homeController,
  }) : super(key: key);
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: Column(
        children: [
          AppSearchBar(
            controller: homeController.searchController,
            onChange: (text) {
              if (text.length > 3) {
                homeController.getAllNews();
              }
            },
          ),
          Obx(
            () => homeController.gettingNews.value
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.horizontal,
                    itemCount: homeController.articles.length,
                    itemBuilder: (context, index) {
                      return MiniCardShimmer();
                    },
                  )
                : Column(
                    children: [
                      homeController.articles.isEmpty
                          ? noDataWidget("No News Available", () {
                              homeController.getAllNews();
                            })
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,

                              physics: NeverScrollableScrollPhysics(),
                              // scrollDirection: Axis.horizontal,
                              itemCount: homeController.articles.length,
                              itemBuilder: (context, index) {
                                return MiniNewsCard(
                                    saved: false,
                                    article: homeController.articles[index]);
                              },
                            ),
                      Obx(() => homeController.hasMoreLoading.value
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CupertinoActivityIndicator(),
                            )
                          : Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                child: Center(
                                    child: Text(homeController.articles.isEmpty
                                        ? ""
                                        : "All data loaded")),
                              ),
                            )),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              // Text('More', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 20),
          Obx(() => homeController.gettingTop.value
              ? BreakingNewsShimmer()
              : SizedBox(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.breakingNewsArticles.isEmpty
                        ? 0
                        : homeController.breakingNewsArticles.length - 1,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        margin: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            AppRoutes.navigateToArticlePage(
                                saved: false,
                                article: homeController
                                    .breakingNewsArticles[index + 1]);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageContainer(
                                width: MediaQuery.of(context).size.width * 0.5,
                                imageUrl: homeController
                                    .breakingNewsArticles[index + 1].imageUrl,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                homeController
                                    .breakingNewsArticles[index + 1].title,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        height: 1.5),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                  '${DateTime.now().difference(homeController.breakingNewsArticles[index + 1].publishedAt).inHours} hours ago',
                                  style: Theme.of(context).textTheme.bodySmall),
                              const SizedBox(height: 5),
                              Text(
                                  'by ${homeController.breakingNewsArticles[index + 1].author}',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )),
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel? article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      imageUrl: article != null ? article!.imageUrl : "",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                'News of the Day',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            article != null ? article!.title : "Error Occured",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold, height: 1.25, color: Colors.white),
          ),
          TextButton(
            onPressed: () {
              AppRoutes.navigateToArticlePage(article: article!, saved: false);
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Row(
              children: [
                Text(
                  'Learn More',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
