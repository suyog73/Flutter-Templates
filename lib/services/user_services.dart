import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserServices {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Stream<List<UserModel>> getUsers() {
    return _userCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      final snapshot = await _userCollection.doc(uid).get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        return UserModel.fromJson(data);
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> addUser(UserModel userModel) async {
    try {
      await _userCollection.doc(userModel.uid).set(userModel.toJson());
      print('user added successfully');
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  Future<void> updateUserProperty(
      String uid, String propertyName, dynamic value) async {
    try {
      await _userCollection.doc(uid).set(
        {
          propertyName: value,
        },
        SetOptions(merge: true),
      );
      print('user updated successfully');
    } catch (e) {
      print('Error updating user: $e');
    }
  }
}
