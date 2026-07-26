import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_images.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class ConnectionLostState extends StatelessWidget {
  const ConnectionLostState({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 120.h),
        Image.asset(
          AppImages.kNoInternetConnectionAvatar,
          width: 350.w,
          height: 250.h,
        ),
        SizedBox(height: 24.h),
        Text(
          'Connection Lost',
          style: AppTextStyles.stylePlusJakartaSansBold32(),
        ),
        SizedBox(height: 12.h),
        Text(
          'The portal fluid is stable, but your connection to this dimension has been severed. Check your internet and try again.',
          textAlign: TextAlign.center,
          style: AppTextStyles.stylePlusJakartaSansRegular16(),
        ),
        SizedBox(height: 40.h),
        InkWell(
          onTap: onTap,

          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              color: AppColors.kMainColor,
            ),
            child: Center(
              child: Text(
                'Retry',
                style: AppTextStyles.stylePlusJakartaSansRegular16().copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
