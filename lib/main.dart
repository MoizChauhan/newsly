import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsly/app/controller/loading_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly/app/screen/splash_screen.dart';
import 'package:newsly/app/utils/app_assets.dart';
import 'package:newsly/app/utils/app_colors.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

LoadingController loadingcontroller = Get.put(LoadingController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            title: 'Chunaw',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: getMaterialColor(AppColors.primaryColor),
            ),
            defaultTransition: Transition.cupertino,
            builder: (context, child) {
              return Stack(
                children: [
                  child!,
                  Obx(
                    () => loadingcontroller.loading.value
                        ? Container(
                            color: Colors.grey.withOpacity(0.4),
                            child:
                                //  Column(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                Center(
                              child: LottieBuilder.asset(
                                AppAssets.loadingAnim,
                                height: 230.h,
                                width: 230.w,
                              ),
                            ),
                            // AppButton(
                            //     onPressed: () {
                            //       loadingcontroller.updateLoading(false);
                            //     },
                            //     buttonText: "Stop Loading")
                            //   ],
                            // ),
                          )
                        : Container(),
                  ),
                  Obx(
                    () => !loadingcontroller.internet.value
                        ? SafeArea(
                            top: false,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 25,
                                color: Colors.red.withOpacity(0.8),
                                child:
                                    //  Column(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   children: [
                                    Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                        width: 10,
                                        child: CircularProgressIndicator(
                                          color: AppColors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Please Connect To Internet",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 10,
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                                // AppButton(
                                //     onPressed: () {
                                //       loadingcontroller.updateLoading(false);
                                //     },
                                //     buttonText: "Stop Loading")
                                //   ],
                                // ),
                              ),
                            ),
                          )
                        : Container(),
                  )
                ],
              );
            },
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
