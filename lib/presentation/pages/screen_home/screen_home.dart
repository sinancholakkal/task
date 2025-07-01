import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/domain/model/note_model.dart';
import 'package:task/domain/repository/auth_services.dart';
import 'package:task/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:task/presentation/pages/screen_login/screen_login.dart';
import 'package:task/presentation/widgets/note_card_widget.dart';
import 'package:task/presentation/widgets/showDiolog.dart';

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
              // ✅ Input field: Title
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.h),

              // ✅ Input field: Message
              TextField(
                controller: messageController,
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.h),

              // ✅ Add Note button
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

              // ✅ Notes List (Responsive UI)
              Expanded(
                child: StreamBuilder<List<Note>>(
                  stream: _noteStreamController.stream,
                  builder: (context, snapshot) {
                    final notes = snapshot.data ?? [];

                    if (notes.isEmpty) {
                      return Center(child: Text("No notes yet."));
                    }

                    return isTablet
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            alertBox(
              context: context,
              onPressed: () {
                AuthService().signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => ScreenLogin()),
                  (route) => false,
                );
              },
              title: "Logout",
              content: "Are you sure you want to logout?",
            );
          },
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}
