import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/domain/model/note_model.dart';
import 'package:task/presentation/widgets/note_card_widget.dart';

class NoteDisplaySession extends StatelessWidget {
  const NoteDisplaySession({
    super.key,
    required StreamController<List<Note>> noteStreamController,
    required this.isTablet,
  }) : _noteStreamController = noteStreamController;

  final StreamController<List<Note>> _noteStreamController;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<Note>>(
        stream: _noteStreamController.stream,
        builder: (context, snapshot) {
          final notes = snapshot.data ?? [];

          if (notes.isEmpty) {
            return Center(child: Text("No notes yet."));
          }

          return isTablet
              ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NoteCard(note: notes[index]);
                },
              )
              : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NoteCard(note: notes[index]);
                },
              );
        },
      ),
    );
  }
}
