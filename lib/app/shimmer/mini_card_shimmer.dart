import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newsly/app/utils/app_colors.dart';
import 'package:newsly/app/widgets/shimmer_widget.dart';

class MiniCardShimmer extends StatelessWidget {
  const MiniCardShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(233, 233, 233, 1),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: shimmerWidget(
        child: Row(
          children: [
            shimmerWidget(
              child: Container(
                height: ScreenUtil().setHeight(125.0),
                width: ScreenUtil().setWidth(125.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                  SizedBox(
                    height: 5.0,
                  ),
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
                  SizedBox(
                    height: 10.0,
                  ),
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
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: Get.width / 5,
                        child: shimmerWidget(
                          child: Container(
                            height: 9,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: Get.width * 0.5,
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
                        width: Get.width / 4.5,
                        child: shimmerWidget(
                          child: Container(
                            height: 9,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: Get.width * 0.5,
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
