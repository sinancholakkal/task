import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/domain/model/note_model.dart';
import 'package:task/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:task/presentation/pages/screen_home/session/logout_session.dart';
import 'package:task/presentation/pages/screen_home/session/note_add_session.dart';
import 'package:task/presentation/pages/screen_home/session/note_display_session.dart';

class ScreenHome extends StatefulWidget {
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final titleController = TextEditingController();
  final messageController = TextEditingController();
  final _noteStreamController = StreamController<List<Note>>.broadcast();
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(TaskAllGetEvent());
  }

  @override
  void dispose() {
    _noteStreamController.close();
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return BlocListener<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is TaskAllGetSuccessState) {
          _notes.clear();
          _notes.addAll(state.noteModels);
          _noteStreamController.sink.add(_notes.toList());
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Notes App")),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              //Note adding session--
              NoteAddSession(titleController: titleController, messageController: messageController, notes: _notes, noteStreamController: _noteStreamController),
              //Note display session--
              NoteDisplaySession(noteStreamController: _noteStreamController, isTablet: isTablet),
            ],
          ),
        ),
        //logout session
        floatingActionButton: LogoutSession(),
      ),
    );
  }
}

