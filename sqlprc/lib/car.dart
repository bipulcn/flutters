import 'package:sqlprc/database_helper.dart';

class Cat {
  final int id;
  final String name;
  final int age;

  Cat({
    required this.id,
    required this.name,
    required this.age,
  });

  // Convert a Cat into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implement toString to make it easier to see information about
  // each cat when using the print statement.
  @override
  String toString() {
    return 'Cat{id: $id, name: $name, age: $age}';
  }
}
