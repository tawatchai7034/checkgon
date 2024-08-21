

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_state/phone_state.dart';

class CallStateViewModel extends ChangeNotifier{
    // Flag to track whether phone permission is granted
  bool granted = false;

  // Method to request phone permission
  Future<bool> requestPermission() async {
    // Request phone permission using the permission_handler package
    var status = await Permission.phone.request();

    // Update the granted flag based on the permission status
    granted = status == PermissionStatus.granted;

    // Rebuild the UI to reflect the updated permission status
    notifyListeners();

    // Return the granted flag
    return granted;
  }

  // Get the corresponding icon based on the phone state status
  IconData getIcons(PhoneStateStatus status) {
    switch (status) {
      case PhoneStateStatus.NOTHING:
        return Icons.clear;
      case PhoneStateStatus.CALL_INCOMING:
        return Icons.add_call;
      case PhoneStateStatus.CALL_STARTED:
        return Icons.call;
      case PhoneStateStatus.CALL_ENDED:
        return Icons.call_end;
    }
  }

  // Get the corresponding color based on the phone state status
  Color getColor(PhoneStateStatus status) {
    switch (status) {
      case PhoneStateStatus.NOTHING:
      case PhoneStateStatus.CALL_ENDED:
        return Colors.red;
      case PhoneStateStatus.CALL_INCOMING:
        return Colors.green;
      case PhoneStateStatus.CALL_STARTED:
        return Colors.orange;
    }
  }
}