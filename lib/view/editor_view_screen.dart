import 'package:flutter/material.dart';
import 'package:notes_app_with_bloc_pattern/core/cubit/notes_saved_cubit.dart';
import 'package:notes_app_with_bloc_pattern/theme/theme_color.dart';
import 'package:notes_app_with_bloc_pattern/view/home_view_screen.dart';
import 'package:notes_app_with_bloc_pattern/widget/icon_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditorViewScreen extends StatefulWidget {
  const EditorViewScreen({super.key});

  @override
  State<EditorViewScreen> createState() => _EditorViewScreenState();
}

class _EditorViewScreenState extends State<EditorViewScreen> {
  var notesTitle = TextEditingController();
  var notesDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconCardWidget(
                    icon: Icons.chevron_left_sharp,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeViewScreen(),
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      iconCardWidget(
                        icon: Icons.remove_red_eye,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 10),
                      iconCardWidget(
                        icon: Icons.save_outlined,
                        onPressed: () {
                          context
                              .read<NotesSavedCubit>()
                              .saved(notesTitle.text, notesDesc.text);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20), // Başlık ve açıklama için boşluk
              TextField(
                controller: notesTitle,
                style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white70), // Yazı boyutunu ve rengini ayarlama
                decoration: InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ThemeAppColor.bgColor,
                  hintStyle: const TextStyle(
                    color: Color(0xFF9A9A9A),
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // Başlık ve açıklama arasındaki boşluk
              TextField(
                controller: notesDesc,
                maxLines: 15, // Açıklama alanı için 5 satır
                style: const TextStyle(
                    fontSize: 23,
                    color: Colors.white70), // Yazı boyutunu ve rengini ayarlama
                decoration: InputDecoration(
                  hintText: "Type something...",
                  hintStyle: const TextStyle(
                    color: Color(0xFF9A9A9A),
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ThemeAppColor.bgColor,
                ),
              ),
              const SizedBox(height: 20), // Daireler için boşluk
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _colorCircle(Colors.red),
                  _colorCircle(Colors.blue),
                  _colorCircle(Colors.green),
                  _colorCircle(Colors.yellow),
                  _colorCircle(Colors.purple),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Renk daireleri için yardımcı widget
  Widget _colorCircle(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
