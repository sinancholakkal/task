import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/domain/model/note_model.dart';
import 'package:task/domain/repository/note_services.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<PostNoteEvent>((event, emit) {
      try{
        if(event.title!=null && event.descr!=null){
          NoteServices().postNoteRepo(event.title!, event.descr!);
        }
      }catch(e){
        log("Somthing wrong $e");
      }
    });
    on<TaskAllGetEvent>((event,state)async{
      emit(TaskGetLoadingState());
      try{
    
        final taskModels = await NoteServices().getAllTask();
        
        emit(TaskAllGetSuccessState(noteModels: taskModels));
        log("New Task Added");
      }catch(e){
        log("something issue while getting all task $e");
      }
    });
  }
}
