import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_images.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 348.h),
        Center(
          child: Container(
            width: 120.w,
            height: 120.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: [
                BoxShadow(
                  color: AppColors.kShadow,
                  blurRadius: 10,
                  offset: Offset(0, 8),
                  spreadRadius: -6,
                ),
                BoxShadow(
                  color: AppColors.kShadow,
                  blurRadius: 25,
                  offset: Offset(0, 20),
                  spreadRadius: -5,
                ),
              ],
            ),
            child: Center(
              child: Image.asset(AppImages.kLogo, height: 112.h, width: 112.w),
            ),
          ),
        ),
        SizedBox(height: 332.h),
        Text(
          'Rick & Morty Explorer',
          textAlign: TextAlign.center,
          style: AppTextStyles.stylePlusJakartaSansSemiBold24().copyWith(
            color: AppColors.kMainColor,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Multiverse Discovery Engine © 2024',
          textAlign: TextAlign.center,
          style: AppTextStyles.stylePlusJakartaSansMedium12().copyWith(
            color: AppColors.kDarkGrayPurple,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
