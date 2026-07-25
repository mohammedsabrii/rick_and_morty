import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Category%20List/category_list.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Home%20Character%20Card/home_character_card.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/home_character_header.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          const CustomTextField(hintText: "Search Characters ...."),
          SizedBox(height: 20.h),
          const CategoryList(),
          SizedBox(height: 15.h),
          const HomeCharacterHeader(),
          SizedBox(height: 20.h),
          const HomeCharacterCard(),
        ],
      ),
    );
  }
}
