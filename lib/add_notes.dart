import 'package:flutter/material.dart';
import 'package:note_app/models.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({super.key, required this.notes});
  final List<NoteModels> notes;
  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  String addtitle = '';
  String adddescription = '';
  final GlobalKey _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
      ),
      body: Form(
        key: _globalKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      addtitle = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'add title',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      adddescription = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'add descriptions',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState != null) {
                    final newNote = NoteModels(
                        title: addtitle, descriptions: adddescription);
                    Navigator.of(context).pop(newNote);
                  }
                },
                child: const Text('Save Note'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
