import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class FilterBottomSheetHeader extends StatelessWidget {
  const FilterBottomSheetHeader({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.kLavenderBlue)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filters',
            style: AppTextStyles.stylePlusJakartaSansSemiBold22(),
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999.r),
              ),
            ),
            child: Text(
              'Reset',
              style: AppTextStyles.stylePlusJakartaSansMedium16().copyWith(
                color: AppColors.kMainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
