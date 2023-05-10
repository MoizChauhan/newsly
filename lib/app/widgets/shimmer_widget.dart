import 'package:flutter/material.dart';
import 'package:newsly/app/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerWidget({required Widget child}) {
  return Shimmer.fromColors(
      baseColor: AppColors.baseColor,
      highlightColor: AppColors.highlightColor,
      child: child);
}
