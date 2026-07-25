import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_icons.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class ExportToExcelBotton extends StatelessWidget {
  const ExportToExcelBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.kMintGreenColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          spacing: 8.w,
          children: [
            SvgPicture.asset(AppIcons.kExcelIcon, height: 20.h, width: 20.w),
            Text(
              'Export To Excel',
              style: AppTextStyles.stylePlusJakartaSansMedium12(),
            ),
          ],
        ),
      ),
    );
  }
}
