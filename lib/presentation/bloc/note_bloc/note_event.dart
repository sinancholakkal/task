part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}
class PostNoteEvent extends NoteEvent{
  String? title;
  String? descr;
  PostNoteEvent({required this.title , required this.descr});
}

class TaskAllGetEvent extends NoteEvent {}