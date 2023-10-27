import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const NoteModel());
}

class NoteModel extends StatelessWidget {
  const NoteModel({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Note',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
