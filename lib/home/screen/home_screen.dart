import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnhub/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:learnhub/home/view_model/navigation_cubit/navigation_cubit.dart';
import 'package:learnhub/home/view_model/navigation_cubit/navigation_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return IndexedStack(
            index: NavigationCubit.get(context).index,
            children: NavigationCubit.get(context).screens,
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
