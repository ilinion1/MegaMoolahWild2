import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_snackbarQSX.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_text_fieldYTR.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_gapEWR.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_block_button_controllerASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_help_screenFDS.dart';

class FGRWheelGameScreenSGE extends StatefulWidget {
  const FGRWheelGameScreenSGE({super.key});

  @override
  State<FGRWheelGameScreenSGE> createState() => _FGRWheelGameScreenSGEState();
}

class _FGRWheelGameScreenSGEState extends State<FGRWheelGameScreenSGE>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  DateTime? dateTime;

  final List<dynamic> items = [
    1.5,
    1,
    10,
    5,
    2.5,
    2,
    1.5,
    1,
    10,
    5,
    2.5,
    2,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(animate);
  }

  @override
  void dispose() async {
    _controller.removeListener(animate);
    _controller.dispose();
    super.dispose();
  }

  void animate() {
    if (!mounted) return;
    setState(() {});
  }

  void _spinWheel(int money) async {
    _controller.repeat();
    final random = Random();
    final nextInt = random.nextInt(1000) + 2000;
    final duration = Duration(milliseconds: nextInt);
    await Future.delayed(duration);
    if (!mounted) return;
    _controller.stop();
    final value = 1 - _controller.value;
    for (int i = 0; i < items.length; i++) {
      if (i / items.length <= value && value <= (i + 1) / items.length) {
        print(items[i]);
        final amount = (items[i] * money).toInt();
        await FSDFSettingsProviderESF.read(context)!.model.setMoney(amount);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          FGDCustomSnackbarDFG.eSAcallSnackbarDSF(amount, context),
        );
      }
    }
    Provider.block.changeBlock(false);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImagesEWR.background2ERW3),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80.h,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(AppImagesEWR.leftArrowGSRG, width: 36.w),
          ),
          title: Text(
            'Wheel of Fortune',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => SFEHelpScreenSEF(
                      background: AppImagesEWR.background2ERW3,
                      title: 'Rules',
                      subtitles: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Spin the wheel and earn bonuses on your bets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Image.asset(
                              'mega_assets/mega_images/mega_promoneys.png',
                              width: 200.w),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Image.asset('mega_assets/mega_images/mega_prorules.png',
                  width: 79.w),
            ),
            SizedBox(width: 16.w),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Image.asset(
                'mega_assets/mega_images/mega_protriangle_wheel.png',
                width: 84.w,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'mega_assets/mega_images/mega_prowheel_center.png',
                    width: double.infinity,
                  ),
                  Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: Container(
                      width: double.infinity,
                      height: 300.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'mega_assets/mega_images/mega_prowheel.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomSheet: const CustomBottomSheet(),
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = FSDFSettingsProviderESF.watch(context).model;
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF008790),
              Color(0xFF005570),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SWEGapWER.heightRWE(22.h),
              Row(
                children: [
                  Text(
                    'Your bet:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Your money: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SWEGapWER.widthERW(4.w),
                  Image.asset(AppImagesEWR.moneyGFD, width: 24.w),
                  SWEGapWER.widthERW(4.w),
                  Text(
                    '${model.money}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SWEGapWER.heightRWE(16.h),
              EWRCustomTextFieldAERW(
                onButtonPressed: (money) async {
                  Provider.block.changeBlock(true);
                  await model.setMoney(-money);
                  if (!context.mounted) return;
                  context
                      .findAncestorStateOfType<_FGRWheelGameScreenSGEState>()!
                      ._spinWheel(money);
                },
              ),
              SWEGapWER.heightRWE(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
