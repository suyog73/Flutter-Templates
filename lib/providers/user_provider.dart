import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/user_services.dart';

class UserProvider with ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  // Get current user and store it in provider
  Future<void> fetchUser(String uid) async {
    UserModel? userModel = await UserServices().getUser(uid);

    if (userModel != null) {
      _currentUser = userModel;
      notifyListeners();
    } else {
      throw Exception('User not found!');
    }
  }

  // Update any property of current user
  Future<void> updateUserToFirebase(
      String property, dynamic value, String uid) async {
    await UserServices().updateUserProperty(uid, property, value);

    updateUserProperty(property, value);
    notifyListeners();
  }

  void updateUserProperty(String property, dynamic value) {
    if (_currentUser != null) {
      switch (property) {
        case 'name':
          _currentUser!.name = value;
          break;
        case 'prn':
          _currentUser!.prn = value;
          break;
        case 'email':
          _currentUser!.email = value;
          break;
        case 'imageUrl':
          _currentUser!.imageUrl = value;
          break;
        case 'year':
          _currentUser!.year = value;
          break;
        case 'passOutYear':
          _currentUser!.passOutYear = value;
          break;
        case 'adminCategory':
          _currentUser!.adminCategory = value;
          break;
        case 'branch':
          _currentUser!.branch = value;
          break;
        case 'uid':
          _currentUser!.uid = value;
          break;
        case 'bookmarkNotices':
          _currentUser!.bookmarkNotices = value;
          break;
        case 'isAdmin':
          _currentUser!.isAdmin = value;
          break;

        default:
          break;
      }
      notifyListeners();
    }
  }
}
