import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.isActive,
    required this.title,
    required this.onTap,
  });
  final bool isActive;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: EdgeInsets.only(
            top: 8.h,
            left: 12.w,
            right: 12.w,
            bottom: 8.h,
          ),
          decoration: BoxDecoration(
            // border: Border.all(
            //   color: isActive ? AppColors.kMainColor : AppColors.kBorderColor,
            // ),
            color: isActive ? AppColors.kMainColor : AppColors.kLavenderBlue,
            borderRadius: BorderRadius.circular(9999),

            boxShadow: const [
              BoxShadow(
                color: AppColors.kShadow,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.stylePlusJakartaSansSemiBold14().copyWith(
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
