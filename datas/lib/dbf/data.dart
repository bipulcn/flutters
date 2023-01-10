class Note {
  int? id;
  String? title;
  String? description;

  Note({this.id, required this.title, required this.description});
  // Note.fromMap(Map<String, dynamic> map) {
  //   id = map['id'];
  //   title = map['title'];
  //   description = map['description'];
  // }
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

  // String get name => this.title;

  // Map<String, dynamic> toMap() {
  //   return {
  //     DatabaseHelper.columnId: id,
  //     DatabaseHelper.columnTitle: title,
  //     DatabaseHelper.columnDescription: description,
  //   };
  // }

  // Implement toString to make it easier to see information about
  // each Note when using the print statement.
  @override
  String toString() {
    return 'Note{id: $id, title: $title, description: $description}';
  }
}
