import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class HomeCharacterCardContent extends StatelessWidget {
  const HomeCharacterCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(
          width: 197.w,
          child: Text(
            'Rick Sanchez',
            style: AppTextStyles.stylePlusJakartaSansRegular15(),
          ),
        ),
        Row(
          children: [
            Container(
              width: 8.w,
              height: 8.h,
              decoration: ShapeDecoration(
                color: AppColors.kLightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'Alive - Human',
              style: AppTextStyles.stylePlusJakartaSansMedium12().copyWith(
                color: AppColors.kDarkGrayPurple,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 197.w,
          child: Text(
            'LAST LOCATION',
            style: AppTextStyles.stylePlusJakartaSansBold10().copyWith(
              color: AppColors.kDarkGrayPurple,
            ),
          ),
        ),
        SizedBox(
          width: 197.w,
          child: Text(
            'Citadel of Ricks',
            style: AppTextStyles.stylePlusJakartaSansRegular14().copyWith(
              color: AppColors.kDarkGrayPurple,
            ),
          ),
        ),
      ],
    );
  }
}
