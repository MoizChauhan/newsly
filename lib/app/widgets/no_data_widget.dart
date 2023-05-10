import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsly/app/utils/app_colors.dart';

Widget noDataWidget(String title, onPressed) {
  return SizedBox(
    width: Get.width,
    height: Get.height * 0.1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: AppColors.primaryColor),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            iconSize: 20,
            splashColor: AppColors.primaryColor,
            icon: Icon(Icons.refresh, color: AppColors.white),
            tooltip: 'Refresh',
            onPressed: onPressed,
          ),
        ),
      ],
    ),
  );
}
