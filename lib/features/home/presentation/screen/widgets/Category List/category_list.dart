import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/filter_character_cubit/filter_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Category%20List/category_card.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int isActive = 0;
  final List<String> categories = [
    'All',
    'Alive',
    'Dead',
    'Unknown',
    'Male',
    'Female',
    'Gender unknown',
  ];

  void _onCategoryTapped(int index) {
    if (isActive == index) return;

    setState(() {
      isActive = index;
    });

    final category = categories[index];
    String? status;
    String? gender;

    switch (category) {
      case 'Alive':
        status = 'alive';
        break;
      case 'Dead':
        status = 'dead';
        break;
      case 'Unknown':
        status = 'unknown';
        break;
      case 'Male':
        gender = 'male';
        break;
      case 'Female':
        gender = 'female';
        break;
      case 'Gender unknown':
        gender = 'unknown';
        break;
      case 'All':
      default:
        status = null;
        gender = null;
        break;
    }

    context.read<FilterCharacterCubit>().filterCharacters(
          status: status,
          gender: gender,
        );
  }

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
            onTap: () => _onCategoryTapped(index),
          );
        },
      ),
    );
  }
}
