import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? name;
  String? uid;
  String? image;
  String? email;
  List<Map<String, dynamic>>? produtos;

  User({
    this.name,
    this.uid,
    this.image,
    this.email,
    this.produtos,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "image": image,
        "email": email,
        "produtos": produtos,
      };

  static User fromSnap(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return User(
        name: dataSnapshot["name"],
        uid: dataSnapshot["uid"],
        image: dataSnapshot["image"],
        email: dataSnapshot["email"],
        produtos:dataSnapshot["produtos"]
      );
  }
}
