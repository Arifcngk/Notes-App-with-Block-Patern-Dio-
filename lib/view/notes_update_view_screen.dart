import 'package:flutter/material.dart';
import 'package:notes_app_with_bloc_pattern/core/cubit/notes_saved_cubit.dart';
import 'package:notes_app_with_bloc_pattern/core/cubit/notes_update_cubit.dart';
import 'package:notes_app_with_bloc_pattern/theme/theme_color.dart';
import 'package:notes_app_with_bloc_pattern/view/home_view_screen.dart';
import 'package:notes_app_with_bloc_pattern/widget/icon_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesUpdateViewScreen extends StatefulWidget {
  final int id;
  final String title;
  final String desc;

  NotesUpdateViewScreen(
      {super.key, required this.id, required this.title, required this.desc});

  @override
  State<NotesUpdateViewScreen> createState() => _NotesUpdateViewScreenState();
}

class _NotesUpdateViewScreenState extends State<NotesUpdateViewScreen> {
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
                          context.read<NotesUpdateCubit>().update(
                              widget.id, notesTitle.text, notesDesc.text);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20), // Başlık ve açıklama için boşluk
              TextField(
                maxLines: 1,

                controller: notesDesc,
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white70), // Yazı boyutunu ve rengini ayarlama
                decoration: InputDecoration(
                  hintText: widget.desc,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ThemeAppColor.bgColor,
                  hintStyle: const TextStyle(
                    color: Color(0xFF9A9A9A),
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // Başlık ve açıklama arasındaki boşluk
              TextField(
                maxLines: 15,

                controller: notesTitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ), // Yazı boyutunu ve rengini ayarlama
                decoration: InputDecoration(
                  hintText: widget.title,
                  hintStyle: const TextStyle(
                    color: Color(0xFF9A9A9A),
                    fontSize: 20,
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
