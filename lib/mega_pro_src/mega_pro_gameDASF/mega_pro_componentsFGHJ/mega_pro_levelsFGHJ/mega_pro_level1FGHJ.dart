import 'package:flutter/material.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_gameDASF/mega_pro_componentsFGHJ/mega_pro_card_widgetASD.dart';

class Level1 extends StatelessWidget {
  const Level1({
    super.key,
    required this.type,
    required this.cardFlips,
    required this.isDone,
    required this.success,
    required this.onItemPressed,
  });

  final List<int> type;
  final List<bool> cardFlips;
  final List<bool> isDone;
  final bool? success;
  final Function(int) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 76),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        return SDFCardWidgetFSDF(
          value: type[index],
          isFlipped: cardFlips[index],
          isDone: isDone[index],
          color: (success == null)
              ? Colors.black
              : success!
                  ? Colors.green
                  : Colors.red,
          onPressed: () async => await onItemPressed(index),
        );
      },
      itemCount: type.length,
    );
  }
}
