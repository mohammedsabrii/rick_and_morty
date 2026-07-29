import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_icons.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class ExportSuccessHeader extends StatelessWidget {
  final String filePath;

  const ExportSuccessHeader({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppIcons.kSuccessIcon),
        SizedBox(height: 24.h),
        Text(
          'Export Successful',
          textAlign: TextAlign.center,
          style: AppTextStyles.stylePlusJakartaSansSemiBold24().copyWith(
            color: const Color(0xFF141B2B),
            height: 1.33,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Characters list has been exported toExcel.',
          textAlign: TextAlign.center,
          style: AppTextStyles.stylePlusJakartaSansRegular16().copyWith(
            color: AppColors.kVeryDarkGrayish,
            height: 1.50,
          ),
        ),
      ],
    );
  }
}
