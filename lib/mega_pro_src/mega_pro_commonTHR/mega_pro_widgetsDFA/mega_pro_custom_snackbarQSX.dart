import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_widgetsDFA/mega_pro_gapEWR.dart';

abstract class FGDCustomSnackbarDFG {
  static SnackBar eSAcallSnackbarDSF(int money, BuildContext context) {
    return SnackBar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: const Color(0xFF008E17),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      content: SizedBox(
        height: 56.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                'You received',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              const Spacer(),
              Text(
                '+$money',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              SWEGapWER.widthERW(4.w),
              Image.asset(AppImagesEWR.moneyGFD, width: 24.w),
            ],
          ),
        ),
      ),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 180.h,
        left: 10.w,
        right: 10.w,
      ),
    );
  }
}
