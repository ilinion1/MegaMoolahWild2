import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';

class SFEDailyPageSEF extends StatefulWidget {
  const SFEDailyPageSEF({super.key});

  @override
  State<SFEDailyPageSEF> createState() => _SFEDailyPageSEFState();
}

class _SFEDailyPageSEFState extends State<SFEDailyPageSEF> {
  bool opened = false;

  Widget giveMoneyWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '+50',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10.w),
            Image.asset(AppImagesEWR.moneyGFD, width: 22.w),
          ],
        ),
        Image.asset(AppImagesEWR.openedChestFSE, width: 100.w),
      ],
    );
  }

  Widget dailyClosedWidget(String formattedDuration) {
    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: Center(
        child: Text(
          'Next Reward in $formattedDuration',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = FSDFSettingsProviderESF.watch(context).model;
    final difference = model.dateTime.difference(DateTime.now());
    final myDuration = (const Duration(days: 1) + difference);
    final formattedDuration =
        "${myDuration.inHours}:${(myDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(myDuration.inSeconds % 60).toString().padLeft(2, '0')}";

    final decoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: (difference.inDays < -1)
            ? [
                const Color(0xFF008790),
                const Color(0xFF005570),
              ]
            : [
                const Color(0xFF7D7D7D),
                const Color(0xFF24383F),
              ],
      ),
      borderRadius: BorderRadius.circular(30.r),
    );
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImagesEWR.background1ERW),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          toolbarHeight: 120.h,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Image.asset(AppImagesEWR.leftArrowGSRG, width: 36.w),
            ),
          ),
          title: Text(
            'Daily Reward',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: DecoratedBox(
            decoration: decoration,
            child: SizedBox(
              // height: 164.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15.h),
                  Text(
                    'Daily Reward',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  // text: (difference.inDays >= -1)
                  //   ? 'Next Daily Reward in $formattedDuration'
                  //   : 'Daily Reward',
                  if (difference.inDays >= -1)
                    dailyClosedWidget(formattedDuration),
                  if (!opened && difference.inDays < -1)
                    Column(
                      children: [
                        SizedBox(
                          width: 280.w,
                          child: Text(
                            'Open the box and find out what you won!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            opened = true;
                            setState(() {});
                            await Future.delayed(const Duration(seconds: 2));
                            opened = false;
                            await model.setDateTime();
                            await model.setMoney(20);
                            if (!mounted) return;
                            setState(() {});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImagesEWR.chestGDF, width: 100.w),
                              SizedBox(height: 10.h),
                              Image.asset(AppImagesEWR.chestGDF, width: 100.w),
                              SizedBox(height: 10.h),
                              Image.asset(AppImagesEWR.chestGDF, width: 100.w),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (opened && difference.inDays < -1) giveMoneyWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
