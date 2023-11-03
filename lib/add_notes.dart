import 'package:flutter/material.dart';
import 'package:note_app/app_colors.dart';
import 'package:note_app/models.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({super.key});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kBlack),
        backgroundColor: kGray,
        title: const Text(
          'AddNotes',
          style: TextStyle(color: kBlack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You should add title';
                  } else {
                    return null;
                  }
                },
                cursorColor: kBlack,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: kBlack,
                    ),
                  ),
                  labelStyle: TextStyle(color: kBlack.withOpacity(0.5)),
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'You should add description';
                  } else {
                    return null;
                  }
                },
                controller: descriptionController,
                cursorColor: kBlack,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: kBlack,
                    ),
                  ),
                  labelStyle: TextStyle(color: kBlack.withOpacity(0.5)),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kGray),
                onPressed: () {
                  if (_key.currentState != null &&
                      _key.currentState!.validate() &&
                      titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    final newData = ModelsNotes(
                        title: titleController.text,
                        description: descriptionController.text);
                    Navigator.of(context).pop(newData);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
