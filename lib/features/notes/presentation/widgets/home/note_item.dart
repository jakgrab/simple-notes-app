import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_notes_app/config/routing/path_params.dart';
import 'package:simple_notes_app/core/constants/colors.dart';
import 'package:simple_notes_app/core/constants/date_formats.dart';
import 'package:simple_notes_app/core/constants/route_names.dart';
import 'package:simple_notes_app/core/extensions/format_on_date_time.dart';
import 'package:simple_notes_app/core/extensions/text_theme_on_build_context.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final didUpdateNote = await context.pushNamed<bool>(
          RouteNames.updateNote,
          pathParameters: {PathParams.noteId: note.id},
        );

        if (didUpdateNote == true && context.mounted) {
          await context.read<HomeCubit>().getNotes();
        }
      },
      child: Dismissible(
        direction: DismissDirection.endToStart,
        key: Key(note.id),
        onDismissed: (direction) async {
          await context.read<HomeCubit>().removeNote(note);
        },
        background: const _NoteItemBackground(),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.lightBrown,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowBlack,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.content, style: context.textTheme.bodyLarge),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  note.creationDate.formatDate(DateFormats.HH_mm_dd_MM_yyyy),
                  style: context.textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoteItemBackground extends StatelessWidget {
  const _NoteItemBackground();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: Icon(
          Icons.delete_outline,
          color: AppColors.red,
          size: 32,
        ),
      ),
    );
  }
}
