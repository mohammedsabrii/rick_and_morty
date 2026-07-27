import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/widgets/Connection%20Lost/connection_lost_state.dart';
import 'package:rick_and_morty/core/widgets/Error%20State/error_state.dart';
import 'package:rick_and_morty/core/widgets/No%20Results/no_results_state.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/filter_character_cubit/filter_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/cubit/get_character_cubit/get_character_cubit.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/Skeleton/home_character_skeleton_list.dart';
import 'package:rick_and_morty/features/home/presentation/screen/widgets/home_screen_body_list_view.dart';

class HomeScreenBodyBlocBuilder extends StatelessWidget {
  const HomeScreenBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCharacterCubit, FilterCharacterState>(
      builder: (context, filterState) {
        if (filterState is FilterCharacterLoading) {
          return const HomeCharacterSkeletonList();
        }
        if (filterState is FilterCharacterSuccess) {
          return HomeScreenBodyListView(characters: filterState.characters);
        }
        if (filterState is FilterCharacterEmpty) {
          return const NoResultsState();
        }
        if (filterState is FilterCharacterError) {
          return ErrorState(
            onTap: () => context.read<GetCharactersCubit>().getCharacters(),
          );
        }
        if (filterState is FilterNoInternetConnection) {
          return ConnectionLostState(
            onTap: () => context.read<GetCharactersCubit>().getCharacters(),
          );
        }

        return BlocBuilder<GetCharactersCubit, GetCharactersState>(
          builder: (context, state) {
            if (state is GetCharactersLoading) {
              return const HomeCharacterSkeletonList();
            }
            if (state is GetCharactersError) {
              return ErrorState(
                onTap: () => context.read<GetCharactersCubit>().getCharacters(),
              );
            }
            if (state is NoInterNetConaction) {
              return ConnectionLostState(
                onTap: () => context.read<GetCharactersCubit>().getCharacters(),
              );
            }
            if (state is GetCharactersEmpty) {
              return const NoResultsState();
            }
            if (state is GetCharactersSuccess) {
              return HomeScreenBodyListView(characters: state.characters);
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
