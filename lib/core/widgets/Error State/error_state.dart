import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_images.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 120.h),
        Image.asset(AppImages.kErrorStateAvatar, width: 350.w, height: 250.h),
        SizedBox(height: 24.h),
        Text(
          'Oops! Something went wrong',
          style: AppTextStyles.stylePlusJakartaSansBold20(),
        ),
        SizedBox(height: 12.h),
        Text(
          'The interdimensional stabilizes have failed.\nThis timeline is currently unstable or the\nportal fluid is depleted.',
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
