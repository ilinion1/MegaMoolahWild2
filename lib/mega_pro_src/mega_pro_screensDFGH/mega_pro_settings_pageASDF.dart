import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_colorsRETY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_snackbarQSX.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_ad_screenWER.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_daily_pageDSAF.dart';

class SEGRSettingsPageSEF extends StatelessWidget {
  const SEGRSettingsPageSEF({super.key});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF008790),
          Color(0xFF005570),
        ],
      ),
      borderRadius: BorderRadius.circular(30.r),
    );
    final model = FSDFSettingsProviderESF.watch(context).model;
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
            'Settings',
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
          child: Column(
            children: [
              DecoratedBox(
                decoration: decoration,
                child: Row(
                  children: [
                    SizedBox(width: 30.w),
                    Text(
                      'Sound',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      inactiveTrackColor: const Color(0xFF003F45),
                      inactiveThumbColor: Colors.grey,
                      activeTrackColor: Colors.white,
                      activeColor: Colors.cyan,
                      trackOutlineColor: const MaterialStatePropertyAll(
                        SDFAppColorsSDF.secondaryColorFSE,
                      ),
                      value: model.sound,
                      onChanged: (value) async {
                        await model.setSound(value);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              DecoratedBox(
                decoration: decoration,
                child: Row(
                  children: [
                    SizedBox(width: 30.w),
                    Text(
                      'Daily Reward',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF003F45),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const SFEDailyPageSEF(),
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              DecoratedBox(
                decoration: decoration,
                child: Row(
                  children: [
                    SizedBox(width: 30.w),
                    Text(
                      'Get coins',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: const Color(0xFF003F45),
                      ),
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ESFAdScreenESF(
                              videoAsset: switch (Random().nextInt(3)) {
                                1 => 'mega_assets/videos/mega_proGameAd1.mp4',
                                2 => 'mega_assets/videos/mega_proGameAd2.mp4',
                                _ => 'mega_assets/videos/mega_proGameAd3.mp4',
                              },
                            ),
                          ),
                        );
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          FGDCustomSnackbarDFG.eSAcallSnackbarDSF(50, context),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
