import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_bloc_pattern/core/cubit/notes_list_cubit.dart';
import 'package:notes_app_with_bloc_pattern/model/notes_model.dart';
import 'package:notes_app_with_bloc_pattern/theme/theme_color.dart';
import 'package:notes_app_with_bloc_pattern/view/editor_view_screen.dart';
import 'package:notes_app_with_bloc_pattern/view/notes_update_view_screen.dart';
import 'package:notes_app_with_bloc_pattern/widget/icon_card_widget.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  _HomeViewScreenState createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotesListCubit>().getnotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 43,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    iconCardWidget(
                      icon: Icons.search_sharp,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 10),
                    iconCardWidget(
                      icon: Icons.info_outline,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            BlocBuilder<NotesListCubit, List<NotesModel>>(
              builder: (context, state) {
                if (state.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        var note = state[index]; // state içindeki note verisi
                        return Dismissible(
                          key: Key(note.title), // Doğru Key kullanımı
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            context.read<NotesListCubit>().noteDelete(note.id);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Note deleted"),
                              ),
                            );
                          },
                          background: cardDeleteMethod(),
                          child: notesCardMethod(note),
                        );
                      },
                    ),
                  );
                } else {
                  // Eğer liste boşsa gösterilecek mesaj
                  return const Center(
                    child: Text(
                      "No notes available",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditorViewScreen(),
              ));
        },
        backgroundColor: ThemeAppColor.bgColor,
        elevation: 2,
        focusColor: ThemeAppColor.cardIconColor,
        shape:
            CircleBorder(side: BorderSide(color: ThemeAppColor.cardIconColor)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 36,
        ),
      ),
    );
  }

  Container cardDeleteMethod() {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: const Card(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(26.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  Padding notesCardMethod(NotesModel note) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotesUpdateViewScreen(
                id: note.id,
                desc: note.title,
                title: note.desc,
              ),
            )),
        child: Card(
          color: note.color, // Kartın rengi note'un color'ına göre
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Center(
              child: Text(
                note.title, // Her karttaki metin
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
                softWrap: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
