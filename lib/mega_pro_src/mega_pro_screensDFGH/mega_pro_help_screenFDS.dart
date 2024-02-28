import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_moolah_wild_pro/mega_pro_src/mega_pro_commonTHR/mega_pro_app_imagesRTY.dart';

class SFEHelpScreenSEF extends StatelessWidget {
  const SFEHelpScreenSEF({
    super.key,
    required this.title,
    required this.subtitles,
    this.background,
  });

  final String title;
  final String? background;
  final Widget subtitles;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            background ?? AppImagesEWR.background1ERW,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80.h,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Image.asset(AppImagesEWR.leftArrowGSRG, width: 36.w),
              ),
              SizedBox(width: 16.w),
              const Text('Rules'),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: subtitles,
          // child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // children: ,
          // children: [
          //   // ...List.generate(
          //   //   subtitles.length,
          //   //   (index) => Padding(
          //   //     padding: EdgeInsets.only(bottom: 10.h),
          //   //     child: subtitles[index],
          //   //   ),
          //   // )
          // ],
        ),
      ),
      // ),
    );
  }
}
