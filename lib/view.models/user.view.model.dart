import 'package:checkgon/models/user/user.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final UserModel? _user = null;
  UserModel? get user => _user;
}
