// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rick_and_morty/core/utils/app_colors.dart';
// import 'package:rick_and_morty/core/utils/app_text_styles.dart';
// import 'package:rick_and_morty/features/Character%20Details/presentation/screen/widgets/Technical%20Profile/technical_profile_contant.dart';
// import 'package:rick_and_morty/features/Character%20Details/presentation/screen/widgets/character_details_button.dart';
// import 'package:rick_and_morty/features/Character%20Details/presentation/screen/widgets/character_image.dart';

// class CharacterDetailsScreenBody extends StatelessWidget {
//   const CharacterDetailsScreenBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: .start,
//           children: [
//             SizedBox(height: 12.h),
//             const CharacterImage(),
//             const TechnicalProfileContant(),
//             Text(
//               'Description',
//               style: AppTextStyles.stylePlusJakartaSansBold18(),
//             ),
//             SizedBox(height: 20.h),
//             SizedBox(
//               width: 350.w,
//               child: Text(
//                 'The world`s smartest man and a reckless, alcoholic scientist who travels across dimensions with his grandson Morty.',
//                 style: AppTextStyles.stylePlusJakartaSansRegular16().copyWith(
//                   color: AppColors.kVeryDarkGrayish,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.h),
//             const CharacterDetailsButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }
