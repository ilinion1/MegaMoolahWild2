import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_buttonRETH.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_settings_pageASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_gameDASF/mega_pro_gameTYR.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_super_saper_screenHGD.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_wheel_game_screenDFGH.dart';

class RGSMainScreenSEF extends StatelessWidget {
  const RGSMainScreenSEF({super.key});

  Widget openScreen(int index) {
    return switch (index) {
      0 => const SEFMyGameFESF(),
      1 => const GESSuperSaperScreenSEG(),
      2 => const FGRWheelGameScreenSGE(),
      _ => const SizedBox(),
    };
  }

  String nameScreens(int index) {
    return switch (index) {
      0 => 'Magic Cards',
      1 => 'Obstacle trail',
      2 => 'Wheel of Fortune',
      _ => 'Magic Cards',
    };
  }

  @override
  Widget build(BuildContext context) {
    final model = FSDFSettingsProviderESF.watch(context).model;
    return PopScope(
      canPop: false,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImagesEWR.background1ERW),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 80.h,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                SizedBox(width: 16.w),
                Image.asset(AppImagesEWR.logoGDRT, width: 83.w),
              ],
            ),
            actions: [
              Row(
                children: [
                  Image.asset(AppImagesEWR.moneyGFD, width: 22.w),
                  SizedBox(width: 4.w),
                  Text(
                    '${model.money}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SEGRSettingsPageSEF(),
                      ),
                    ),
                    icon: Image.asset(AppImagesEWR.settingsGHT, width: 36.w),
                  ),
                  SizedBox(width: 16.w),
                ],
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: <Widget>[
                  ...List.generate(
                    3,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      child: Stack(
                        children: [
                          Image.asset(
                            'mega_assets/mega_images/mega_progame_${index + 1}.png',
                            width: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 17.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nameScreens(index),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                  // style: (index == 1)
                                  //     ? AppTextStyles.header16.copyWith(
                                  //         color: Colors.black,
                                  //       )
                                  //     : AppTextStyles.header16,
                                ),
                                SizedBox(
                                  width: 100.w,
                                  height: 50.h,
                                  child: GFDCustomButtonFDS(
                                    text: 'Play',
                                    buttonType: 'level',
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => openScreen(index),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
