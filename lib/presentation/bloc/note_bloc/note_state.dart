part of 'note_bloc.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}
class TaskGetLoadingState extends NoteState{}
class TaskAllGetSuccessState extends NoteState{
  final List<Note>noteModels;
  TaskAllGetSuccessState({required this.noteModels});
}