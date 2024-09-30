import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_bloc_pattern/core/repo/notes_repo.dart';

class NotesUpdateCubit extends Cubit<void> {
  NotesUpdateCubit() : super(0);

  var repo = NotesRepository();

  Future<void> update(
      int notes_id, String saved_title, String saved_desc) async {
    await repo.noteUpdate(notes_id, saved_title, saved_desc);
  }
}
