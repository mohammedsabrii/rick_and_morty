import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/export/presentation/widgets/export_success_actions.dart';
import 'package:rick_and_morty/features/export/presentation/widgets/export_success_header.dart';

class ExportSuccessDialog extends StatelessWidget {
  final String filePath;

  const ExportSuccessDialog({super.key, required this.filePath});

  static Future<void> show(BuildContext context, String filePath) {
    return showDialog(
      context: context,
      builder: (context) => ExportSuccessDialog(filePath: filePath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400.w),
        child: Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            shadows: const [
              BoxShadow(
                color: AppColors.kShadow,
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(32.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ExportSuccessHeader(filePath: filePath),
                SizedBox(height: 48.h),
                ExportSuccessActions(filePath: filePath),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
