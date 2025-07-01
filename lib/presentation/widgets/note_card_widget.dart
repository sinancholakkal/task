import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/domain/model/note_model.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5.h),
            Text(note.message),
          ],
        ),
      ),
    );
  }
}