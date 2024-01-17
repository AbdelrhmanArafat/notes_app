import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int currentColorIndex;

  @override
  void initState() {
    currentColorIndex = kNotesColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                currentColorIndex = index;
                widget.note.color = kNotesColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kNotesColors[index],
                isColorChoose: currentColorIndex == index,
              ),
            ),
          );
        },
        itemCount: kNotesColors.length,
      ),
    );
  }
}
