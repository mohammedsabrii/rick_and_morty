import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class ExportSuccessActions extends StatelessWidget {
  final String filePath;

  const ExportSuccessActions({super.key, required this.filePath});

  Future<void> _openFile(BuildContext context) async {
    final result = await OpenFilex.open(filePath);
    if (!context.mounted) return;

    if (result.type == ResultType.noAppToOpen) {
      await OpenFilex.open(filePath);
    } else if (result.type != ResultType.done) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result.message)));
    }
  }

  void _shareFile() {
    SharePlus.instance.share(
      ShareParams(
        files: [XFile(filePath)],
        text: 'Exported Rick and Morty Characters',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => _openFile(context),
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            decoration: ShapeDecoration(
              color: AppColors.kMainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              shadows: const [
                BoxShadow(
                  color: AppColors.kShadow,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              'Open File',
              textAlign: TextAlign.center,
              style: AppTextStyles.stylePlusJakartaSansRegular16().copyWith(
                color: Colors.white,
                height: 1.50,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: _shareFile,
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            decoration: ShapeDecoration(
              color: AppColors.kLavenderBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text(
              'Share',
              textAlign: TextAlign.center,
              style: AppTextStyles.stylePlusJakartaSansRegular16().copyWith(
                color: AppColors.kMainColor,
                height: 1.50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
