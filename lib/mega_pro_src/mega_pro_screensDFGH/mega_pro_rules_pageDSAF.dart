import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_colorsRETY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_app_barJYTE.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_buttonRETH.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_money_widgetHJK.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_gameDASF/mega_pro_componentsFGHJ/mega_pro_card_widgetASD.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImagesEWR.background1ERW),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox.shrink(),
            const DASCustomAppBarSAD(text: 'Rules'),
            SizedBox(
              width: 275.w,
              child: Text(
                'You have to collect pairs of elements hidden under the cards',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SDFCardWidgetFSDF(
                  value: 13,
                  isFlipped: true,
                  onPressed: () {},
                  color: SDFAppColorsSDF.mainColorDSF,
                  isDone: false,
                ),
                const SizedBox(width: 8),
                SDFCardWidgetFSDF(
                  value: 13,
                  isFlipped: true,
                  onPressed: () {},
                  color: SDFAppColorsSDF.mainColorDSF,
                  isDone: false,
                ),
              ],
            ),
            SizedBox(
              width: 273.w,
              child: const Text(
                'You earn points for every successful combination',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const EWRMoneyWidgetWER(money: 20),
            SizedBox(
              width: 299.w,
              child: const Text(
                'If you fail, you lose your extra hearts. Their offering is limited. When they run out, the game is over',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImagesEWR.diamondDEF,
                  width: 46,
                  height: 40,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 3),
                Image.asset(
                  AppImagesEWR.diamondDEF,
                  width: 46,
                  height: 40,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 3),
                Image.asset(
                  AppImagesEWR.diamondDEF,
                  width: 46.w,
                  height: 40.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            // const Spacer(),
            GFDCustomButtonFDS(
              onPressed: () => Navigator.pop(context),
              text: 'Lobby',
            ),
          ],
        ),
      ),
    );
  }
}
