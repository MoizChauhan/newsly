import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsly/app/controller/local_controller.dart';
import 'package:newsly/app/shimmer/mini_card_shimmer.dart';
import 'package:newsly/app/widgets/app_seach_bar.dart';
import 'package:newsly/app/widgets/mini_news_card.dart';
import 'package:newsly/app/widgets/no_data_widget.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final LocalController localController = Get.find<LocalController>(tag: "app");
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AppSearchBar(
                controller: searchController,
                onChange: (text) {
                  text = text.toLowerCase();
                  localController.articlesForDisplay =
                      localController.articles.where((item) {
                    var itemName = item.description.toLowerCase();
                    return itemName.contains(text);
                  }).toList();
                  Get.forceAppUpdate();
                },
              ),
            ),
            _SavedNews(localController: localController),
          ],
        ),
      ),
    );
  }
}

class _SavedNews extends StatelessWidget {
  const _SavedNews({
    Key? key,
    required this.localController,
  }) : super(key: key);
  final LocalController localController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Obx(
            () => localController.loadNews.value
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return MiniCardShimmer();
                    },
                  )
                : Column(
                    children: [
                      if (localController.articles.isEmpty)
                        SizedBox(height: 200),
                      localController.articles.isEmpty
                          ? Center(
                              child: noDataWidget("No News Available", () {
                                localController.getSavedNews();
                              }),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,

                              physics: NeverScrollableScrollPhysics(),
                              // scrollDirection: Axis.horizontal,
                              itemCount:
                                  localController.articlesForDisplay.length,
                              itemBuilder: (context, index) {
                                return MiniNewsCard(
                                    saved: true,
                                    article: localController
                                        .articlesForDisplay[index]);
                              },
                            ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
