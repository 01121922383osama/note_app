class ModelsNotes {
  String title;
  String description;
  ModelsNotes({
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory ModelsNotes.toJson(Map<String, dynamic> json) {
    return ModelsNotes(
      title: json['title'],
      description: json['description'],
    );
  }

  // factory ModelsNotes.fromMap(Map<String, dynamic> json) {
  //   return ModelsNotes(
  //     title: json['title'],
  //     description: json['description'],
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'title': title,
  //     'description': description,
  //   };
  // }
}

List<ModelsNotes> listNots = [];
