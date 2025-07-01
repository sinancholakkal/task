import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/domain/model/note_model.dart';
import 'package:task/presentation/bloc/note_bloc/note_bloc.dart';

class NoteAddSession extends StatelessWidget {
  const NoteAddSession({
    super.key,
    required this.titleController,
    required this.messageController,
    required List<Note> notes,
    required StreamController<List<Note>> noteStreamController,
  }) : _notes = notes,
       _noteStreamController = noteStreamController;

  final TextEditingController titleController;
  final TextEditingController messageController;
  final List<Note> _notes;
  final StreamController<List<Note>> _noteStreamController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.h),

          TextField(
            controller: messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.h),

          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              final message = messageController.text.trim();

              if (title.isNotEmpty && message.isNotEmpty) {
                _notes.add(Note(title: title, message: message));
                _noteStreamController.sink.add(_notes);
                context.read<NoteBloc>().add(
                  PostNoteEvent(title: title, descr: message),
                );
                titleController.clear();
                messageController.clear();
              }
            },
            child: Text("Add Note"),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
