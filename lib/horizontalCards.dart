import 'package:flutter/material.dart';
import 'package:notes_app/model/Note.dart';
import 'package:notes_app/notescard.dart';

class HorizontalCardsList extends StatelessWidget {
  final List<Note> notes;
  final String heading;
  const HorizontalCardsList(
      {super.key, required this.notes, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: notes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return NotesCard(
                    title: notes[index].title,
                    description: notes[index].description,
                    updatedAt: notes[index].updatedAt);
              }),
              )
            
      ],
    );
  }
}
