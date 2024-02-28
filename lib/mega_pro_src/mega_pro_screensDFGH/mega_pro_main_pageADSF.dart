import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_buttonRETH.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_icon_buttonRTN.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_level_pageDSF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_rules_pageDSAF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_settings_pageASDF.dart';

class SEFMainPageSFE extends StatelessWidget {
  const SEFMainPageSFE({super.key});

  @override
  Widget build(BuildContext context) {
    final model = FSDFSettingsProviderESF.watch(context).model;
    final difference = model.dateTime.difference(DateTime.now());
    final myDuration = (const Duration(days: 1) + difference);
    final formattedDuration =
        "${myDuration.inHours}:${(myDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(myDuration.inSeconds % 60).toString().padLeft(2, '0')}";

    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImagesEWR.splashEWR),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DASCustomIconButtonDSF(
                    icon: AppImagesEWR.settingsGHT,
                    onPressed: () {
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FSDFSettingsProviderESF(
                            model: model,
                            child: const SEGRSettingsPageSEF(),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 22),
                ],
              ),
              const SizedBox(height: 165),
              GFDCustomButtonFDS(
                onPressed: () {
                  if (difference.inDays >= -1) return;
                  showDialog(
                    context: context,
                    builder: (context) => SFGDailyLoginWidgetSGR(
                      child: EFSContentWidgetSEFG(
                        model: model,
                      ),
                    ),
                  );
                },
                text: (difference.inDays >= -1)
                    ? 'Next Daily Reward in $formattedDuration'
                    : 'Daily Reward',
                buttonType: 'daily',
              ),
              const SizedBox(height: 25),
              GFDCustomButtonFDS(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FSDFSettingsProviderESF(
                      model: model,
                      child: const SFELevelMapSEF(),
                    ),
                  ),
                ),
                text: 'Play',
              ),
              const SizedBox(height: 25),
              GFDCustomButtonFDS(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RulesPage(),
                  ),
                ),
                text: 'Rules',
              ),
              const SizedBox(height: 108),
            ],
          ),
        ),
      ),
    );
  }
}

class SFGDailyLoginWidgetSGR extends StatelessWidget {
  const SFGDailyLoginWidgetSGR({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: 170.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            width: 344.w,
            height: 268.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  AppImagesEWR.dailyLoginDialogGS,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: 45.h,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      color: Colors.black.withAlpha(0),
                      width: 60.w,
                      height: 60.w,
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EFSContentWidgetSEFG extends StatelessWidget {
  const EFSContentWidgetSEFG({
    super.key,
    required this.model,
  });

  final DSFSettingsControllerFSDF model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 100.w,
      ),
      child: Column(
        children: [
          Text(
            'Daily Reward!',
            style: TextStyle(
              fontSize: 28.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Open the chest and find out what you won!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 29.h),
          GestureDetector(
            onTap: () async {
              await model.setDateTime();
              final rand = Random();
              final number = rand.nextInt(3);
              if (!context.mounted) return;
              Navigator.pop(context);
              if (number == 0) {
                print('lose');
                showDialog(
                  context: context,
                  builder: (context) => const SFGDailyLoginWidgetSGR(
                    child: SRGWinOrLoseWidgetSEGR(
                      text: 'Try again later',
                      image: AppImagesEWR.openedChestFSE,
                    ),
                  ),
                );
                return;
              }
              showDialog(
                context: context,
                builder: (context) => const SFGDailyLoginWidgetSGR(
                  child: SRGWinOrLoseWidgetSEGR(
                    text: '+20 bonuses',
                    image: AppImagesEWR.dailyMoneyGSE,
                  ),
                ),
              );
              await model.setMoney(20);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Image.asset(
                    AppImagesEWR.chestGDF,
                    width: 98.w,
                    height: 98.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SRGWinOrLoseWidgetSEGR extends StatelessWidget {
  const SRGWinOrLoseWidgetSEGR({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 120.h),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 28.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Image.asset(
              image,
              width: 250.w,
              height: 250.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
