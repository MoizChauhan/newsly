import 'package:flutter/material.dart';
import 'package:newsly/app/utils/app_colors.dart';
import 'package:newsly/app/widgets/shimmer_widget.dart';

Widget topHeadlineShimmer(
    {Key? key,
    double height = 125,
    double borderRadius = 20,
    required double width,
    padding,
    margin}) {
  return shimmerWidget(
    child: Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
