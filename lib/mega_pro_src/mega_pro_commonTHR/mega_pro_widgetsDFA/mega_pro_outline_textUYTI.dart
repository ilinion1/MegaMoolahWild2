import 'package:flutter/material.dart';

class ERWEOutlinedTextEWR extends StatelessWidget {
  const ERWEOutlinedTextEWR({
    super.key,
    required this.text,
    required this.textStyle,
    this.strokeWidth = 4,
  });

  final String text;
  final TextStyle textStyle;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle.merge(
            TextStyle(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeCap = StrokeCap.round
                ..strokeWidth = strokeWidth
                ..color = Colors.black,
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ],
    );
  }
}
