import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_buttonRETH.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_gameDASF/mega_pro_componentsFGHJ/mega_pro_levelsFGHJ/mega_pro_level1FGHJ.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_gameDASF/mega_pro_componentsFGHJ/mega_pro_levelsFGHJ/mega_pro_level3GHFJ.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_gameDASF/mega_pro_gameTYR.dart';

class FSEMiddleWidgetFSE extends StatelessWidget {
  const FSEMiddleWidgetFSE({
    super.key,
    required this.status,
    required this.type,
    required this.cardFlips,
    required this.isDone,
    required this.success,
    required this.level,
    required this.onTryAgainPressed,
    required this.onItemPressed,
  });

  final ESFGameStatusFSE status;
  final List<int> type;
  final List<bool> cardFlips;
  final List<bool> isDone;
  final bool? success;
  final int level;
  final Function(int) onItemPressed;
  final Function() onTryAgainPressed;

  Widget playingWidget() {
    return switch (level) {
      1 => Level1(
          type: type,
          cardFlips: cardFlips,
          isDone: isDone,
          success: success,
          onItemPressed: (int itemIndex) async =>
              await onItemPressed(itemIndex),
        ),
      2 => Level1(
          type: type,
          cardFlips: cardFlips,
          isDone: isDone,
          success: success,
          onItemPressed: (int itemIndex) async =>
              await onItemPressed(itemIndex),
        ),
      3 => Level1(
          type: type,
          cardFlips: cardFlips,
          isDone: isDone,
          success: success,
          onItemPressed: (int itemIndex) async =>
              await onItemPressed(itemIndex),
        ),
      4 => Level1(
          type: type,
          cardFlips: cardFlips,
          isDone: isDone,
          success: success,
          onItemPressed: (int itemIndex) async =>
              await onItemPressed(itemIndex),
        ),
      5 => Level3(
          type: type,
          cardFlips: cardFlips,
          isDone: isDone,
          success: success,
          onItemPressed: (int itemIndex) async =>
              await onItemPressed(itemIndex),
        ),
      6 => Level3(
          type: type,
          cardFlips: cardFlips,
          isDone: isDone,
          success: success,
          onItemPressed: (int itemIndex) async =>
              await onItemPressed(itemIndex),
        ),
      _ => Level1(
          type: type,
          cardFlips: cardFlips,
          isDone: isDone,
          success: success,
          onItemPressed: (int itemIndex) async =>
              await onItemPressed(itemIndex),
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      ESFGameStatusFSE.playing => playingWidget(),
      ESFGameStatusFSE.lose => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text(
                  'Game over',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Try your luck again!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GFDCustomButtonFDS(
              onPressed: onTryAgainPressed,
              text: 'Restart',
            ),
            const SizedBox(height: 22),
          ],
        ),
      ESFGameStatusFSE.won => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Big win!',
              style: TextStyle(
                fontSize: 48.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 256.w,
              child: Text(
                'You managed to collect all the pairs!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),
            GFDCustomButtonFDS(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Next level',
            ),
            const SizedBox(height: 10),
            GFDCustomButtonFDS(
              onPressed: onTryAgainPressed,
              text: 'Restart',
            ),
            const SizedBox(height: 22),
          ],
        ),
    };
  }
}
