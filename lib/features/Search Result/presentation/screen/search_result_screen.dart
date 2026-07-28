import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/services/service_locator.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/Search%20Result/presentation/screen/widgets/search_result_screen_body.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/filter_character_cubit/filter_character_cubit.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FilterCharacterCubit>(),
      child: Builder(
        builder: (context) {
          return PopScope(
            onPopInvokedWithResult: (didPop, _) {
              if (didPop) {
                context.read<FilterCharacterCubit>().resetFilter();
              }
            },
            child: const Scaffold(
              backgroundColor: AppColors.kBackGroundColor,
              body: SafeArea(child: SearchResultScreenBody()),
            ),
          );
        },
      ),
    );
  }
}
