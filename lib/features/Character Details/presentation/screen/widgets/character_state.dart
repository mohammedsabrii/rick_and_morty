import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class CharacterState extends StatelessWidget {
  const CharacterState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: ShapeDecoration(
        color: AppColors.kLightGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999.r),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8.sp, color: AppColors.kDeepGreen),
          SizedBox(width: 8.w),
          Text(
            'Alive - Human',
            style: AppTextStyles.stylePlusJakartaSansSemiBold12().copyWith(
              color: AppColors.kDeepGreen,
            ),
          ),
        ],
      ),
    );
  }
}
