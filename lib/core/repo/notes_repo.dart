import 'package:notes_app_with_bloc_pattern/model/notes_model.dart';
import 'package:notes_app_with_bloc_pattern/theme/theme_color.dart';

class NotesRepository {
  Future<void> noteSaved(String note_title, String note_desc) async {
    print("Not Kaydedildi. $note_title $note_desc");
  }

  Future<void> noteUpdate(
      int note_id, String note_title, String note_desc) async {
    print("Not Güncellendi. $note_id  $note_title $note_desc");
  }

  Future<List<NotesModel>> notesAll() async {
    var notesList = <NotesModel>[];
    var n1 = NotesModel(
      id: 1,
      title: "Flutter",
      desc: "Flutter ile Uygulama Geliştirme ",
      color: ThemeAppColor.noteColor1,
    );
    var n2 = NotesModel(
      id: 1,
      title: "JavaScripts",
      desc: "JavaScripts ile Uygulama Geliştirme ",
      color: ThemeAppColor.noteColor2,
    );
    var n3 = NotesModel(
      id: 1,
      title: "Nodejs",
      desc: "Nodejs ile Uygulama Geliştirme ",
      color: ThemeAppColor.noteColor3,
    );
    notesList.add(n1);
    notesList.add(n2);
    notesList.add(n3);

    return notesList;
  }

  Future<void> noteDelete(int note_id) async {
    print("Not Silindi. $note_id  ");
  }
}
