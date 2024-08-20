import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _bankRadio = false;
  bool _phoneRadio = false;
  bool _webRadio = false;
  bool _smsRadio = false;

  bool get bankRadio => _bankRadio;
  bool get phoneRadio => _phoneRadio;
  bool get webRadio => _webRadio;
  bool get smsRadio => _smsRadio;
  
  set setBankRadio(bool value) {
    _bankRadio = value;
    notifyListeners();
  }

  set setPhoneRadio(bool value) {
    _phoneRadio = value;
    notifyListeners();
  }

  set setWebRadio(bool value) {
    _webRadio = value;
    notifyListeners();
  }

  set setSmsRadio(bool value) {
    _smsRadio = value;
    notifyListeners();
  }

  void spamOnSubmit(String data) {
    print(data);
  }

  bool getRadioStatus(String code) {
    bool check = false;
    switch (code) {
      case "bank":
        check = bankRadio;
      case "phone":
        check = phoneRadio;
      case "web":
        check = webRadio;
      case "sms":
        check = smsRadio;
    }
    return check;
  }
}
