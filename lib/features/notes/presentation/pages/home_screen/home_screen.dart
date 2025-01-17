import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/config/di/locator.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/pages/home_screen/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeCubit>()..init(),
      child: const HomeView(),
    );
  }
}
