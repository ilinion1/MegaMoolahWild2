import 'package:flutter/material.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_gameDASF/mega_pro_componentsFGHJ/mega_pro_card_widgetASD.dart';

class Level3 extends StatelessWidget {
  const Level3({
    super.key,
    required this.type,
    required this.cardFlips,
    required this.onItemPressed,
    required this.isDone,
    this.success,
  });

  final List<int> type;
  final List<bool> cardFlips;
  final List<bool> isDone;
  final bool? success;

  final Function(int) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
      ),
      itemBuilder: (context, index) => SDFCardWidgetFSDF(
        value: type[index],
        isFlipped: cardFlips[index],
        isDone: isDone[index],
        color: (success == null)
            ? Colors.black
            : success!
                ? Colors.green
                : Colors.red,
        onPressed: () => onItemPressed(index),
      ),
      itemCount: type.length,
    );
  }
}
