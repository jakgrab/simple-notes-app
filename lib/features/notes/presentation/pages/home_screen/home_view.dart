import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/extensions/localization_on_build_context.dart';
import 'package:simple_notes_app/features/notes/presentation/widgets/home/note_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.localizations.homeScreenAppBarText),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(context.localizations.homeScreenFABText),
        icon: const Icon(Icons.edit_outlined),
      ),
      body: const HomeViewBody(),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final someList = List.generate(20, (index) => index);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomScrollView(
        slivers: [
          SliverList.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: someList.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: NoteItem(),
                );
              }

              if (index == someList.length - 1) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: NoteItem(),
                );
              }

              return const NoteItem();
            },
          ),
        ],
      ),
    );
  }
}
