// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rick_and_morty/core/utils/app_colors.dart';
// import 'package:rick_and_morty/core/utils/app_text_styles.dart';

// class TechnicalProfileCard extends StatelessWidget {
//   const TechnicalProfileCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: const Border(
//           left: BorderSide(width: 4, color: Colors.deepPurpleAccent),
//         ),

//         borderRadius: BorderRadius.circular(16.r),

//         boxShadow: [
//           BoxShadow(
//             color: AppColors.kShadow,
//             blurRadius: 20.r,
//             offset: Offset(0, 4.h),
//             spreadRadius: 0.r,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           SizedBox(
//             width: 127.w,
//             child: Text(
//               'ORIGIN',
//               style: AppTextStyles.stylePlusJakartaSansSemiBold12().copyWith(
//                 color: AppColors.kDarkGrayishBlue,
//               ),
//             ),
//           ),
//           const SizedBox(height: 5),
//           SizedBox(
//             width: 127.w,
//             child: Text(
//               'Earth (C-137)',
//               style: AppTextStyles.stylePlusJakartaSansBold18(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
