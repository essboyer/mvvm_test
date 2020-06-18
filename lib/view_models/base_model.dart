import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  final Map<String, bool> _whatsbusy = {};

  bool get busy => _busy;
  set busy(bool val) {
    _busy = val;
    notifyListeners();
  }

  /// A collection of busy status'
  void whatsbusy(String key, bool val) {
    _whatsbusy.update(key, (value) => val, ifAbsent: () => val);
    notifyListeners();
  }

  /// Get the whatsbusy status
  bool getbusy(String key) {
    return _whatsbusy[key];
  }

  ///@deprecated Use busy setter
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}