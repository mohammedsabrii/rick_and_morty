import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class ApplyFiltersButton extends StatelessWidget {
  const ApplyFiltersButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.kMainColor,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Center(
          child: Text(
            'Apply Filters',
            style: AppTextStyles.stylePlusJakartaSansSemiBold16().copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
