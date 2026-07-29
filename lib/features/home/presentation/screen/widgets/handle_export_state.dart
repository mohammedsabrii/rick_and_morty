import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/export/presentation/cubit/export_excel_state.dart';
import 'package:rick_and_morty/features/export/presentation/widgets/export_success_dialog.dart';

void handleExportState(BuildContext context, ExportExcelState state) {
  if (state is ExportExcelLoading) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: AppColors.kMainColor),
      ),
    );
  } else if (state is ExportExcelSuccess) {
    Navigator.of(context, rootNavigator: true).pop();
    ExportSuccessDialog.show(context, state.filePath);
  } else if (state is ExportExcelFailure) {
    Navigator.of(context, rootNavigator: true).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
        backgroundColor: AppColors.kDarkCrimsonRed,
      ),
    );
  }
}
