import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';

class DASCustomIconButtonDSF extends StatefulWidget {
  const DASCustomIconButtonDSF({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final String icon;
  final Function()? onPressed;

  @override
  State<DASCustomIconButtonDSF> createState() => _DASCustomIconButtonDSFState();
}

class _DASCustomIconButtonDSFState extends State<DASCustomIconButtonDSF> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: (_) {
        final model = FSDFSettingsProviderESF.read(context)!.model;
        if (model.sound) AudioPlayer().play(AssetSource('audio/sound.wav'));
        isPressed = true;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 150), () {
          isPressed = false;
          setState(() {});
        });
        if (widget.onPressed == null) return;
        widget.onPressed!();
      },
      onPanDown: (_) => setState(() {
        isPressed = true;
      }),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            isPressed
                ? AppImagesEWR.iconButtonPressedGE45
                : AppImagesEWR.iconButton4TY,
            width: 64,
            height: 64,
            fit: BoxFit.contain,
          ),
          Image.asset(
            widget.icon,
            width: 38,
            height: 38,
          ),
        ],
      ),
    );
  }
}
