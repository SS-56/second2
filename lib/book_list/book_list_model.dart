import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second/domain/book.dart';

class UsersPrivateModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('usersPrivate').snapshots();

  List<UsersPrivate>? usersPrivate;

  void fetchUserPrivate() {
    _usersStream.listen((QuerySnapshot snapshot) {
      final List<UsersPrivate> books =
          snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        final String userUid = data['userUid'];
        final String password = data['password'];
        final qrcode = UsersPrivate(userUid, password);
        return qrcode;
      }).toList();
      this.usersPrivate = usersPrivate;
      notifyListeners();
    });
  }
}
