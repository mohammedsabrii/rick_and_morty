import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/get_character_cubit/get_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Home%20Character%20Card/home_character_card.dart';

class HomeScreenBodyListView extends StatelessWidget {
  const HomeScreenBodyListView({super.key, required this.characters});
  final List<CharacterEntity> characters;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.kLightGreen,
      onRefresh: () => context.read<GetCharactersCubit>().getCharacters(),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: ListView.separated(
          itemCount: characters.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            return HomeCharacterCard(character: characters[index]);
          },
        ),
      ),
    );
  }
}
