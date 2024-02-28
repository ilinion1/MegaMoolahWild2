import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_buttonRETH.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_snackbarQSX.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_text_fieldYTR.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_gapEWR.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_screensDFGH/mega_pro_help_screenFDS.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_gameDASF/mega_pro_componentsFGHJ/mega_pro_levelsFGHJ/mega_pro_level3GHFJ.dart';

enum ESFGameStatusFSE { won, lose, playing }

class SEFMyGameFESF extends StatefulWidget {
  const SEFMyGameFESF({super.key});

  @override
  State<SEFMyGameFESF> createState() => _SEFMyGameFESFState();
}

class _SEFMyGameFESFState extends State<SEFMyGameFESF> {
  // for check
  int selectedIndex = -1;
  bool? success;
  bool isPause = true;
  bool isGameStarted = false;

  // score
  int score = 0;
  int money = 0;

  // status
  ESFGameStatusFSE status = ESFGameStatusFSE.playing;

  late List<int> type;

  // Card flipped or not
  late List<bool> cardFlips;

  // Card flipped & is done
  late List<bool> isDone;

  @override
  void initState() {
    super.initState();
    type = List.generate(15, (index) => index + 1);
    cardFlips = List.filled(30, false);
    isDone = List.filled(30, false);
    type
      ..addAll(List.from(type))
      ..shuffle();
  }

  void refreshLevel() {
    type = List.generate(15, (index) => index + 1);
    cardFlips = List.filled(30, false);
    isDone = List.filled(30, false);
    type
      ..addAll(List.from(type))
      ..shuffle();
    showCards();
  }

  void showCards() {
    isPause = true;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      print('flip');
      cardFlips = switch (5) {
        5 => List.filled(30, true),
        _ => List.generate(8, (index) => true),
      };
      setState(() {});
    });
    setState(() {});
    Future.delayed(const Duration(seconds: 6), () {
      if (!mounted) return;
      print('flip');
      isPause = false;

      cardFlips = List.filled(30, false);
      setState(() {});
    });
  }

  void extendSquare() {
    final extendSquare = List.generate(15, (index) => index + 1);
    extendSquare.shuffle();
    type.addAll(extendSquare.sublist(0, 3));
  }

  // Game Status
  Future<void> isWon() async {
    if (isDone.where((element) => element == false).isNotEmpty) return;

    final totalMoney = (money + score * 0.5 * money).toInt();
    await FSDFSettingsProviderESF.read(context)!.model.setMoney(totalMoney);
    isGameStarted = false;
    setState(() {});
    onTryAgainPressed();

    status = ESFGameStatusFSE.won;
    setState(() {});
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (ctx) => WonDialog(
        money: totalMoney,
      ),
    );
  }

  void isLose() {
    isGameStarted = false;
    status = ESFGameStatusFSE.lose;
    onTryAgainPressed();
    isDone = List.filled(30, false);
    cardFlips = List.filled(30, false);
    setState(() {});
    showDialog(context: context, builder: (ctx) => const ESFSLoseDialogFESF());
  }

  // Buttons pressed
  void onTryAgainPressed() {
    final model = FSDFSettingsProviderESF.read(context)!.model;
    if (model.sound) AudioPlayer().play(AssetSource('audio/sound.wav'));
    selectedIndex = -1;
    success = null;
    isPause = true;
    money = 0;
    score = 0;
    status = ESFGameStatusFSE.playing;
    setState(() {});
  }

  void onItemPressed(int itemIndex) async {
    final model = FSDFSettingsProviderESF.read(context)!.model;
    if (model.sound) AudioPlayer().play(AssetSource('audio/sound.wav'));
    if (isPause || isDone[itemIndex] || selectedIndex == itemIndex) return;
    setState(() {
      cardFlips[itemIndex] = !cardFlips[itemIndex];
    });
    if (selectedIndex == -1) {
      // if item is not selected
      selectedIndex = itemIndex;
      success = null;
    } else if (type[selectedIndex] != type[itemIndex]) {
      // if items isn't same
      success = false;
      isPause = true;
      Future.delayed(const Duration(milliseconds: 500), () async {
        isPause = false;
        cardFlips[itemIndex] = false;
        cardFlips[selectedIndex] = false;
        selectedIndex = -1;
        setState(() {});
        isLose();
      });
    } else if (type[selectedIndex] == type[itemIndex]) {
      // if items is same
      final isDoneIndex = selectedIndex;
      selectedIndex = -1;
      success = true;
      isPause = true;
      score++;
      Future.delayed(const Duration(milliseconds: 500), () async {
        isPause = false;
        isDone[isDoneIndex] = true;
        isDone[itemIndex] = true;
        success = null;
        setState(() {});
        await isWon();
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final model = FSDFSettingsProviderESF.watch(context).model;
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImagesEWR.background1ERW,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black54,
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
            'Magic Cards',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => SFEHelpScreenSEF(
                      title: '',
                      subtitles: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your task is to find pairs of elements that are hidden under the cards.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Image.asset(
                              'mega_assets/mega_images/mega_prostack.png',
                              width: 74.w),
                          SizedBox(height: 10.h),
                          Text(
                            'For each pair found you will receive x0.5 to your bet.',
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
                          SizedBox(height: 10.h),
                          Text(
                            'When your attempt is unsuccessful, your bet will be burned.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'You can withdraw your money halfway through, at any time during the game.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Level3(
              type: type,
              cardFlips: cardFlips,
              isDone: isDone,
              success: success,
              onItemPressed: (int itemIndex) => onItemPressed(itemIndex),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Row(
                children: [
                  Image.asset('mega_assets/mega_images/mega_prostack.png',
                      height: 58.h),
                  SizedBox(width: 20.w),
                  Text(
                    '${15 - isDone.where((element) => element == true).length ~/ 2}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Paired elements left',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            )
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
              // ignore: prefer_const_constructors
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Color(0xFF008790),
                  Color(0xFF005570),
                ],
              ),
              // color: AppColors.black,
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
                    text: isGameStarted
                        ? 'Receive: ${(money + score * 0.5 * money).toInt()}'
                        : 'Play',
                    onButtonPressed: (money) async {
                      if (isGameStarted) {
                        if (isPause) return;
                        final totalMoney =
                            (this.money + score * 0.5 * this.money).toInt();
                        await FSDFSettingsProviderESF.read(context)!
                            .model
                            .setMoney(totalMoney);
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          FGDCustomSnackbarDFG.eSAcallSnackbarDSF(
                              totalMoney, context),
                        );
                        isGameStarted = false;
                        setState(() {});
                        onTryAgainPressed();
                      } else {
                        refreshLevel();
                        await FSDFSettingsProviderESF.read(context)!
                            .model
                            .setMoney(-money);
                        isGameStarted = true;
                        this.money = money;
                        setState(() {});
                      }
                    },
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

class ESFSLoseDialogFESF extends StatelessWidget {
  const ESFSLoseDialogFESF({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7D7D7D),
              Color(0xFF24383F),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 18.h),
            Text(
              'Game over',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 18.h),
            Text(
              'You missed',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              width: 173.w,
              height: 44.h,
              child: GFDCustomButtonFDS(
                onPressed: () => Navigator.pop(context),
                text: 'Try again',
              ),
            ),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }
}

class WonDialog extends StatelessWidget {
  const WonDialog({super.key, required this.money});

  final int money;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('mega_assets/mega_images/mega_prowon_dialog.png'),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Big Win!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImagesEWR.moneyGFD, width: 22.w),
                  SizedBox(width: 10.w),
                  Text(
                    '$money',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 173.w,
                height: 44.h,
                child: GFDCustomButtonFDS(
                  onPressed: () => Navigator.pop(context),
                  text: 'Continue',
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ],
      ),
    );
  }
}
