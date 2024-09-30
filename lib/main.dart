import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_bloc_pattern/core/cubit/notes_list_cubit.dart';
import 'package:notes_app_with_bloc_pattern/core/cubit/notes_saved_cubit.dart';
import 'package:notes_app_with_bloc_pattern/core/cubit/notes_update_cubit.dart';
import 'package:notes_app_with_bloc_pattern/view/editor_view_screen.dart';
import 'package:notes_app_with_bloc_pattern/view/home_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesSavedCubit()),
        BlocProvider(create: (context) => NotesUpdateCubit()),
        BlocProvider(create: (context) => NotesListCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0XFF252525),
        ),
        home: const HomeViewScreen(),
      ),
    );
  }
}
