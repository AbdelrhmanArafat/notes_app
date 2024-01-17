import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';
import 'package:notes_app/views/widgets/edit_color_list_view.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomAppBar(
                title: 'Edit Note',
                icon: Icons.check,
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = content ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 50),
              CustomTextFormField(
                onChanged: (value) {
                  title = value;
                },
                hintText: widget.note.title,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onChanged: (value) {
                  content = value;
                },
                hintText: widget.note.subTitle,
                maxLines: 5,
              ),
              const SizedBox(height: 16),
               EditColorListView(
                note: widget.note,
               ),
            ],
          ),
        ),
      ),
    );
  }
}
