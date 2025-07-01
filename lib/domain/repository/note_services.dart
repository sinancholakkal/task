import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/domain/model/note_model.dart';
import 'package:task/presentation/data/random_id.dart';

class NoteServices {
  Future<void> postNoteRepo(String title, String descr) async {
    final Map<String, dynamic> mapValue = {
      "title": title,
      "description": descr,
    };
    FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("notes")
        .doc(getRandomId())
        .set(mapValue);
  }
  Future<List<Note>>getAllTask()async{
    final res = await FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser!.uid).collection("notes").get();
    List<Note>notes =[];
    for(var note in res.docs){
      notes.add(Note(title: note["title"], message: note["description"]));
    }
    return notes;
  }
}
