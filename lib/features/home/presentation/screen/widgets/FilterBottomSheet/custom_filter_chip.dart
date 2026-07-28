import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.deepPurple : AppColors.kBorderColor,
          ),
          borderRadius: BorderRadius.circular(9999.r),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color: AppColors.kShadow,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              Icon(Icons.check, size: 16.sp, color: Colors.white),
              SizedBox(width: 6.w),
            ],
            Text(
              label,
              style: AppTextStyles.stylePlusJakartaSansRegular15().copyWith(
                color: isSelected ? Colors.white : const Color(0xFF464555),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
