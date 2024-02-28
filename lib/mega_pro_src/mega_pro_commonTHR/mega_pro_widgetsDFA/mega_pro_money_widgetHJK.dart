import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_colorsRETY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';

class EWRMoneyWidgetWER extends StatelessWidget {
  const EWRMoneyWidgetWER({
    super.key,
    required this.money,
    this.isClosed = false,
  });

  final int money;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127.w,
      height: 38.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.r),
        color: isClosed ? Colors.grey.shade800 : SDFAppColorsSDF.mainColorDSF,
        border: Border.all(
          color: Colors.black,
          width: 2.w,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            AppImagesEWR.moneyGFD,
            width: 33.w,
            height: 32.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 13.w),
          Text(
            '$money',
            style: TextStyle(
              fontSize: 24.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
