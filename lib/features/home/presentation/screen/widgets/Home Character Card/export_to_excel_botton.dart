import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/app_icons.dart';
import 'package:rick_and_morty/core/utils/app_text_styles.dart';
import 'package:rick_and_morty/features/export/presentation/cubit/export_excel_cubit.dart';
import 'package:rick_and_morty/features/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/filter_character_cubit/filter_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/get_character_cubit/get_character_cubit.dart';

class ExportToExcelBotton extends StatelessWidget {
  const ExportToExcelBotton({super.key});

  List<CharacterEntity> _getCharacters(BuildContext context) {
    final filterState = context.read<FilterCharacterCubit>().state;
    if (filterState is FilterCharacterSuccess) {
      return filterState.characters;
    }
    final getState = context.read<GetCharactersCubit>().state;
    if (getState is GetCharactersSuccess) {
      return getState.characters;
    }
    return [];
  }

  void _onExportPressed(BuildContext context) {
    final characters = _getCharacters(context);
    if (characters.isNotEmpty) {
      context.read<ExportExcelCubit>().exportCharacters(characters);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No characters available to export.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onExportPressed(context),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.kMintGreenColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          spacing: 8.w,
          children: [
            SvgPicture.asset(AppIcons.kExcelIcon, height: 20.h, width: 20.w),
            Text(
              'Export To Excel',
              style: AppTextStyles.stylePlusJakartaSansMedium12(),
            ),
          ],
        ),
      ),
    );
  }
}
