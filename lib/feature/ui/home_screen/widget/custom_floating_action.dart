import 'package:flash_card_quiz/core/state_mangment/cubit/new_card_cubit.dart';
import 'package:flash_card_quiz/core/themeing/theme.dart';
import 'package:flash_card_quiz/feature/ui/add_screen/create_new_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFloatingActionBotton extends StatelessWidget {
  const CustomFloatingActionBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.surface,
      onPressed: () {
        final cubit = context.read<NewCardCubit>();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: cubit,
              child: const CreateNewCardScreen(),
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

