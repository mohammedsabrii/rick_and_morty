import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/core/utils/app_icons.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Home%20Character%20Card/export_to_excel_botton.dart';

class HomeCharacterHeader extends StatelessWidget {
  const HomeCharacterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.kCharactersIcon, height: 22.h, width: 22.w),
        SizedBox(width: 16.w),
        Text("Characters", style: AppTextStyles.stylePlusJakartaSansBold18()),
        const Spacer(),
        const ExportToExcelBotton(),
      ],
    );
  }
}
