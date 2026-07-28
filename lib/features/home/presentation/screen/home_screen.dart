import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/services/service_locator.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/filter_character_cubit/filter_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/get_character_cubit/get_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetCharactersCubit>()..getCharacters(),
        ),
        BlocProvider(
          create: (context) => getIt<FilterCharacterCubit>(),
        ),
      ],
      child: const Scaffold(
        backgroundColor: AppColors.kBackGroundColor,
        body: SafeArea(child: HomeScreenBody()),
      ),
    );
  }
}
