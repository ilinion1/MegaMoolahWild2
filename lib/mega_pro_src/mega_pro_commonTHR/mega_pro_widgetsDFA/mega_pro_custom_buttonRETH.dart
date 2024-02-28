import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';

class GFDCustomButtonFDS extends StatefulWidget {
  const GFDCustomButtonFDS({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonType = 'button',
  });

  final Function()? onPressed;
  final String text;
  final String buttonType;

  @override
  State<GFDCustomButtonFDS> createState() => _GFDCustomButtonFDSState();
}

class _GFDCustomButtonFDSState extends State<GFDCustomButtonFDS> {
  bool isPressed = false;

  void onPressed() {
    final model = FSDFSettingsProviderESF.read(context)?.model;
    if (model?.sound ?? false) {
      AudioPlayer().play(AssetSource('audio/sound.wav'));
    }
    isPressed = true;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 150), () {
      isPressed = false;
      if (mounted) setState(() {});
    });
    if (widget.onPressed == null) return;
    widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: (_) => setState(() {
        onPressed();
      }),
      onPanDown: (_) => setState(() {
        isPressed = true;
      }),
      // onTap: () => onPressed(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            switch (widget.buttonType) {
              'daily' => isPressed
                  ? AppImagesEWR.dailyButtonPressedGRG
                  : AppImagesEWR.dailyButtonGDR,
              'level' => isPressed
                  ? AppImagesEWR.levelButtonPressedGRD
                  : AppImagesEWR.levelButtonHTD,
              _ => isPressed
                  ? AppImagesEWR.buttonPressedGRE4
                  : AppImagesEWR.buttonGGT,
            },
            fit: BoxFit.contain,
            width: widget.buttonType == 'daily' ? 276.w : 246.w,
            height: widget.buttonType == 'daily' ? 48.h : 64.h,
          ),
          Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.buttonType == 'daily'
                  ? 14.sp
                  : widget.buttonType == 'level'
                      ? 13.sp
                      : 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
