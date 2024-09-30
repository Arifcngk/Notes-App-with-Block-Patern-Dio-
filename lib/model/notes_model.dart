import 'package:flutter/material.dart';

class NotesModel {
  final int id;
  final String title;
  final String desc;
  final Color color;

  NotesModel(
      {required this.id,
      required this.title,
      required this.desc,
      required this.color});
}
