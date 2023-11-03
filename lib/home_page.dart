import 'package:flutter/material.dart';
import 'package:note_app/add_notes.dart';
import 'package:note_app/models.dart';

import 'app_colors.dart';
import 'detalis.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void deleteItem(int index) {
    setState(() {
      listNots.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGray,
        title: const Text(
          'NotsApp',
          style: TextStyle(
            color: kBlack,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listNots.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(
                          title: listNots[index].title,
                          desc: listNots[index].description,
                        )));
              },
              title: Text(
                listNots[index].title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              subtitle: Text(
                listNots[index].description,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              leading: CircleAvatar(
                backgroundColor: kGray,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: kBlack),
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: kGray,
                child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: kGray,
                            content: const Text('Are you sure...?'),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.red.withOpacity(0.5)),
                                    onPressed: () {
                                      deleteItem(index);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.green.withOpacity(0.5)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    )),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kGray,
        onPressed: () async {
          final data = await Navigator.of(context).push<ModelsNotes>(
              MaterialPageRoute(builder: (context) => const AddNotesPage()));
          if (data != null) {
            setState(() {
              listNots.add(data);
            });
          }
        },
        child: const Icon(
          Icons.add,
          color: kBlack,
        ),
      ),
    );
  }
}
