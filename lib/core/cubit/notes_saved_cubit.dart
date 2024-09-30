import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_bloc_pattern/core/repo/notes_repo.dart';

class NotesSavedCubit extends Cubit<void> {
  NotesSavedCubit() : super(0);

  var repo = NotesRepository();

  Future<void> saved(String saved_title, String saved_desc) async {
    await repo.noteSaved(saved_title, saved_desc);
  }
}
