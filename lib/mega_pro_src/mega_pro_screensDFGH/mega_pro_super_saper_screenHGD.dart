import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_buttonRETH.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_snackbarQSX.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_text_fieldYTR.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_gapEWR.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_help_screenFDS.dart';

enum SFESaperItemsSEG { friend, enemy }

class GESSuperSaperScreenSEG extends StatefulWidget {
  const GESSuperSaperScreenSEG({super.key});

  @override
  State<GESSuperSaperScreenSEG> createState() => _GESSuperSaperScreenSEGState();
}

class _GESSuperSaperScreenSEGState extends State<GESSuperSaperScreenSEG> {
  late final List<SFESaperItemsSEG?> items;
  List<bool> opened = List.generate(25, (index) => false);

  int money = 0;
  int friends = 0;
  bool isGameStarted = false;

  @override
  void initState() {
    super.initState();
    items = List.generate(3, (index) => SFESaperItemsSEG.enemy);
    items.addAll(List.generate(12, (index) => SFESaperItemsSEG.friend));
    items.addAll(List.generate(10, (index) => null));
    items.shuffle();
  }

  void restartGame() {
    money = 0;
    friends = 0;
    isGameStarted = false;
    opened = List.filled(25, false);
    items.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final model = FSDFSettingsProviderESF.watch(context).model;
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImagesEWR.background3RWF),
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
          centerTitle: true,
          title: Text(
            'Obstacle trail',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => SFEHelpScreenSEF(
                      background: AppImagesEWR.background3RWF,
                      title: 'Rules',
                      subtitles: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You must collect all the diamonds that are hidden on this field.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Image.asset(
                              'mega_assets/mega_images/mega_profriend.png',
                              width: 36.w),
                          SizedBox(height: 10.h),
                          Text(
                            'For each diamond, you will receive x0.2 to your bet.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'But there are also traps on the field, and if you fall into them, your bet will be burned.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Image.asset(
                              'mega_assets/mega_images/mega_proenemy.png',
                              width: 36.w),
                          SizedBox(height: 10.h),
                          Text(
                            'Be careful and very careful. Let\'s hit the road!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
        body: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.h,
                mainAxisExtent: 65.h,
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                if (opened[index]) {
                  final item = items[index];
                  return Image.asset(
                    'mega_assets/mega_images/mega_pro${item == null ? 'empty' : item.name}.png',
                    fit: BoxFit.contain,
                  );
                } else {
                  return GestureDetector(
                    onTap: () async {
                      if (!isGameStarted) return;
                      opened[index] = true;
                      setState(() {});
                      if (items[index] == SFESaperItemsSEG.enemy) {
                        log('Game over');
                        restartGame();
                        showDialog(
                          context: context,
                          barrierColor: Colors.black87,
                          builder: (context) => const SEGWinOrLoseDialogSEG(
                            won: false,
                            money: 0,
                          ),
                        );
                      } else if (items[index] == SFESaperItemsSEG.friend) {
                        log('x0.2');
                        friends++;
                        setState(() {});
                        if (friends == 12) {
                          final totalMoney =
                              (money + friends * 0.2 * money).toInt();
                          await model.setMoney(totalMoney);
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            FGDCustomSnackbarDFG.eSAcallSnackbarDSF(
                                totalMoney, context),
                          );
                          restartGame();
                          if (!mounted) return;
                          showDialog(
                            context: context,
                            barrierColor: Colors.black87,
                            builder: (context) => SEGWinOrLoseDialogSEG(
                              won: true,
                              money: totalMoney,
                            ),
                          );
                        }
                      }
                    },
                    child: Image.asset(
                      'mega_assets/mega_images/mega_proclosed_saper.png',
                      fit: BoxFit.contain,
                    ),
                  );
                }
              },
            ),
            SWEGapWER.heightRWE(14.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('mega_assets/mega_images/mega_profriend.png',
                    width: 65.w),
                Text(
                  '${12 - friends}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset('mega_assets/mega_images/mega_proleft_field.png',
                    width: 155.w),
                Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset('mega_assets/mega_images/mega_proenemy.png',
                    width: 65.w),
              ],
            ),
          ],
        ),
        bottomSheet: SizedBox(
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
                      if (isGameStarted) {
                        final totalMoney =
                            (this.money + friends * 0.2 * this.money).toInt();
                        await model.setMoney(totalMoney);
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          FGDCustomSnackbarDFG.eSAcallSnackbarDSF(
                              totalMoney, context),
                        );
                        restartGame();
                      } else {
                        await model.setMoney(-money);
                        isGameStarted = true;
                        this.money = money;
                        setState(() {});
                      }
                    },
                    text: isGameStarted
                        ? 'Receive: ${(money + friends * 0.2 * money).toInt()}'
                        : null,
                  ),
                  SWEGapWER.heightRWE(10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SEGWinOrLoseDialogSEG extends StatelessWidget {
  const SEGWinOrLoseDialogSEG({
    super.key,
    required this.won,
    required this.money,
  });

  final bool won;
  final int money;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'mega_assets/mega_images/mega_pro${won ? 'saper_won_dialog' : 'lose_dialog'}.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SWEGapWER.heightRWE(won ? 200.h : 100.h),
            Text(
              won ? 'Big Win!' : 'Game over',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 25.sp,
              ),
            ),
            SWEGapWER.heightRWE(18.h),
            if (won)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImagesEWR.moneyGFD, width: 24.w),
                  SWEGapWER.widthERW(6.w),
                  Text(
                    '$money',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            if (!won)
              Text(
                'You\'re trapped',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            SWEGapWER.heightRWE(18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GFDCustomButtonFDS(
                text: won ? 'Continue' : 'Try Again',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
