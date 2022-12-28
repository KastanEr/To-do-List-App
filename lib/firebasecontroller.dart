import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/user.dart';
import 'model/todoproject.dart';
import 'model/todonotification.dart';
import 'model/todo.dart';

class FirebaseController {
  /// static accessors
  static get collection => FirebaseFirestore.instance.collection('Users');
  static get ordered => collection.orderBy('uid', descending: true);
  static get get => ordered.get();
  static get snapshots => ordered.snapshots();

  /// static methods
  // firebase query methods (add, update & delete)
  static void add(User user) => collection.add(user.toJson());
  static void update(User user) => collection.doc(user.uid).set(user.toJson());
  static void delete(String uid) => collection.doc(uid).delete();
}