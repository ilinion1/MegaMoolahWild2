import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_custom_buttonRETH.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_block_button_controllerASDF.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_controllersDASF/mega_pro_settings_controllerASDF.dart';

class EWRCustomTextFieldAERW extends StatefulWidget {
  const EWRCustomTextFieldAERW({
    super.key,
    required this.onButtonPressed,
    this.text,
  });

  final Function(int) onButtonPressed;
  final String? text;

  @override
  State<EWRCustomTextFieldAERW> createState() => _EWRCustomTextFieldAERWState();
}

class _EWRCustomTextFieldAERWState extends State<EWRCustomTextFieldAERW> {
  late final TextEditingController _controller;
  late final GlobalKey<FormState> _formKey;
  String? errorText;

  final moneys = <int>[10, 25, 50, 100];

  void isValid() {
    if (_controller.text.isEmpty) {
      errorText = null;
      setState(() {});
      return;
    }
    final money = int.parse(_controller.text);
    final userMoney = FSDFSettingsProviderESF.read(context)!.model.money;
    if (money < 10) {
      errorText = 'You can\t put money less than 10';
    } else if (money > userMoney) {
      errorText = 'Your balance less than your bet!';
    } else {
      errorText = null;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 65.h,
          child: Form(
            key: _formKey,
            child: TextField(
              controller: _controller,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) => isValid(),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Image.asset(AppImagesEWR.moneyGFD, width: 22.w),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 10.w,
                ),
                filled: true,
                fillColor: const Color(0xFF003F45),
                suffixIcon: (_controller.text.isEmpty)
                    ? null
                    : IconButton(
                        onPressed: () => setState(() {
                          _controller.clear();
                          errorText = null;
                        }),
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10.r),
                //   borderSide: const BorderSide(color: AppColors.blue),
                // ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.redAccent),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.redAccent),
                ),
                errorText: errorText,
                errorStyle: const TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: List.generate(
            moneys.length,
            (index) => Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 8.w),
              child: SizedBox(
                width: 50.w,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    final money = int.tryParse(_controller.text);
                    _controller.text =
                        ((money ?? 0) + moneys[index]).toString();
                    isValid();
                  },
                  icon: Text(
                    '+${moneys[index]}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        ValueListenableBuilder(
            valueListenable: Provider.block,
            builder: (context, bool value, _) {
              return Opacity(
                opacity: _controller.text.isEmpty || errorText != null || value
                    ? 0.5
                    : 1,
                child: GFDCustomButtonFDS(
                  text: widget.text ?? 'Play',
                  onPressed: () {
                    if (_controller.text.isEmpty ||
                        errorText != null ||
                        value) {
                      return;
                    }
                    if (FSDFSettingsProviderESF.read(context)!.model.money <
                        int.parse(_controller.text)) {
                      setState(() {
                        errorText = 'Your balance less than your bet!';
                      });
                      return;
                    }
                    widget.onButtonPressed(int.parse(_controller.text));
                  },
                ),
              );
            }),
      ],
    );
  }
}
