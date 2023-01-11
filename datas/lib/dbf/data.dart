class Note {
  final int? id;
  final String? title;
  final String? description;

  Note({this.id, required this.title, required this.description});

  Note.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        description = res["description"];
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Note{id: $id, title: $title, description: $description}';
  }
}
