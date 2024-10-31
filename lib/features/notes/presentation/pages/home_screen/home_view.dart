import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/extensions/localization_on_build_context.dart';

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
        label: const Text('data'),
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

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.brown[200], borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Note title',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text('Note description', style: TextStyle(fontSize: 16)),
          Align(alignment: Alignment.bottomRight, child: Text('Date')),
        ],
      ),
    );
  }
}
