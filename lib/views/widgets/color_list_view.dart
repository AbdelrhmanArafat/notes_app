import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentColorIndex = 0;

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
                BlocProvider.of<NotesCubit>(context).color =
                    kNotesColors[index];
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
