import 'package:flutter/material.dart';
import 'package:note_app/models.dart';

import 'add_notes.dart';
import 'list_of_notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            onPressed: () async {
              final newData = await Navigator.of(context)
                  .push<NoteModels>(MaterialPageRoute(
                builder: (context) => AddNotesPage(notes: notesmodels),
              ));
              setState(() {
                if (newData != null) {
                  notesmodels.add(newData);
                } else {
                  return;
                }
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: notesmodels.isEmpty
          ? const Center(
              child: Text('No Notes add it yet'),
            )
          : ListView.builder(
              itemCount: notesmodels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(notesmodels[index].title),
                  subtitle: Text(notesmodels[index].descriptions),
                );
              },
            ),
    );
  }
}
