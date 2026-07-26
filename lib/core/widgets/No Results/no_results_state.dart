import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/core/utils/app_images.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class NoResultsState extends StatelessWidget {
  const NoResultsState({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 120.h),
          SvgPicture.asset(
            AppImages.kNoResultsStateAvatar,
            width: 350.w,
            height: 300.h,
          ),
          SizedBox(height: 24.h),
          Text(
            'No characters found',
            style: AppTextStyles.stylePlusJakartaSansBold32(),
          ),
          SizedBox(height: 12.h),
          Text(
            'Try searching for something else, or check if Rick accidentally deleted that dimension again.',
            textAlign: TextAlign.center,
            style: AppTextStyles.stylePlusJakartaSansRegular16(),
          ),
        ],
      ),
    );
  }
}
