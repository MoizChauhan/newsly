import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsly/app/shimmer/top_headline_shimmer.dart';
import 'package:newsly/app/utils/app_colors.dart';
import 'package:newsly/app/widgets/shimmer_widget.dart';

class BreakingNewsShimmer extends StatelessWidget {
  const BreakingNewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topHeadlineShimmer(
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                const SizedBox(height: 10),
                shimmerWidget(
                  child: Container(
                    height: 9,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: Get.width * 0.5,
                  ),
                ),
                const SizedBox(height: 5),
                shimmerWidget(
                  child: Container(
                    height: 9,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: Get.width * 0.2,
                  ),
                ),
                const SizedBox(height: 5),
                shimmerWidget(
                    child: Container(
                  height: 9,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: Get.width * 0.28,
                )),
                const SizedBox(height: 5),
                shimmerWidget(
                    child: Container(
                  height: 9,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: Get.width * 0.35,
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}
