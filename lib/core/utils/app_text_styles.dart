import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppTextStyles {
  static const _plusJakartaSans = 'PlusJakartaSans';
  static TextStyle stylePlusJakartaSansSemiBold24() {
    return TextStyle(
      fontFamily: _plusJakartaSans,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle stylePlusJakartaSansMedium12() {
    return TextStyle(
      fontFamily: _plusJakartaSans,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
