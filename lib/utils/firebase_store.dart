import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:timeago/timeago.dart';

class Firestore {
  // final String fullName;
  // final String company;
  // final int age;
  final String email;

  final time = DateTime.now();

  // AddUser(this.fullName, this.company, this.age , this.email);
  Firestore(this.email);

  Future<void> addChore(
      String fullName, String chore, double rating, double span) {
    CollectionReference users = FirebaseFirestore.instance.collection(email);
    // Call the user's CollectionReference to add a new user
    return users
        .add(
      {
        'type': 'Record',
        'name': fullName,
        'chore': chore, // John Doe
        'rating': rating, // Stokes and Sons
        'span': span,
        'time': time
      },
    )
        .then((value) => print("Record Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addTodo(String fullName, String chore, String note) {
    CollectionReference users = FirebaseFirestore.instance.collection(email);
    if (note.isEmpty) {
      note = "";
    }
    // Call the user's CollectionReference to add a new user
    return users
        .add({

      'type': 'Todo',
      'name': fullName,
      'chore': chore, // John Doe
      'Note': note,
      'time': time,
    })
        .then((value) => print("Todo Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
