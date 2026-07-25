import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_icons.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class CharacterDetailsButton extends StatelessWidget {
  const CharacterDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5.h),

      decoration: BoxDecoration(
        color: AppColors.kMintGreenColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.kShadow,
            blurRadius: 20.r,
            offset: Offset(0, 4.h),
            spreadRadius: 0.r,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          SvgPicture.asset(AppIcons.kExcelIcon, width: 30.w, height: 30.h),
          SizedBox(width: 12.w),
          Text(
            'Export To Excel',
            style: AppTextStyles.stylePlusJakartaSansBold15(),
          ),
        ],
      ),
    );
  }
}
