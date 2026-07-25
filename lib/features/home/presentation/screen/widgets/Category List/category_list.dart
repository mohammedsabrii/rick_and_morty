import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Category%20List/category_card.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int isActive = 0;
  List<String> categories = [
    'All',
    'Alive',
    'Dead',
    'Unknown',
    'Male',
    'Female',
    'Gender unknown',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            title: categories[index],
            isActive: isActive == index,
            onTap: () {
              setState(() {
                isActive = index;
              });
            },
          );
        },
      ),
    );
  }
}
