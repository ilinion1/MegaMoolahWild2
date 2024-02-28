import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_colorsRETY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_app_barJYTE.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_buttonRETH.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_money_widgetHJK.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_outline_textUYTI.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_gameDASF/mega_pro_gameTYR.dart';

class SFELevelPointerESF {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  SFELevelPointerESF({
    this.top,
    this.left,
    this.right,
    this.bottom,
  });
}

class SFELevelMapSEF extends StatefulWidget {
  const SFELevelMapSEF({super.key});

  @override
  State<SFELevelMapSEF> createState() => _SFELevelMapSEFState();
}

class _SFELevelMapSEFState extends State<SFELevelMapSEF> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final levelPointers = <SFELevelPointerESF>[
      SFELevelPointerESF(left: 135.w, top: 70.h),
      SFELevelPointerESF(right: 20.w, top: 175.h),
      SFELevelPointerESF(right: 40.w, top: 330.h),
      SFELevelPointerESF(left: 180.w, top: 290.h),
      SFELevelPointerESF(left: 72.w, top: 365.h),
      SFELevelPointerESF(right: 100.w, bottom: 49.h),
    ];
    final moneys = <int?>[
      60,
      50,
      120,
      180,
      220,
      330,
    ];
    final level = FSDFSettingsProviderESF.watch(context).model.level;
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImagesEWR.levelBackgroundWF3),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 40.h),
            const DASCustomAppBarSAD(text: 'Levels'),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: List.generate(
                  6,
                  (index) {
                    if (level > index + 1) {
                      return SFELevelWidgetSEF(
                        text: '${index + 1}',
                        pointer: levelPointers[index],
                        type: 'skiped',
                        levelIndex: index + 1,
                        money: moneys[index],
                        currentIndex: level,
                      );
                    } else if (level != index + 1) {
                      return SFELevelWidgetSEF(
                        text: '${index + 1}',
                        pointer: levelPointers[index],
                        type: 'closed',
                        levelIndex: index + 1,
                        money: moneys[index],
                        currentIndex: level,
                      );
                    }
                    return SFELevelWidgetSEF(
                      text: '${index + 1}',
                      pointer: levelPointers[index],
                      type: 'opened',
                      levelIndex: index + 1,
                      money: moneys[index],
                      currentIndex: level,
                    );
                  },
                ),
              ),
            ),
            GFDCustomButtonFDS(
              onPressed: () => Navigator.pop(context),
              text: 'Lobby',
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class SFELevelWidgetSEF extends StatelessWidget {
  const SFELevelWidgetSEF({
    super.key,
    required this.text,
    required this.pointer,
    required this.type,
    required this.levelIndex,
    required this.money,
    required this.currentIndex,
  });

  final String type;
  final int levelIndex;
  final int? money;
  final String text;
  final SFELevelPointerESF pointer;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final model = FSDFSettingsProviderESF.watch(context).model;
    return Positioned(
      top: pointer.top,
      bottom: pointer.bottom,
      left: pointer.left,
      right: pointer.right,
      child: GestureDetector(
        onTap: () {
          if (levelIndex == currentIndex) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FSDFSettingsProviderESF(
                  model: model,
                  child: const SEFMyGameFESF(),
                ),
              ),
            );
          } else if (levelIndex == currentIndex + 1) {
            showDialog(
              context: context,
              builder: (builder) {
                return SFECustomAlertDialogSEF(
                  type: type,
                  levelText: text,
                  amount: money ?? 0,
                  model: model,
                );
              },
            );
          }
          // if (levelIndex == null) return;

          // if (levelIndex != 0 &&
          //     LMController.levels.value[levelIndex! - 1] == 0) {
          //   showDialog(
          //     context: context,
          //     builder: (context) => LMCustomAlertDialog(
          //       content: Text(
          //         'You will not be able to pass a new level until you pass the previous level by at least one star.',
          //         style: TextStyle(
          //           fontSize: 25.sp,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   );
          //   return;
          // }
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => LMGameScreen(levelIndex: levelIndex!),
          //   ),
          // );
        },
        child: Column(
          children: [
            (type == 'skiped')
                ? SizedBox(
                    height: 26.h,
                    width: 76.w,
                  )
                : Container(
                    width: 76.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38.r),
                      color: type == 'opened'
                          ? SDFAppColorsSDF.mainColorDSF
                          : Colors.grey.shade800,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.w,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImagesEWR.moneyGFD,
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: type == 'closed' ? 8.w : 4.w),
                        Text(
                          levelIndex == 1
                              ? 'Free'
                              : type == 'closed'
                                  ? '$money'
                                  : 'Open',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(height: 5.h),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'mega_assets/mega_images/mega_prolevel_$type.png',
                  width: 56.w,
                  height: 56.h,
                  fit: BoxFit.contain,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            if (type == 'opened')
              Column(
                children: [
                  SizedBox(height: 5.h),
                  ERWEOutlinedTextEWR(
                    text: 'Click to continue',
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class SFECustomAlertDialogSEF extends StatelessWidget {
  const SFECustomAlertDialogSEF({
    super.key,
    required this.type,
    required this.levelText,
    required this.amount,
    required this.model,
  });

  final String type;
  final String levelText;
  final int amount;
  final DSFSettingsControllerFSDF model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 158.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          width: 344.w,
          height: 268.h,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                type == 'opened'
                    ? AppImagesEWR.openedLevelDialogGRT
                    : AppImagesEWR.closedLevelDialogGSR,
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 134.h,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    color: Colors.black.withAlpha(0),
                    width: 60.w,
                    height: type == 'opened' ? 80.w : 60.w,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: type == 'opened' ? 131.w : 131.w,
                  ),
                  child: type == 'opened'
                      ? Column(
                          children: [
                            SizedBox(height: 43.w),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'mega_assets/mega_images/mega_prolevel_$type.png',
                                  width: 56.w,
                                  height: 56.h,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  levelText,
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Level',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 23.w),
                            Text(
                              'Is open!',
                              style: TextStyle(
                                fontSize: 28.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 39.w),
                            GFDCustomButtonFDS(
                              onPressed: () {
                                if (type == 'opened') {
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        SFECustomAlertDialogSEF(
                                      type: 'opened',
                                      levelText: levelText,
                                      amount: 0,
                                      model: model,
                                    ),
                                  );
                                }
                              },
                              buttonType: 'level',
                              text: 'OK',
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'mega_assets/mega_images/mega_prolevel_$type.png',
                                  width: 56.w,
                                  height: 56.h,
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  levelText,
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Level',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'To open you need',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            EWRMoneyWidgetWER(money: amount, isClosed: true),
                            SizedBox(height: 12.h),
                            GFDCustomButtonFDS(
                              onPressed: () async {
                                if (type == 'opened') {
                                  Navigator.pop(context);
                                } else {
                                  if (model.money - amount < 0) return;
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        SFECustomAlertDialogSEF(
                                      type: 'opened',
                                      levelText: levelText,
                                      amount: 0,
                                      model: model,
                                    ),
                                  );
                                  await model.setLevel(int.parse(levelText));
                                  await model.setMoney(-amount);
                                }
                              },
                              text: 'Open Level',
                              buttonType: 'level',
                            )
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
