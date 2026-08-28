import 'package:flash_card_quiz/core/state_mangment/cubit/new_card_cubit.dart';
import 'package:flash_card_quiz/core/themeing/theme.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/card_options_bottom_sheet.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/custom_floating_action.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/empty_state.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/flash_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      floatingActionButton: const CustomFloatingActionBotton(),
      appBar: AppBar(
        backgroundColor: AppColors.surfaceWhite,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Study Flow',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.onSurface,
          ),
        ),
      ),
      body: BlocBuilder<NewCardCubit, NewCardState>(
        builder: (context, state) {
          final cubit = context.read<NewCardCubit>();

          // ── Empty state ──
          if (cubit.quizList.isEmpty) {
            return const EmptyState();
          }

          // ── Single card view (half screen) ──
          return Column(
            children: [
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: PageView.builder(
                  itemCount: cubit.quizList.length,
                  controller: PageController(viewportFraction: 0.9),
                  itemBuilder: (context, index) {
                    return FlashCardItem(
                      quiz: cubit.quizList[index],
                      onMenuPressed: () {
                        showCardOptionsBottomSheet(
                          context,
                          quiz: cubit.quizList[index],
                          index: index,
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${cubit.quizList.length} card${cubit.quizList.length == 1 ? '' : 's'}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
