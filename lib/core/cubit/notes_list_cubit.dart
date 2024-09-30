import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_bloc_pattern/core/repo/notes_repo.dart';
import 'package:notes_app_with_bloc_pattern/model/notes_model.dart';

class NotesListCubit extends Cubit<List<NotesModel>> {
  NotesListCubit() : super(<NotesModel>[]);

  var repo = NotesRepository();

  Future<void> getnotesList() async {
    var list = await repo.notesAll();
    emit(list);
  }

  Future<void> noteDelete(int note_id) async {
    await repo.noteDelete(note_id);
    await repo.notesAll();
  }
}
