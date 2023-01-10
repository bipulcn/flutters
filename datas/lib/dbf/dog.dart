class Dog {
  final int id;
  final String name;
  final int age;
  Dog({required this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  Dog.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        age = res['age'];

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age';
  }
}
