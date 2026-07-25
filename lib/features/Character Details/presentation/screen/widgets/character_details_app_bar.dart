import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Home%20Character%20Card/export_to_excel_botton.dart';

class CharacterDetailsAppBar extends StatelessWidget {
  const CharacterDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 22.sp),
        SizedBox(width: 16.w),
        Text('Rick Sanchez', style: AppTextStyles.stylePlusJakartaSansBold20()),
        const Spacer(),
        const ExportToExcelBotton(),
      ],
    );
  }
}
