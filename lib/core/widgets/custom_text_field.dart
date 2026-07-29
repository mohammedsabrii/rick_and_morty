import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.canRequestFocus,
    this.obscureText,
    this.onChanged,
    required this.hintText,
    this.suffixIcon,
    this.hintStyle,
    this.controller,
    this.readOnly,
    this.onTap,
  });

  final bool? canRequestFocus;
  final bool? obscureText;
  final Function(String p1)? onChanged;
  final String hintText;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final bool? readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.kLavenderBlue,
          ),
          child: TextFormField(
            readOnly: readOnly ?? false,
            onTap: onTap,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: controller,
            cursorColor: Colors.black,
            canRequestFocus: canRequestFocus ?? true,
            obscureText: obscureText ?? false,
            onChanged: (value) {
              onChanged?.call(value);
            },
            style: AppTextStyles.stylePlusJakartaSansRegular15().copyWith(
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey, size: 26.sp),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              enabledBorder: outLineInputBorderMethod(),
              focusedBorder: outLineInputBorderMethod(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
              hintText: hintText,
              hintStyle:
                  hintStyle ??
                  AppTextStyles.stylePlusJakartaSansRegular15().copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder outLineInputBorderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
